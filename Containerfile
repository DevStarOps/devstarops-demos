FROM docker.io/library/nginx:stable-alpine

COPY src/ /www/demos/
COPY nginx.conf /etc/nginx/nginx.conf
