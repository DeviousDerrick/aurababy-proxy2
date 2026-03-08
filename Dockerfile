FROM node:18-alpine

ENV NODE_ENV=production
ARG NPM_BUILD="npm install --omit=dev"

WORKDIR /app

COPY package*.json ./

RUN apk add --upgrade --no-cache python3 make g++
RUN $NPM_BUILD

COPY . .

EXPOSE 8000

CMD ["node", "src/index.js"]
