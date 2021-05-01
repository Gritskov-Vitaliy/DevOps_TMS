FROM alpine
RUN apk update && \
    apk --no-cache add curl tcpdump tcptraceroute netcat-openbsd vim mysql python3 go && \
    rm -rf /var/cache/apk/*
