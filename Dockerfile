FROM alpine:3.6

MAINTAINER Marc Sensenich "hello@marc-sensenich.com"

ENV REMOTE_SYSLOG2_VERSION v0.19

RUN apk add --no-cache curl \
    && curl -fSL https://github.com/papertrail/remote_syslog2/releases/download/$REMOTE_SYSLOG2_VERSION/remote_syslog_linux_amd64.tar.gz -o remote_syslog2.tar.gz \
    && tar -zxC /tmp -f remote_syslog2.tar.gz \
    && mv /tmp/remote_syslog/remote_syslog /usr/bin \
    && mkdir /etc/opt/remote_syslog \
    && mv /tmp/remote_syslog/example_config.yml /etc/opt/remote_syslog/log_files.yml \    
    && rm -rf /tmp/remote_syslog \
    && rm remote_syslog2.tar.gz \
    && apk del --no-cache --purge curl

VOLUME /etc/opt/remote_syslog

CMD ["remote_syslog", "--no-detach", "--configfile", "/etc/opt/remote_syslog/log_files.yml"]
