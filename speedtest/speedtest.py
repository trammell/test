import argparse
import datetime
import os
import re
import subprocess
import time
from typing import Tuple

from influxdb_client_3 import InfluxDBClient3, Point



TOKEN = os.environ["INFLUXDATA_PAT"]



"""
Relevant documents:

* https://pimylifeup.com/raspberry-pi-internet-speed-monitor/
* https://pimylifeup.com/raspberry-pi-internet-speed-monitor/#synctografana
* https://github.com/InfluxCommunity/influxdb3-python
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

    latency = 0.0001 * float(latency.group(1))         # convert to seconds
    jitter = 0.0001 * float(jitter.group(1))           # convert to seconds
    download = 1000000.0 * float(download.group(1))    # convert to bits/second
    upload = 1000000.0 * float(upload.group(1))        # convert to bits/second
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
    client = InfluxDBClient3(token=TOKEN,
                             host="https://us-east-1-1.aws.cloud2.influxdata.com",
                             org="network",
                             database="speedtest")

    pt = (Point("measurement").tag("location", "meowmeownet").tag("host", "furby")
          .field("latency", latency).field("jitter",jitter))

    client.write(pt)



def _timestamp() -> str:
    return datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")


def main():
    """

    """
    latency, jitter, download, upload, duration = get_results()
    timestamp = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    print(f'{timestamp} {latency=}s {jitter=}s {download=}b/s {upload=}b/s {duration=}s')
    persist(latency, jitter, download, upload, duration)


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("-n", "--dry-run", action="store_true",
                        help="Don't actually run the speed test (use dummy values).")
    args = parser.parse_args()
    if args.dry_run:
        latency, jitter, download, upload, duration = (0.01, 0.001, 500001, 500002, 1.5)
        timestamp = _timestamp()
        print(f'{timestamp} {latency=}s {jitter=}s {download=}b/s {upload=}b/s {duration=}s')
        persist(latency, jitter, download, upload, duration)
    else:
        main()

