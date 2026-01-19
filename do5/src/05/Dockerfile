FROM nginx:02

WORKDIR /home

RUN apk add --no-cache musl-dev fcgi-dev gcc spawn-fcgi 

COPY ./server.c ./server.c

COPY ./nginx/nginx.conf /etc/nginx/

COPY ./start.sh ./start.sh

USER nginx

EXPOSE 8080

ENTRYPOINT ["sh", "./start.sh"]

HEALTHCHECK NONE
