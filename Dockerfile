FROM node:alpine as builder
WORKDIR '/data'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /data/build /usr/share/nginx/html
