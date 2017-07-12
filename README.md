# docker-remote_syslog2

## How to use this image
```sh
docker run --name my-remote-syslog -v /my/log_files.yml:/etc/opt/remote_syslog/log_files.yml:ro -d marcsensenich/remote_syslog2:v0.19
```
