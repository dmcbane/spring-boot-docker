# spring-boot-docker
Attempt at building a Spring Boot development environment in Docker

## Build the image
```
docker compose build dev
```

## Run the dev service for development
```
USER=$(whoami) USERID=$(id -u) docker compose run --rm -p 8080:8080 dev /bin/bash
```
