echo 'nameserver 192.168.122.1' > /etc/resolv.conf

apt-get update
apt-get install apache2-utils -y
apt-get install nginx -y
apt-get install lynx -y

service nginx start

cp /etc/nginx/sites-available/default /etc/nginx/sites-available/granz.channel.it09.com

mkdir /etc/nginx/rahasisakita

htpasswd -c /etc/nginx/rahasisakita/htpasswd netics

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
        allow 10.68.3.69;
        allow 10.68.3.70;
        allow 10.68.4.167;
        allow 10.68.4.168;
        deny all;

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

ln -s /etc/nginx/sites-available/granz.channel.it09.com /etc/nginx/sites-enabled/
rm /etc/nginx/sites-enabled/default

service nginx restart