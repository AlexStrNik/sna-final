FROM alpine
RUN apk add --no-cache git

COPY checkout.sh .
RUN chmod +x checkout.sh

ENTRYPOINT ["checkout.sh"]
