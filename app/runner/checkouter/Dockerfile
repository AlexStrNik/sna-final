FROM alpine
RUN apk add --no-cache git

COPY ./checkout.sh /.checkout.sh

RUN mkdir sources
WORKDIR sources

ENTRYPOINT ["/bin/sh", "/.checkout.sh"]
