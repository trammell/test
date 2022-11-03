FROM ubuntu:latest
# Set the SUID bit on whoami
RUN chmod u+s /usr/bin/whoami
# Create an example user and set it as the default
RUN adduser --system --no-create-home --disabled-password --disabled-login \

# unset SUID, SGID permissions on all files in the image
# RUN for i in $(find / -type f \( -perm /u=s -o -perm /g=s \)); do chmod ug-s $i; done

    --shell /bin/sh example
USER example
# Set the default to compare the container user and
# the effective user for whoami
CMD  printf "Container running as:          %s\n" $(id -u -n) && \
     printf "Effectively running whoami as: %s\n" $(whoami)
