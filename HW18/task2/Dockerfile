FROM ubuntu AS ubuntu_file
RUN echo "Why does it work from Alpine?" > ubuntuone

FROM alpine
COPY --from=ubuntu_file ubuntuone .
CMD ["cat", "ubuntuone"]  
