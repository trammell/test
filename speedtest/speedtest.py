import datetime
import os
import re
import subprocess
import time
from influxdb import InfluxDBClient

"""
https://pimylifeup.com/raspberry-pi-internet-speed-monitor/#synctografana
"""


def get_results() -> Tuple[float, float, float, float, float]:
    """
    Call /usr/bin/speedtest and parse out the results.
    Return a tuple containing (latency, jitter, download, upload).
    We use SI units in this house:
      * Latency and jitter are measured in seconds.
      * Upload and download are measured in bits per second.
    """

    start_time = time.time()
    response = subprocess.Popen('/usr/bin/speedtest --accept-license --accept-gdpr',
        shell=True, stdout=subprocess.PIPE).stdout.read().decode('utf-8')
    duration = time.time() - start_time

    latency = re.search('Latency:\s+(.*?)\s', response, re.MULTILINE)
    jitter = re.search('Latency:.*?jitter:\s+(.*?)ms', response, re.MULTILINE)
    download = re.search('Download:\s+(.*?)\s', response, re.MULTILINE)
    upload = re.search('Upload:\s+(.*?)\s', response, re.MULTILINE)

    latency = 1000.0 * latency.group(1)         # convert to seconds
    jitter = 1000.0 * jitter.group(1)           # convert to seconds
    download = 1000000.0 * download.group(1)    # convert to bits/second
    upload = 1000000.0 * upload.group(1)        # convert to bits/second
    return (latency, jitter, download, upload, duration)


def persist(latency: float, jitter: float, download: float, upload: float, duration: float):
    measurement = {
        "measurement": "speedtest",
        "tags": {
            "host": "furby",
        },
        "fields" : {
            "latency": latency,
            "jitter": jitter,
            "download": download,
            "upload": upload,
        },
    }
    client = InfluxDBClient('localhost', 8086, 'speedmonitor', 'pimylifeup', 'internetspeed')
    client.write_points(speed_data)


def main():
    latency, jitter, download, upload, duration = get_results()
    timestamp = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    print(f'{timestamp} {latency=}s {jitter=}s {download=}b/s {upload=}b/s {duration=}s')
    persist(latency, jitter, download, upload, duration)


if __name__ == "__main__":
    main()


