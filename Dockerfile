FROM golang:1.11.4-alpine3.8 AS envir

RUN apk --no-cache add git gcc musl-dev 

WORKDIR /github/peacedeat-h
RUN git clone https://github.com/peacedeat-h/chat.git
WORKDIR /github/peacedeat-h/chat
RUN go mod init
RUN go mod tidy
RUN go build -o /app .

FROM alpine:3.8
COPY --from=envir /app /app
ENTRYPOINT ["/app"]