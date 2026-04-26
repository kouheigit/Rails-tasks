.PHONY: build up down restart logs shell console db test lint

build:
	docker compose build

up:
	docker compose up

down:
	docker compose down

restart:
	docker compose down
	docker compose up

logs:
	docker compose logs -f

shell:
	docker compose run --rm web bash

console:
	docker compose run --rm web bin/rails console

db:
	docker compose run --rm web bin/rails db:prepare

test:
	docker compose run --rm web bin/rails test

lint:
	docker compose run --rm web bin/rubocop
