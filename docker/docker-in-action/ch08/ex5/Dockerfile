FROM nginx:1.13-alpine
# FROM debian@sha256:ef7ea88495687d7100a8a7ab71976dd28eec274b0210cfbfed6def915a10715c

HEALTHCHECK --interval=5s --retries=2 \
  CMD nc -vz -w 2 localhost 80 || exit 1
