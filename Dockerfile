FROM node:14 as build

WORKDIR /app

COPY . .

RUN npm install && \
    npm run build && \
    mkdir -p /usr/share/nginx && \
    mv build/site /usr/share/nginx/html && \
    rm -rf /app


FROM nginx:alpine

COPY --from=build /usr/share/nginx/html /usr/share/nginx/html
