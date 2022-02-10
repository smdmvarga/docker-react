FROM node:17-alpine3.15 as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx:1.21.6
COPY --from=builder /app/build /usr/share/nginx/html