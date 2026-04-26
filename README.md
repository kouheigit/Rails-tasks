# Rails Tasks

Docker + Rails + MySQL の開発環境です。

## Versions

- Ruby: 4.0.3
- Rails: 8.1.3
- MySQL: `mysql:latest` with Compose `pull_policy: always`

## Start

```bash
docker compose up --build
```

アプリケーション:

```text
http://localhost:3000
```

初回起動時に `bin/rails db:prepare` を実行し、development/test DB を準備します。

## Commands

```bash
make up       # start Rails + MySQL
make down     # stop containers
make shell    # open shell in Rails container
make console  # Rails console
make db       # prepare database
make test     # run test suite
make lint     # run RuboCop
```

## Database

Default development connection:

```text
host: db
port: 3306
username: root
password: password
database: rails_tasks_development
```

The MySQL container is exposed to the host at `localhost:3307` to avoid conflicts with local MySQL on `3306`.

Local overrides can be copied from `.env.example` if needed.

## Production Image

Rails generated a production-ready `Dockerfile`. Development uses `Dockerfile.dev` through Compose.
