FROM alpine:latest

EXPOSE 502

COPY . /opt
RUN chmod +x /opt/build.sh
RUN /opt/build.sh

ENTRYPOINT ["/opt/mbusd", "-d", "-L", "-", "-c", "/opt/mbusd.conf"]
