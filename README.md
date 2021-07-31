# spring-boot-docker
Attempt at building a Spring Boot development environment in Docker

## Build the development image
```bash
PRJ="./project" DOTGRADLE="./project/.dockerdev/.gradle" docker compose build dev
```

## Run the dev service for development
```bash
USER=$(whoami) USERID=$(id -u) PRJ="./project" DOTGRADLE="./project/.dockerdev/.gradle" docker compose run --rm -p 8080:8080 dev /bin/bash
```

Or use the `startdev` script.
```bash
startdev ./someproject
```

## Build the test/production image
```bash
DOTGRADLE=./project/.dockerdev/.gradle USER=$(whoami) USERID=$(id -u) docker compose build builder
```

## Run the test/production service
```bash
DOTGRADLE=./project/.dockerdev/.gradle docker compose run --rm -p 8080:8080 spring
```

## Run from the image
```bash
docker run --rm -p 8080:8080 hdalemcbane/spring-build:latest
```
