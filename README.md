# Projeto Orders

## Instruções para inicializar o ambiente

1. **Suba os containers com Docker Compose**:

```bash
docker compose up -d
```

2. **Execute as migrations para criar as tabelas no banco de dados**:

```bash
migrate -path=sql/migrations -database="mysql://root:root@tcp(localhost:3306)/orders" -verbose up
```

---

## Requisitos

- Docker e Docker Compose instalados
- Ferramenta [`migrate`](https://github.com/golang-migrate/migrate) instalada

## Notas

- Certifique-se de que o serviço do banco de dados (MySQL) esteja rodando corretamente antes de aplicar as migrations.
- As credenciais (`root:root`) e a porta (`3306`) podem ser ajustadas no arquivo `docker-compose.yml` se necessário.

## HTTP REST

- Para fazer a requisição de listagem das ordens, basta fazer um GET http://localhost:8000/order

## GRPC

- Para o GRPC, use o Evans -> service pb -> service OrderService -> Call ListOrders

## GRAPHQL

- Para o GraphQL, entre em http://localhost:8080

```
query {
  listOrders {
    id
    Price
    Tax
    FinalPrice
  }
}
```
