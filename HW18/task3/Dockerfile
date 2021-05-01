FROM alpine
RUN apk update && \
    apk --no-cache add curl && \
    apk --no-cache add tcpdump && \
    apk --no-cache add tcptraceroute && \
    apk --no-cache add netcat-openbsd && \
    apk --no-cache add vim && \
    apk --no-cache add mysql && \
    apk --no-cache add python3 && \
    apk --no-cache add go && \
    rm -rf /var/cache/apk/*
