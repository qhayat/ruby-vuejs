FROM node:lts-alpine

WORKDIR /app

COPY package*.json ./

RUN yarn install

EXPOSE 8080
CMD [ "yarn", "serve" ]