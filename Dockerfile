FROM node:20.11-alpine

RUN apk update && apk add bash

ARG APP_PORT

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY . .

COPY wait-for-it.sh /usr/src/app/wait-for-it.sh

RUN npx prisma generate

EXPOSE ${APP_PORT}

CMD ["npm", "run", "start"]