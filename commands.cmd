podman build -f .\Containerfile -t demos

podman stop -a

podman exec -it d2c0efc761b4acd0b7fd3bc44a6c07c12c74d9a16c5655a6c5aa4f86f5859cb9 /usr/sbin/nginx -s reload

podman run -p 8102:80 --name demos --restart unless-stopped --replace --tls-verify -d -v nginx.conf:/etc/nginx/nginx.conf -v ./resources/access.log:/var/log/nginx/access.log -v ./resources/error.log:/var/log/nginx/error.log -v ./resources/:/var/demos/ -v ./src/:/www/demos/ localhost/demos:latest
