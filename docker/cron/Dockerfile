FROM debian:12-slim
LABEL org.opencontainers.image.authors="john.trammell@gmail.com"

# Create the log file to be able to run tail
RUN touch /var/log/cron.log

# Create the system crontab file
COPY <<EOF /etc/cron.d/hello-cron
# run as root once per minute
* * * * * root echo "Hello world" >> /var/log/cron.log 2>&1
EOF

# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/hello-cron

# Install cron
RUN <<EOF
apt-get update
apt-get -y install cron
EOF

# Run the command on container startup
CMD ["/bin/sh", "-c", "cron && tail -f /var/log/cron.log"]
