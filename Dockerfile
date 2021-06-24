FROM node:latest

WORKDIR /data/app

COPY . .

CMD [ "node", "server/server.js" ]