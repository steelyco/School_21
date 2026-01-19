FROM nginx:1.29

WORKDIR /home

RUN apt update && apt install -y libfcgi-dev gcc spawn-fcgi 

COPY ./server.c ./server.c

COPY ./nginx/nginx.conf /etc/nginx/

COPY ./start.sh ./start.sh

ENTRYPOINT ["bash", "./start.sh"]
