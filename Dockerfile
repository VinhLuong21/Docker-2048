# Sử dụng Nginx (Web Server) siêu nhẹ làm nền tảng
FROM nginx:alpine

# Cài đặt git để tải code
RUN apk add --no-cache git

# Tự động tải Source code Game 2048 gốc từ GitHub và đưa vào thư mục chứa Web của Nginx
RUN git clone https://github.com/gabrielecirulli/2048.git /tmp/2048 && \
    rm -rf /usr/share/nginx/html/* && \
    cp -r /tmp/2048/* /usr/share/nginx/html/ && \
    rm -rf /tmp/2048

# Mở Port 80
EXPOSE 80

# Chạy Nginx Server
CMD ["nginx", "-g", "daemon off;"]