FROM alpine:latest

EXPOSE 1502

COPY . /opt
RUN chmod +x /opt/build.sh
RUN chmod +x /opt/entrypoint.sh
RUN /opt/build.sh

ENTRYPOINT [ "/sbin/tini", "--", "/opt/entrypoint.sh" ]

