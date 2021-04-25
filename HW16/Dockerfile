FROM ubuntu
RUN apt-get update && apt-get install -y iputils-ping && rm -rf /var/lib/apt/lists/*
COPY script.sh .
RUN chmod 755 script.sh
ENTRYPOINT [ "./script.sh" ]
