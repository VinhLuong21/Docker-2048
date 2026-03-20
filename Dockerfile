FROM nginx:alpine

RUN apk add --no-cache git

RUN git clone https://github.com/gabrielecirulli/2048.git /tmp/2048 && \
    rm -rf /usr/share/nginx/html/* && \
    cp -r /tmp/2048/* /usr/share/nginx/html/ && \
    rm -rf /tmp/2048

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
