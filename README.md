# Bills Generator

[![js-standard-style](https://img.shields.io/badge/code%20style-standard-brightgreen.svg?style=flat)](https://github.com/feross/standard)

![видео работы](https://raw.githubusercontent.com/drakmail/bills-generator/master/site/screen.gif)

Генератор счетов для Российских компаний. Позволяет быстро и просто создавать счета для выставления.

## Запуск локально

```
git clone git@github.com:drakmail/bills-generator.git
npm install
node app.js
```

## Запуск в режиме "Только API"

Для отключения веб-версии сервиса и работе только в формате API нужно передать переменную среды `API_MODE` с любым значением.

Для получения PDF надо отправить POST запрос на адрес `/request` с multipart form data следующего содержания:

```
bill # номер счёта
name # название компании
inn # ИНН компании
kpp # КПП компании
address # адрес компании
services[0][name] # название услуги
services[0][amount] # кол-во единиц услуги
services[0][price] # стоимость услуги
```

## Конфигурационный файл

Для указания информации о компании-исполнителе используется конфигурационный файл `config/config.json`. Его формат прост:

```json
{
  "bank": {
    "name": "ПАО \"СБЕРБАНК РОССИИ\" Г.МОСКВА",
    "bik": "000000000",
    "ks": "00000000000000000000"
  },
  "company": {
    "name": "ООО \"Рога и Копыта\"",
    "address": "г. Москва, ул. Крылова, д. 5",
    "inn": "0000000000",
    "kpp": "000000000",
    "rs": "00000000000000000000",
    "director": "Иванов И. И."
  },
  "dadata": "API_KEY"
}
```

## Деплой

Приложение деплоится как обычное node.js. Рекоммендуется использовать [mina](https://github.com/CenturyUna/mina).

Пример конфигурационного файла для nginx-passenger:

```
server {
    listen 80;

    server_name bills.your-domain.com;

    access_log  /var/log/nginx/bills-access;
    error_log   /var/log/nginx/bills-error;

    client_max_body_size       1m;
    client_body_buffer_size    512k;

    root /var/www/bills/current/public;

    proxy_redirect off;

    passenger_enabled on;
    passenger_min_instances 1;
}
```

## Участие в проекте

Если вы нашли ошибку, исправили ошибку, у вас есть предложение по улучшению функциональности – действуйте как обычно – создавайте тикеты, шлите pull request :)
