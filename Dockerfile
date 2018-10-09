FROM node:latest as node
WORKDIR /app
COPY . .
RUN npm install
RUN npm run generate

FROM nginx:alpine
COPY --from=node /app/dist /usr/share/nginx/html