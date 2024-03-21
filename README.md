# WE

server {
    listen 443 default_server ssl http2;
    listen [::]:443 ssl http2;
    server_name 164.92.110.73;
    ssl_certificate /etc/nginx/ssl/live/164.92.110.73/fullchain.pem;
    ssl_certificate_key /etc/nginx/ssl/live/164.92.110.73/privkey.pem;
    location / {
    	proxy_pass http://164.92.110.73;
    }
}