# Jarkom-Modul-2-IT09-2023

# Anggota

Muhammad Hilmy Adhi Pradityo - 5027211053
Athaya Reyhan Nugroho - 5027211067

# Soal

1. Yudhistira akan digunakan sebagai DNS Master, Werkudara sebagai DNS Slave, Arjuna merupakan Load Balancer yang terdiri dari beberapa Web Server yaitu Prabakusuma, Abimanyu, dan Wisanggeni. Buatlah topologi dengan pembagian sebagai berikut. Folder topologi dapat diakses pada drive berikut 
2. Buatlah website utama pada node arjuna dengan akses ke arjuna.yyy.com dengan alias www.arjuna.yyy.com dengan yyy merupakan kode kelompok.
3. Dengan cara yang sama seperti soal nomor 2, buatlah website utama dengan akses ke abimanyu.yyy.com dan alias www.abimanyu.yyy.com.
4. Kemudian, karena terdapat beberapa web yang harus di-deploy, buatlah subdomain parikesit.abimanyu.yyy.com yang diatur DNS-nya di Yudhistira dan mengarah ke Abimanyu.
5. Buat juga reverse domain untuk domain utama. (Abimanyu saja yang direverse)
6. Agar dapat tetap dihubungi ketika DNS Server Yudhistira bermasalah, buat juga Werkudara sebagai DNS Slave untuk domain utama.
7. Seperti yang kita tahu karena banyak sekali informasi yang harus diterima, buatlah subdomain khusus untuk perang yaitu baratayuda.abimanyu.yyy.com dengan alias www.baratayuda.abimanyu.yyy.com yang didelegasikan dari Yudhistira ke Werkudara dengan IP menuju ke Abimanyu dalam folder Baratayuda.
8. Untuk informasi yang lebih spesifik mengenai Ranjapan Baratayuda, buatlah subdomain melalui Werkudara dengan akses rjp.baratayuda.abimanyu.yyy.com dengan alias www.rjp.baratayuda.abimanyu.yyy.com yang mengarah ke Abimanyu.
9. Arjuna merupakan suatu Load Balancer Nginx dengan tiga worker (yang juga menggunakan nginx sebagai webserver) yaitu Prabakusuma, Abimanyu, dan Wisanggeni. Lakukan deployment pada masing-masing worker.
10. Kemudian gunakan algoritma Round Robin untuk Load Balancer pada Arjuna. Gunakan server_name pada soal nomor 1. Untuk melakukan pengecekan akses alamat web tersebut kemudian pastikan worker yang digunakan untuk menangani permintaan akan berganti ganti secara acak. Untuk webserver di masing-masing worker wajib berjalan di port 8001-8003. Contoh
    - Prabakusuma:8001
    - Abimanyu:8002
    - Wisanggeni:8003
11. Selain menggunakan Nginx, lakukan konfigurasi Apache Web Server pada worker Abimanyu dengan web server www.abimanyu.yyy.com. Pertama dibutuhkan web server dengan DocumentRoot pada /var/www/abimanyu.yyy
12. Setelah itu ubahlah agar url www.abimanyu.yyy.com/index.php/home menjadi www.abimanyu.yyy.com/home.
13. Selain itu, pada subdomain www.parikesit.abimanyu.yyy.com, DocumentRoot disimpan pada /var/www/parikesit.abimanyu.yyy
14. Pada subdomain tersebut folder /public hanya dapat melakukan directory listing sedangkan pada folder /secret tidak dapat diakses (403 Forbidden).
15. Buatlah kustomisasi halaman error pada folder /error untuk mengganti error kode pada Apache. Error kode yang perlu diganti adalah 404 Not Found dan 403 Forbidden.
16. Buatlah suatu konfigurasi virtual host agar file asset www.parikesit.abimanyu.yyy.com/public/js menjadi www.parikesit.abimanyu.yyy.com/js 
17. Agar aman, buatlah konfigurasi agar www.rjp.baratayuda.abimanyu.yyy.com hanya dapat diakses melalui port 14000 dan 14400.
18. Untuk mengaksesnya buatlah autentikasi username berupa “Wayang” dan password “baratayudayyy” dengan yyy merupakan kode kelompok. Letakkan DocumentRoot pada /var/www/rjp.baratayuda.abimanyu.yyy.
19. Buatlah agar setiap kali mengakses IP dari Abimanyu akan secara otomatis dialihkan ke www.abimanyu.yyy.com (alias)
20. Karena website www.parikesit.abimanyu.yyy.com semakin banyak pengunjung dan banyak gambar gambar random, maka ubahlah request gambar yang memiliki substring “abimanyu” akan diarahkan menuju abimanyu.png.

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
Untuk tes apakah no 1 sudah berhasil, jalankan command
```
ping google.com
```

## Soal 2
Pada DNS Master/`Yudhistira`, masukkan script berikut
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
@       IN      A       10.68.1.2
@       IN      AAAA    ::1
www     IN      CNAME   www.arjuna.IT09.com' > /etc/bind/jarkom/arjuna.IT09.com

service bind9 restart
```
Untuk tes no 2, pada client/`Sadewa` jalankan command
```
ping arjuna.IT09.com
ping www.arjuna.IT09.com
```

## Soal 3
Pada DNS Master/`Yudhistira`, masukkan script berikut
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
www     IN      CNAME   www.abimanyu.IT09.com' > /etc/bind/jarkom/abimanyu.IT09.com

service bind9 restart
```
Untuk tes no 3, pada client/`Sadewa` jalankan command
```
ping abimanyu.IT09.com
ping www.abimanyu.IT09.com
```

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
www     IN      CNAME   www.abimanyu.IT09.com
parikesit IN   A 10.68.2.2' > /etc/bind/jarkom/abimanyu.IT09.com

service bind9 restart
```
Untuk tes no 4, pada client/`Sadewa` jalankan command
```
ping parikesit.abimanyu.IT09.com
ping www.parikesit.abimanyu.IT09.com
```

## Soal 5
Pada DNS Master/`Yudhistira`, masukkan script berikut
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
Untuk tes no 6, jalankan command ini di client/`Sadewa`
```
ping arjuna.IT09.com
```

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
        listen-on-v6 { any };
};' > /etc/bind/named.conf.options
```
Untuk tes no 7, jalankan command ini di client/`Sadewa`
```
ping baratayuda.abimanyu.IT09.com
ping www.baratayuda.abimanyu.IT09.com
```

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
ping www.rjp.baratayuda.abimanyu.IT09.com
```

## Soal 9

## Soal 10

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
