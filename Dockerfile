FROM alpine:3.21

RUN apk --no-cache add bash git

COPY entrypoint.sh /entrypoint.sh
COPY .git .

ENTRYPOINT ["/entrypoint.sh"]
