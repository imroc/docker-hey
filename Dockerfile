FROM golang:alpine as installer

RUN go install github.com/rakyll/hey@v0.1.4

FROM alpine:latest

COPY --from=installer /go/bin/hey /usr/local/bin/hey

ENTRYPOINT ["/usr/local/bin/hey"]
