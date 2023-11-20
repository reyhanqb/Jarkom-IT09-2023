# Jarkom-Modul-3-IT09-2023

## Anggota
Muhammad Hilmy Adhi Pradityo - 5027211053

Athaya Reyhan Nugroho - 5027211067

## Pengerjaan

### Topologi
![App Screenshot](https://i.ibb.co/kKS9HxR/Whats-App-Image-2023-11-16-at-20-43-46.jpg)

### Soal 1
Setelah konfigurasi ip dan setup, kita perlu register domain `riegel.canyon.it09.com` untuk worker Laravel dan `granz.channel.it09.com` untuk worker PHP. Pada DNS Server (Heiter) masukkan script berikut:
```
echo '
zone "riegel.canyon.it09.com" {
        type master;
        file "/etc/bind/jarkom/riegel.canyon.it09.com";
};

zone "granz.channel.it09.com" {
        type master;
        file "/etc/bind/jarkom/granz.channel.it09.com";
};

' > /etc/bind/named.conf.local

mkdir /etc/bind/jarkom
cp /etc/bind/db.local /etc/bind/jarkom/riegel.canyon.it09.com

echo '
;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     riegel.canyon.it09.com. root.riegel.canyon.it09.com. (
                        2023101001      ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      riegel.canyon.it09.com.
@       IN      A       10.68.4.6     ; IP Fern
www     IN      CNAME   riegel.canyon.it09.com.' > /etc/bind/jarkom/riegel.canyon.it09.com

cp /etc/bind/db.local /etc/bind/jarkom/granz.channel.it09.com.

echo '
;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     granz.channel.it09.com. root.granz.channel.it09.com. (
                        2023101001      ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      granz.channel.it09.com.
@       IN      A       10.68.3.2   ; IP Lugner
www     IN      CNAME   granz.channel.it09.com.' > /etc/bind/jarkom/granz.channel.it09.com

service bind9 restart
```
#### Output
![App Screenshot](https://i.ibb.co/0JX2dZ7/no-1.jpg)
![App Screenshot](https://i.ibb.co/9trj9Bc/no-1-sisan.jpg)

### Soal 2
Kita perlu setup agar Client yang melalui Switch3 mendapatkan range IP dari 10.68.3.16 - 10.68.3.32 dan 10.68.3.64 - 10.68.3.80. Pada DHCP Server (Himmel) tambahkan script berikut:
```
echo '
subnet '10.68.1.0' netmask '255.255.255.0' {
    option routers '10.68.1.1';
}

subnet '10.68.3.0' netmask '255.255.255.0' {
        range '10.68.3.16' '10.68.3.32';
        range '10.68.3.48' '10.68.3.60';
        option routers '10.68.3.1';
}
' > /etc/dhcp/dhcpd.conf
```

#### Output
![REVOLTE-CLIENT](https://github.com/reyhanqb/Jarkom-IT09-2023/assets/107137535/4fdf4310-1995-4b68-9341-a0eeef7efba7)

### Soal 3
Kita perlu setup agar Client yang melalui Switch4 mendapatkan range IP dari 10.68.4.12 - 10.68.4.20 dan 10.68.4.160 - 10.68.4.168. Pada DHCP Server (Himmel) tambahkan script berikut:
```
echo '
subnet '10.68.2.0' netmask '255.255.255.0' {
    option routers '10.68.2.1';
}

subnet '10.68.4.0' netmask '255.255.255.0' {
        range 10.68.4.12 10.68.4.20;
        range 10.68.4.160 10.68.4.168;
        option routers 10.68.4.1;
}
' > /etc/dhcp/dhcpd.conf
```
#### Output
![sein](https://github.com/reyhanqb/Jarkom-IT09-2023/assets/107137535/ad263111-1658-41c0-9b2a-2b41ed933c1d)

### Soal 4
Pada DHCP Server (Himmel) tambahkan script berikut:
```
echo '
subnet '10.68.3.0' netmask '255.255.255.0' {
        range 10.68.3.16 10.68.3.32;
        range 10.68.3.48 10.68.3.60;
        option routers 10.68.3.1;
        option domain-name-servers 10.68.1.3;
}
subnet '10.68.4.0' netmask '255.255.255.0' {
        range 10.68.4.12 10.68.4.20;
        range 10.68.4.160 10.68.4.168;
        option routers 10.68.4.1;
        option domain-name-servers 10.68.1.3;
}
' > /etc/dhcp/dhcpd.conf
```
Lalu, pada DHCP Relay (Aura) tambahkan script berikut:
```
echo '
SERVERS="10.68.1.2"
INTERFACES="eth1 eth2 eth3 eth4"
OPTIONS=' > /etc/default/isc-dhcp-relay

echo 'net.ipv4.ip_forward=1' > /etc/sysctl.conf

service isc-dhcp-relay restart
```
#### Output
![dns](https://github.com/reyhanqb/Jarkom-IT09-2023/assets/107137535/d7d5eb02-c617-4dcb-8fa3-28df594c170c)


### Soal 5
Pada DHCP Server (Himmel) tambahkan script berikut:
```
echo '
subnet '10.68.1.0' netmask '255.255.255.0' {
    option routers '10.68.1.1';
}

subnet '10.68.2.0' netmask '255.255.255.0' {
    option routers '10.68.2.1';
}

subnet '10.68.3.0' netmask '255.255.255.0' {
        range 10.68.3.16 10.68.3.32;
        range 10.68.3.48 10.68.3.60;
        option routers 10.68.3.1;
        option domain-name-servers 10.68.1.3;
        default-lease-time '720';
        max-lease-time '5760';
}
subnet '10.68.4.0' netmask '255.255.255.0' {
        range 10.68.4.12 10.68.4.20;
        range 10.68.4.160 10.68.4.168;
        option routers 10.68.4.1;
        option domain-name-servers 10.68.1.3;
        default-lease-time '720';
        max-lease-time '5760';
}
' > /etc/dhcp/dhcpd.conf
```
#### Output
![App Screenshot](https://i.ibb.co/BZqqNWb/no-5.jpg)

![App Screenshot](https://i.ibb.co/jw4KdPn/no-5-sisan.jpg)

## Soal 6
Pada soal diminta untuk melakukan konfigurasi pada worker PHP menggunakan php versi 7.3.

Pertama-tama, perlu dilakukan instalasi php terlebih dahulu dan download resource yang diberikan di soal.
```sh
apt-get update

apt-get install ca-certificates unzip nginx php php-fpm -y

apt-get install wget -y

wget --no-check-certificate 'https://drive.google.com/u/0/uc?id=1ViSkRq7SmwZgdK64eRbr5Fm1EGCTPrU1&export=download&confirm=yes' -O /var/www/jarkom

unzip /var/www/jarkom -d /var/www/granz.channel.it09.com
```

Kemudian buatlah file nginx configuration untuk site yang akan dideploy.

```sh
echo '
server {

listen 80;

root /var/www/granz.channel.it09.com;

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

error_log /var/log/nginx/granz.channel.it09.com_error.log;
access_log /var/log/nginx/granz.channel.it09.com_access.log;
}
' > /etc/nginx/sites-available/granz.channel.it09.com

ln -s /etc/nginx/sites-available/granz.channel.it09.com /etc/nginx/sites-enabled

rm /etc/nginx/sites-enabled/default
```
#### Output
![auth](https://github.com/reyhanqb/Jarkom-IT09-2023/assets/107137535/b0b5e8bc-92e2-4507-9df0-922777abac4f)

## Soal 7
Pertama-tama kita harus melakukan konfigurasi ulang di DNS Server (Heiter) untuk mengarahkan ip konfigurasi bind9 ke Eisen

```sh
echo ';
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     riegel.canyon.it09.com. root.riegel.canyon.it09.com. (
                        2023111401      ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      riegel.canyon.it09.com.
@       IN      A       10.68.2.3     ; IP Eisen
www     IN      CNAME   riegel.canyon.it09.com.' > /etc/bind/sites/riegel.canyon.it09.com

echo ';
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     granz.channel.it09.com. root.granz.channel.it09.com. (
                        2023111401      ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      granz.channel.it09.com.
@       IN      A       10.68.2.3     ; IP Eisen
www     IN      CNAME   granz.channel.it09.com.' > /etc/bind/sites/granz.channel.it09.com
```

Lalu ubah konfigurasi nginx pada Load Balancer untuk menambahkan IP masing-masing worker

```sh
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
        proxy_pass http://myweb    
    }

} ' > /etc/nginx/sites-available/granz.channel.it09.com


ln -s /etc/nginx/sites-available/granz.channel.it09.com /etc/nginx/sites-enabled/
rm /etc/nginx/sites-enabled/default

service nginx restart
```
#### Output
Lakukan testing pada salah satu client dengan command ```ab -n 1000 -c 100 http://www.granz.channel.it09.com/``` pada client. Hasil yang didapat adalah sebagai berikut

![Screenshot 2023-11-20 192430](https://github.com/reyhanqb/Jarkom-IT09-2023/assets/107137535/b9fd9315-f839-49dd-91c3-cae807885601)

## Soal 8
Untuk soal ini sama seperti soal nomor 7, hanya saja diubah jumlah request menjadi 200. Jalankan command ```ab -n 200 -c 10 http://www.granz.channel.it09.com/``` pada client. Untuk analisis serta grafik kami sertakan di grimoire
#### Output
![Screenshot 2023-11-20 192854](https://github.com/reyhanqb/Jarkom-IT09-2023/assets/107137535/cf96fc40-c96b-4eee-8ca1-55df20b6065e)

## Soal 9
Pada soal diminta untuk melakukan testing dengan jumlah worker yang berbeda-beda yaitu 1, 2, dan 3 worker. Jalankan command  ```ab -n 100 -c 10 http://www.granz.channel.it09.com/``` pada salah satu worker. 
#### Output
```1 worker```


![Screenshot 2023-11-20 193405](https://github.com/reyhanqb/Jarkom-IT09-2023/assets/107137535/0b51d37b-693e-4c13-aa14-e56eb273f3bb)

```2 worker```


![Screenshot 2023-11-20 192854](https://github.com/reyhanqb/Jarkom-IT09-2023/assets/107137535/2c449854-5ae2-4545-877f-3f9d44ee7c07)

```3 worker```


![Screenshot 2023-11-20 193634](https://github.com/reyhanqb/Jarkom-IT09-2023/assets/107137535/8657b252-eb0f-4466-be29-e529d06a209b)

## Soal 10
Untuk enable authentication kita perlu melakukan konfigurasi nginx di node Load Balancer (Eisen). Sebelumnya, buat terlebih dahulu direktori ```rahasisakita``` dan input password serta username sesuai yang diberikan di soal.

```sh
mkdir /etc/nginx/rahasisakita

htpasswd -c /etc/nginx/rahasisakita/htpasswd netics
```
Kemudian jangan lupa untuk enable authentication untuk web di konfigurasi nginx
```sh
echo ' 
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
} ' > /etc/nginx/sites-available/granz.channel.it09.com
```
#### Output
![login](https://github.com/reyhanqb/Jarkom-IT09-2023/assets/107137535/4e1baeea-bc36-44ed-bfb7-d492225d9402)

![aauth](https://github.com/reyhanqb/Jarkom-IT09-2023/assets/107137535/74d86cfc-d04e-4883-88f0-51ec6136566f)
## Soal 11
Untuk soal nomor 11, kita hanya perlu menambahkan location untuk alamat ```/its``` di nginx configuration yang terletak di Load Balancer. 

```sh
location /its {
        proxy_pass https://www.its.ac.id;
		proxy_set_header Host www.its.ac.id;
		proxy_set_header X-Real-IP $remote_addr;
		proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
		proxy_set_header X-Forwarded-Proto $scheme;
    }
}
```

Hasilnya adalah jika url yang diakses memiliki alamat ```\its```,  akan diredirect ke page its.ac.id

#### Output
![its](https://github.com/reyhanqb/Jarkom-IT09-2023/assets/107137535/e6361e4a-1986-41ca-a5b7-29e6e45caf9b)

## Soal 12
 
#### Output
Jika kita mencoba akses dari client yang tidak mendapatkan ip yang di allow, maka akan mereturn 403 forbidden

![forbidden](https://github.com/reyhanqb/Jarkom-IT09-2023/assets/107137535/2fd57dfa-8dd4-43b7-a2f7-ecc009786ceb)

Jika diakses dari client dengan ip yang diallow pada konfigurasi, maka situs akan bisa diakses

![revlote](https://github.com/reyhanqb/Jarkom-IT09-2023/assets/107137535/98f93030-946c-4ba6-8dfb-656399b8edeb)

## Soal 13
Pada Database Server, lakukan konfigurasi mysql sebagai berikut:

```sh
echo '
[client-server]

# Import all .cnf files from configuration directory
!includedir /etc/mysql/conf.d/
!includedir /etc/mysql/mariadb.conf.d/

# Options affecting the MySQL server (mysqld)
[mysqld]
skip-networking=0
skip-bind-address
' > /etc/mysql/my.cnf
```

Kemudian buatlah username dan password yang akan digunakan untuk membuat database. Untuk command mysql yang digunakan adalah seperti dibawah ini
```sql
mysql -u root -p
 
CREATE USER 'it09'@'%' IDENTIFIED BY 'passwordit09';
CREATE USER 'it09'@'localhost' IDENTIFIED BY 'passwordit09';
CREATE DATABASE dbit09;
GRANT ALL PRIVILEGES ON *.* TO 'it09'@'%';
GRANT ALL PRIVILEGES ON *.* TO 'it09'@'localhost';
FLUSH PRIVILEGES;
```

Kemudian, hak akses dapat dicek dengan command ```mariadb --host=10.68.2.2 --port=3306 --user=it09 --password=passwordit09``` pada salah satu worker

#### Output
![Screenshot 2023-11-19 095618](https://github.com/reyhanqb/Jarkom-IT09-2023/assets/107137535/613e9a65-03bd-41ee-b01b-421b90b59a86)

## Soal 14
Pada soal diminta untuk melakukan instalasi PHP 8 dan Composer untuk deploy sebuah web yang menggunakan laravel. Pertama-tama lakukan instalasi PHP 8 dan composer
```sh
apt-get update
apt-get install -y lsb-release ca-certificates apt-transport-https software-properties-common gnupg2
curl -sSLo /usr/share/keyrings/deb.sury.org-php.gpg https://packages.sury.org/php/apt.gpg
sh -c 'echo "deb [signed-by=/usr/share/keyrings/deb.sury.org-php.gpg] https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list'
apt-get update
apt-get install php8.0-mbstring php8.0-xml php8.0-cli php8.0-common php8.0-intl php8.0-opcache php8.0-readline php8.0-mysql php8.0-fpm php8.0-curl unzip wget -y

wget https://getcomposer.org/download/2.0.13/composer.phar
chmod +x composer.phar
mv composer.phar /usr/bin/composer
composer install
```
Selanjutnya kita perlu git clone resources yang diberikan di soal.

```sh
apt-get install git -y
git clone https://github.com/martuafernando/laravel-praktikum-jarkom /var/www/laravel-praktikum-jarkom
composer update

cp /var/www/laravel-praktikum-jarkom/.env.example /var/www/laravel-praktikum-jarkom/.env
```
Kemudian edit file ```.env``` yang terdapat di resource

```sh
cp /var/www/laravel-praktikum-jarkom/.env.example /var/www/laravel-praktikum-jarkom/.env

echo '
DB_CONNECTION=mysql
DB_HOST=10.68.2.2
DB_PORT=3306
DB_DATABASE=dbit09
DB_USERNAME=it09
DB_PASSWORD=passwordit09

service nginx start
php artisan migrate:fresh
php artisan db:seed --class=AiringsTableSeeder
php artisan key:generate
php artisan config:cache
php artisan migrate
php artisan db:seed
php artisan storage:link
php artisan jwt:secret
php artisan config:clear
' > /var/www/laravel-praktikum-jarkom/.env
```
Kemudian lakukan konfigurasi nginx pada masing-masing worker.

```sh
echo ' 
server {
    listen 8001;
    
    root /var/www/laravel-praktikum-jarkom/public;

    index index.html index.htm index.nginx-debian.html;

    server_name _;

    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/var/run/php/php8.0-fpm.sock;
    }

    location ~ /\ .ht {
        deny all;
    }

    error_log /var/log/nginx/jarkom_error.log;
    access_log /var/log/nginx/jarkom_access.log;    

} ' > /etc/nginx/sites-available/laravel-worker
```
Jangan lupa untuk assign ip berbeda untuk tiap worker. Disini kami memberikan ip 8001 untuk worker Flamme.

#### Output
Lakukan command ```lynx localhost:[PORT]``` pada worker Laravel. Command berikut dijalankan pada worker Flamme

![Screenshot (258)](https://github.com/reyhanqb/Jarkom-IT09-2023/assets/107137535/28bfbf06-2daf-4b58-8262-004527596856)

## Soal 15
Untuk melakukan testing POST pada alamat /auth/register perlu membuat file .json sebagai payload. File .json yang kami buat sebagai berikut

```json
{
        "username": "it09",
        "password":"passwordit09"
}
```
Kemudian jalankan command ```ab -n 100 -c 10 -p reg.json -T application/json http://10.68.4.5:8001/api/auth/register``` pada salah satu client.

#### Output
![Screenshot (253)](https://github.com/reyhanqb/Jarkom-IT09-2023/assets/107137535/2ed06225-2c53-489b-b701-33118e347d16)


## Soal 16
Untuk soal ini sama dengan nomor 16. Hanya harus mengganti alamat di command menjadi ```ab -n 100 -c 10 -p reg.json -T application/json http://10.68.4.5:8001/api/auth/login```

#### Output
![login](https://github.com/reyhanqb/Jarkom-IT09-2023/assets/107137535/860d1aac-9612-4ba2-94bf-ddbc1ec3172d)

## Soal 17
Pada soal diminta untuk melakukan request ke endpoint /me. Pertama-tama perlu didapatkan Authorization Token terlebih dahulu. Kami menjalankan script ```curl -X POST -H "Content-Type: application/json" -d @login.json http://10.68.4.5:8001/api/auth/login > lg.txt``` pada worker Flamme.

![Screenshot 2023-11-20 194053](https://github.com/reyhanqb/Jarkom-IT09-2023/assets/107137535/18c02786-db53-4174-adea-7d000f9d28e8)

Kemudian lakukan testing dengan cara menjalankan command ```ab -n 100 -c 10 -H "Authorization: Bearer $token" http://10.68.4.5:8001/api/me```

#### Output
![Screenshot 2023-11-20 194439](https://github.com/reyhanqb/Jarkom-IT09-2023/assets/107137535/0d168679-d38a-4d9e-a022-a33f72410a25)