# This should generate an error--non-privileged user does not have perms to
# bind to system port 80.
FROM busybox:1.29
USER 1000:1000
ENTRYPOINT ["nc"]
CMD ["-l", "-p", "80", "0.0.0.0"]
