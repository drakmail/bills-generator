FROM node:8.1.2
MAINTAINER Alexander Maslov "drakmail@gmail.com"

ADD . /app

WORKDIR /app

COPY ./private_config_*.json /app/config/config.json

RUN npm install

EXPOSE 8080

CMD node /app/app.js
