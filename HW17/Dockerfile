FROM ubuntu
RUN apt update && apt install -y docker.io && rm -rf /var/lib/apt/lists/*
COPY script.sh .
RUN chmod 755 script.sh
ENTRYPOINT ["./script.sh" ]
