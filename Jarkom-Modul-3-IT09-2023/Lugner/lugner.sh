echo '192.168.122.1' > '/etc/resolv.conf'

apt-get update

apt-get install php php-fpm -y

apt-get install nginx -y

wget --no-check-certificate 'https://drive.google.com/u/0/uc?id=1ViSkRq7SmwZgdK64eRbr5Fm1EGCTPrU1&export=download&confirm=yes' -O /var/www/jarkom

unzip /var/www/jarkom -d /var/www/

echo '
server {

listen 80;

root /var/www/riegel.canyon.it09.com;

index index.php index.html index.htm;
server_name _;

location / {
        try_files $uri $uri/ /index.php?$query_string;
}

# pass PHP scripts to FastCGI server
location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/var/run/php/php7.3-fpm.sock;
}

location ~ /\.ht {
        deny all;
}

error_log /var/log/nginx/riegel.canyon.it09.com_error.log;
access_log /var/log/nginx/riegel.canyon.it09.com_access.log;
}
' > /etc/nginx/sites-available/granz.channel.it09.com

ln -s /etc/nginx/sites-available/granz.channel.it09.com /etc/nginx/sites-enabled

rm /etc/nginx/sites-enabled/default

service php7.3-fpm start

service nginx restart