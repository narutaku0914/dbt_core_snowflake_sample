FROM python:3.9.12-slim-bullseye

RUN apt-get update \
  && apt-get dist-upgrade -y \
  && apt-get install -y \
    vim git \
  && apt-get clean \
  && rm -rf \
    /var/lib/apt/lists/* \
    /tmp/* \
    /var/tmp/*

ENV PYTHONIOENCODING=utf-8
ENV LANG=C.UTF-8

RUN python -m pip install --upgrade pip
RUN python -m pip install dbt-snowflake

COPY ./profiles.yml /root/.dbt/profiles.yml
WORKDIR /usr/app/dbt/

ENTRYPOINT tail -f /dev/null