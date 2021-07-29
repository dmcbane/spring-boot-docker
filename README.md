# spring-boot-docker
Attempt at building a Spring Boot development environment in Docker

## Build the image
```bash
PRJ="./project" DOTGRADLE="./project/.dockerdev/.gradle" docker compose build dev
```

## Run the dev service for development
```bash
USER=$(whoami) USERID=$(id -u) PRJ="./project" DOTGRADLE="./project/.dockerdev/.gradle" docker compose run --rm -p 8080:8080 dev /bin/bash
```
