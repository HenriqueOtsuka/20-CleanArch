FROM golang:1.24-alpine AS builder

WORKDIR /app

RUN apk add --no-cache git

COPY go.mod go.sum ./
RUN go mod download

COPY . .

RUN go build -o ordersystem ./cmd/ordersystem/main.go ./cmd/ordersystem/wire_gen.go

FROM alpine:latest

WORKDIR /app

COPY --from=builder /app/ordersystem .

COPY cmd/ordersystem/.env .env

COPY scripts/wait-for-it.sh /usr/local/bin/wait-for-it
RUN chmod +x /usr/local/bin/wait-for-it

CMD ["sh", "-c", "wait-for-it mysql 3306 -- wait-for-it rabbitmq 5672 -- ./ordersystem"]

