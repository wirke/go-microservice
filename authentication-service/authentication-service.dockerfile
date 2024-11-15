FROM golang:1.23-alpine AS builder

WORKDIR /app

COPY go.mod go.sum ./

RUN go mod tidy

COPY cmd/api /app/cmd/api

RUN GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -o authApp ./cmd/api

FROM alpine:latest

RUN mkdir /app

COPY --from=builder /app/authApp /app/

CMD ["/app/authApp"]
