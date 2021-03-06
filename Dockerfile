FROM node:alpine AS builder

WORKDIR /usr/app
COPY package.json .
RUN npm i
COPY . .

RUN npm run build

FROM nginx:alpine
COPY --from=builder /usr/app/build /usr/share/nginx/html