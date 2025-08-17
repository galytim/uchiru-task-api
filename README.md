# Uchiru Task Service API

API для работы со школами, классами и студентами.  
Проект на **Ruby on Rails**, тесты — **RSpec**, документация — **Swagger (OpenAPI 3.0.3)** через [rswag](https://github.com/rswag/rswag).


## Сборка контейнера

```bash
docker compose build
```
## Подготовка базы данных

```bash
docker compose exec rails db:setup
```
## Запуск

```bash
docker compose up
```
