FROM adoptopenjdk:11-jdk-openj9-focal as build

ARG USER
ARG USERID

## RUN apt-get update -qq && DEBIAN_FRONTEND=noninteractive apt-get -yq dist-upgrade && \
##   DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends \
RUN apt-get update && \
  ## DEBIAN_FRONTEND=noninteractive apt-get -y dist-upgrade && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
  fontconfig \
  unzip \
  wget \
  git \
  git-lfs \
  openssh-client \
  vim \
  && apt-get clean \
  && rm -rf /var/cache/apt/archives/* \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
  && truncate -s 0 /var/log/*log

RUN mkdir /app && mkdir /dotgradle
RUN \
  ## if [[ $USERID -ne 1000 ]] ; then \
  set -o errexit -o nounset \
  && echo "Adding internal user and group" \
  && groupadd --system --gid $USERID $USER \
  && useradd --system --gid $USERID --uid $USERID --shell /bin/bash --create-home $USER \
  && ln -s /dotgradle /home/$USER/.gradle \
  && chown --recursive $USER:$USER /home/$USER
##  fi
WORKDIR /app
## COPY ./project /app/
RUN chown -R $USERID:$USERID /app
USER $USERID
CMD tail -f /dev/null

# https://snyk.io/blog/docker-for-java-developers/
# https://github.com/keeganwitt/docker-gradle/blob/e1e5d8d814938022d495bf76d74ebc945412eb0a/hotspot/jre11/Dockerfile

# FROM docker pull adoptopenjdk:11-jre-openj9-focal
# RUN set -o errexit -o nounset \
#     && echo "Adding gradle user and group" \
#     && groupadd --system --gid 1000 gradle \
#     && useradd --system --gid gradle --uid 1000 --shell /bin/bash --create-home gradle \
#     && mkdir /home/gradle/.gradle \
#     && chown --recursive gradle:gradle /home/gradle \
#     \
#     && echo "Symlinking root Gradle cache to gradle Gradle cache" \
#     && ln -s /home/gradle/.gradle /root/.gradle


# RUN apt-get update \
#     && apt-get install --yes --no-install-recommends \
#         fontconfig \
#         unzip \
#         wget \
#         git \
#         git-lfs \
#         openssh-client \
#     && rm -rf /var/lib/apt/lists/*
