echo ' upstream worker {
    server 10.68.3.1;
    server 10.68.3.2;
    server 10.68.3.3;
}

server {
    listen 80;
    server_name granz.channel.it09.com www.granz.channel.it09.com;

    root /var/www/html;

    index index.html index.htm index.nginx-debian.html;

    server_name _;

    location / {
        proxy_pass http://myweb;
        auth_basic "Restricted Content";
        auth_basic_user_file /etc/nginx/rahasisakita/.htpasswd;
    }

    location /its {
        proxy_pass https://www.its.ac.id;
		proxy_set_header Host www.its.ac.id;
		proxy_set_header X-Real-IP $remote_addr;
		proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
		proxy_set_header X-Forwarded-Proto $scheme;
    }
} ' > /etc/nginx/sites-available/granz.channel.it09.com

service nginx restart