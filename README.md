# spring-boot-docker
Attempt at building a Spring Boot development environment in Docker

## Build the development image
```bash
docker compose build dev
```

## Run the dev service for development
```bash
USER=$(whoami) USERID=$(id -u) docker compose run --rm -p 8080:8080 -v ./project:/app -v ./project/.dockerdev/.gradle:/dotgradle dev /bin/bash
```

Or use the `startdev` script.
```bash
startdev ./someproject
```

## Build the test/production image
```bash
cd ./project
USER=$(whoami) USERID=$(id -u) docker compose build builder
cd ..
```

## Run the test/production service
```bash
docker compose run --rm -p 8080:8080 spring
```

## Run from the image
```bash
docker run --rm -p 8080:8080 hdalemcbane/spring-build:latest
```
