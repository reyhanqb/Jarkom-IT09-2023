# Jarkom-Modul-2-IT09-2023

# Anggota

Muhammad Hilmy Adhi Pradityo - 5027211053

Athaya Reyhan Nugroho - 5027211067

# Pengerjaan

## Topologi
![image](https://github.com/reyhanqb/Jarkom-IT09-2023/assets/112833825/fa6af382-0607-4410-ad17-4316d2c11ae8)

## Setup
**Pandudewanata**
```
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE -s 10.68.0.0/16
echo nameserver 192.168.122.1 > /etc/resolv.conf
```
**Yudhistira**
```
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE -s 10.68.0.0/16
echo nameserver 192.168.122.1 > /etc/resolv.conf
apt-get update -y
apt-get install bind9 -y
```
**Werkudara**
```
echo nameserver 192.168.122.1 > /etc/resolv.conf
apt-get update -y
apt-get install bind9 -y
```
**Sadewa/Nakula**
```
echo nameserver 192.168.122.1 > /etc/resolv.conf
apt-get update -y
apt-get install dnsutils
apt-get install lynx
```
**Abimanyu**
```
echo nameserver 192.168.122.1 > /etc/resolv.conf
apt-get update -y
apt install nginx -y
apt install php-fpm -y
apt install apache2 -y
apt install wget -y
apt install unzip -y
mkdir /var/www/jarkom
```
**Prabukusuma**
```
echo nameserver 192.168.122.1 > /etc/resolv.conf
apt-get update -y
apt install nginx -y
apt install php-fpm -y
```
## Soal 1 
Pada `bashrc` masukkan script berikut
```
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE -s 10.68.0.0/16
echo nameserver 192.168.122.1 > /etc/resolv.conf
```
Untuke melakukan test kita dapat ping ke google. Jika sudah berhasil, seharusnya tidak ada packet loss yang terjadi 
```
ping google.com
```
## Output
![Screenshot 2023-10-17 185310](https://github.com/reyhanqb/Jarkom-IT09-2023/assets/107137535/3ecb6845-5b7a-48be-8949-4cf8523fd7d1)


## Soal 2
Pada `Yudhistira`, buatlah konfigurasi zone untuk arjuna.IT09.com
```
echo 'zone "arjuna.IT09.com" {
        type master;
        notify yes;
        file "/etc/bind/jarkom/arjuna.IT09.com";
};' > /etc/bind/named.conf.local

mkdir /etc/bind/jarkom

cp /etc/bind/db.local /etc/bind/jarkom/arjuna.IT09.com

echo ';
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     arjuna.IT09.com. root.arjuna.IT09.com. (
                              2         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      arjuna.IT09.com.
@       IN      A       10.68.4.5
www     IN      CNAME   arjuna.IT09.com. > /etc/bind/jarkom/arjuna.IT09.com

service bind9 restart
```
Untuk tes no 2, pada client `Sadewa` jalankan command
```
ping arjuna.IT09.com
ping www.arjuna.IT09.com
```
![Screenshot 2023-10-17 190947](https://github.com/reyhanqb/Jarkom-IT09-2023/assets/107137535/a885f177-e418-40ce-9712-0e66e1beb28d)

## Soal 3
Pada `Yudhistira`, masukkan script berikut
```
echo 'zone "abimanyu.IT09.com" {
        type master;
        notify yes;
        file "/etc/bind/jarkom/abimanyu.IT09.com";
};' > /etc/bind/named.conf.local

cp /etc/bind/db.local /etc/bind/jarkom/abimanyu.IT09.com

echo ';
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     abimanyu.IT09.com. root.abimanyu.IT09.com. (
                              2         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      abimanyu.IT09.com.
@       IN      A       10.68.2.2
www     IN      CNAME   www.abimanyu.IT09.com.' > /etc/bind/jarkom/abimanyu.IT09.com

service bind9 restart
```
Untuk tes no 3, pada client `Sadewa` jalankan command
```
ping abimanyu.IT09.com
ping www.abimanyu.IT09.com
```
## Output
![Screenshot 2023-10-17 191245](https://github.com/reyhanqb/Jarkom-IT09-2023/assets/107137535/58d9fe5f-05d8-4ac7-9b19-29d48482cb5d)

## Soal 4
Pada DNS Master/`Yudhistira`, ada tambahan script berikut di bagian setup `Abimanyu` sehingga menjadi
```
echo ';
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     abimanyu.IT09.com. root.abimanyu.IT09.com. (
                              2         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      abimanyu.IT09.com.
@       IN      A       10.68.2.2
www     IN      CNAME   www.abimanyu.IT09.com.
parikesit IN   A 10.68.2.2' > /etc/bind/jarkom/abimanyu.IT09.com

service bind9 restart
```
Untuk tes no 4, pada client/`Sadewa` jalankan command
```
ping parikesit.abimanyu.IT09.com
```
![Screenshot 2023-10-17 191606](https://github.com/reyhanqb/Jarkom-IT09-2023/assets/107137535/e3c8acfb-32ec-47f8-b910-435a56ed9846)

## Soal 5
Pada DNS Master `Yudhistira`, masukkan script berikut
```
echo 'zone "4.68.10.in-addr.arpa" {
        type master;
        file "/etc/bind/jarkom/4.68.10.in-addr.arpa.com";
}; ' > /etc/bind/named.conf.local

cp /etc/bind/db.local /etc/bind/jarkom/4.68.10.in-addr.arpa.com

echo '
;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     abimanyu.IT09.com. root.abimanyu.IT09.com. (
                              2         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      abimanyu.IT09.com.
@       IN      A       10.68.4.3
www     IN      A       10.68.4.3
parikesit IN   A 10.68.4.3
www.parikesit IN        A       10.68.4.3
' > /etc/bind/jarkom/4.68.10.in-addr.arpa.com

service bind9 restart
```
Jalankan command berikut untuk memastikan no 5
```
host -t PTR 10.68.4.3
```
## Output
![Screenshot 2023-10-17 191813](https://github.com/reyhanqb/Jarkom-IT09-2023/assets/107137535/4e5b1fb2-c323-4b4d-b155-2b348ea89fd9)

## Soal 6
Pada DNS Master/`Yudhistira` diperlukan setup `also-notify` dan `allow-transfer`
```
echo 'zone "arjuna.IT09.com" {
        type master;
        notify yes;
        also-notify { 10.68.2.2; };
        allow-transfer { 10.68.2.2; };
        file "/etc/bind/jarkom/arjuna.IT09.com";
};
zone "abimanyu.IT09.com" {
        type master;
        notify yes;
        also-notify { 10.68.2.2; };
        allow-transfer { 10.68.2.2; };
        file "/etc/bind/jarkom/abimanyu.IT09.com";
};
zone "4.68.10.in-addr.arpa" {
        type master;
        file "/etc/bind/jarkom/4.68.10.in-addr.arpa.com";
}; ' > /etc/bind/named.conf.local

service bind9 restart

service bind9 stop
```
Lalu, pada `Werkudara` masukkan script berikut
```
echo '
zone "arjuna.IT09.com" {
        type slave;
        masters { 10.68.1.2; };
        file "/etc/bind/arjuna.IT09.com";
}

service bind9 restart
```
Untuk tes no 6, jalankan command ini di client/`Sadewa` dalam posisi service bind9 di Yudhistira mati
```
ping arjuna.IT09.com
```
## Output
![Screenshot 2023-10-17 191921](https://github.com/reyhanqb/Jarkom-IT09-2023/assets/107137535/3f4ec4f6-8498-4fb5-99d8-d4a6d3eefadc)

## Soal 7
Pada DNS Master/`Yudhistira`, tambahkan script berikut
```
echo 'zone "baratayuda.abimanyu.IT09.com" {
        type master;
        file "/etc/bind/jarkom/baratayuda.abimanyu.IT09.com";
        allow-transfer { 10.68.2.2; };
};' > /etc/bind/named.conf.local

cp /etc/bind/db.local /etc/bind/jarkom/baratayuda.abimanyu.IT09.com

echo ';
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     baratayuda.abimanyu.IT09.com. root.baratayuda.abimanyu.IT09.com. (
                              2         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      baratayuda.abimanyu.IT09.com.
@       IN      A       10.68.4.3
www     IN      CNAME   baratayuda.abimanyu.it09.com
ns1     IN      A       10.68.2.2
baratayuda      IN      NS      ns1 ' > /etc/bind/jarkom/baratayuda.abimanyu.IT09.com

service bind9 restart
```
Pada `Werkudara`, masukkan script berikut
```
echo 'zone "arjuna.IT09.com" {
        type slave;
        masters { 10.68.1.2; };
        file "/etc/bind/arjuna.IT09.com";
}

zone "baratayuda.abimanyu.IT09.com" {
        type master;
        file "/etc/bind/delegasi/baratayuda.abimanyu.IT09.com";
};' > /etc/bind/named.conf.local

mkdir /etc/bind/delegasi

cp /etc/bind/db.local /etc/bind/delegasi/baratayuda.abimanyu.IT09.com

echo '
;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     baratayuda.abimanyu.IT09.com. root.baratayuda.abima$
                              2         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      baratayuda.abimanyu.IT09.com.
@       IN      A       10.68.2.2
www     IN      A       10.68.2.2
' > /etc/bind/delegasi/baratayuda.abimanyu.IT09.com

echo '
options {
        directory "/var/cache/bind";

        allow-query { any; };

        auth-nxdomain no;
        listen-on-v6 { any; };
};' > /etc/bind/named.conf.options
```
Untuk tes no 7, jalankan command ini di client/`Sadewa`
```
ping baratayuda.abimanyu.IT09.com
ping www.baratayuda.abimanyu.IT09.com
```
## Output
![Screenshot 2023-10-17 192116](https://github.com/reyhanqb/Jarkom-IT09-2023/assets/107137535/97035d5f-d1e7-4342-acee-8658d2a8a348)

## Soal 8
Pada `Werkudara`, tambahkan script berikut 
```
mkdir /etc/bind/jarkom

cp /etc/bind/db.local /etc/bind/jarkom/baratayuda.abimanyu.IT09.com

echo ';
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     baratayuda.abimanyu.IT09.com. root.baratayuda.abima$                              2         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      baratayuda.abimanyu.IT09.com.
@       IN      A       10.68.4.3
rjp     IN      A       10.68.4.3
@       IN      AAAA    ::1' > /etc/bind/jarkom/baratayuda.abimanyu.IT09.com
```
Untuk tes no 8, jalankan command ini di client/`Sadewa`
```
ping rjp.baratayuda.abimanyu.IT09.com
```
## Output
![Screenshot 2023-10-17 192403](https://github.com/reyhanqb/Jarkom-IT09-2023/assets/107137535/2dbdedba-af0a-4a50-9c42-e34a1173a502)

## Soal 9

## Langkah

Lakukan deployment pada masing-masing worker dengan konfigurasi apache2 seperti dibawah ini: 

```
echo '
<?php
echo "Halo, Prabukusuma!";
?>
' > /var/www/jarkom/index.php

echo 'server {
        listen 8001;

        root /var/www/jarkom;

        index index.php;
        server_name _;

        location / {
                try_files $uri $uri/ /index.php?$query_string;
        }

        # pass PHP scripts to FastCGI server
        location ~ \.php$ {
                include snippets/fastcgi-php.conf;
                fastcgi_pass unix:/var/run/php/php7.0-fpm.sock;
        }
        location ~ /\.ht {
                deny all;
        }

        error_log /var/log/nginx/it09_error.log;
        access_log /var/log/nginx/it09_access.log;
}' > /etc/nginx/sites-available/jarkom

ln -s /etc/nginx/sites-available/jarkom /etc/nginx/sites-enabled

rm /etc/nginx/sites-enabled/default

service php7.0-fpm start

service nginx restart
```



## Output
![Screenshot 2023-10-17 192508](https://github.com/reyhanqb/Jarkom-IT09-2023/assets/107137535/e1b94f16-aef3-490a-be31-c2d214511256)
![Screenshot 2023-10-17 192525](https://github.com/reyhanqb/Jarkom-IT09-2023/assets/107137535/cc2b44d9-6c17-429c-a59b-1a2c5dde69ba)
![Screenshot 2023-10-17 192538](https://github.com/reyhanqb/Jarkom-IT09-2023/assets/107137535/ff150cf5-440f-488e-b73d-231c72eea206)

## Soal 11
Pada `Abimanyu`, masukkan script ini
```
mkdir /var/www/abimanyu.IT09

wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=1a4V23hwK9S7hQEDEcv9FL14UkkrHc-Zc' -O /var/www/abimanyu

unzip /var/www/abimanyu -d /var/www/abimanyu.IT09

mv /var/www/abimanyu.IT09/abimanyu.yyy.com/* /var/www/abimanyu.IT09

rmdir /var/www/abimanyu.IT09/abimanyu.yyy.com

echo '
<VirtualHost *:80>
    ServerName abimanyu.IT09.com
    ServerAlias www.abimanyu.IT09.com
    ServerAdmin webmaster@localhost
    DocumentRoot /var/www/abimanyu.IT09

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined

</VirtualHost>
' > /etc/apache2/sites-available/abimanyu.IT09.conf

a2ensite abimanyu.IT09.conf

service php7.0-fpm restart

service apache2 restart
```
Untuk tes no 11, pada client/`Sadewa` jalankan command
```
lynx abimanyu.IT09.com
```

## Soal 12
Pada `Abimanyu`, ada script tambahan untuk no 12
```
echo '
<VirtualHost *:80>
    ServerName abimanyu.IT09.com
    ServerAlias www.abimanyu.IT09.com
    ServerAdmin webmaster@localhost
    DocumentRoot /var/www/abimanyu.IT09

    Alias / /var/www/abimanyu.IT09/home.html

    RewriteEngine On

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined

</VirtualHost>
' > /etc/apache2/sites-available/abimanyu.IT09.conf
```
Untuk tes no 12, jalankan command ini di client/`Sadewa`
```
lynx abimanyu.IT09.com/home
```

## Soal 13
Pada `Abimanyu`, masukkan script berikut
```
mkdir /var/www/parikesit.abimanyu.IT09

wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=1LdbYntiYVF_NVNgJis1GLCLPEGyIOreS' -O /var/www/parikesit.abimanyu.IT09

unzip parikesit.zip

echo '
<VirtualHost *:80>
        ServerName parikesit.abimanyu.IT09.com
        ServerAlias www.parikesit.abimanyu.IT09.com
        ServerAdmin webmaster@localhost
        DocumentRoot /var/www/parikesit.abimanyu.IT09.com

        ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
' > /etc/apache2/sites-available/parikesit.abimanyu.IT09.conf

a2ensite parikesit.abimanyu.IT09.conf

service php7.0-fpm restart

service apache2 restart
```
Untuk tes no 13, jalankan command ini di client/`Sadewa`
```
lynx parikesit.abimanyu.IT09.com
```
