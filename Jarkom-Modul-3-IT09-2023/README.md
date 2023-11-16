# Jarkom-Modul-3-IT09-2023

## Anggota
Muhammad Hilmy Adhi Pradityo - 5027211053

Athaya Reyhan Nugroho - 5027211067

## Pengerjaan

### Topologi
![App Screenshot](https://i.ibb.co/kKS9HxR/Whats-App-Image-2023-11-16-at-20-43-46.jpg)

### Soal 0

### Soal 1
Pada DNS Server (Heiter) masukkan script berikut
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

### Soal 2
Pada DHCP Server (Himmel) tambahkan script berikut
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

### Soal 3
Pada DHCP Server (Himmel) tambahkan script berikut
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

### Soal 4
Pada DHCP Server (Himmel) tambahkan script berikut
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
Lalu, pada DHCP Relay (Aura) tambahkan script berikut 
```
echo '
SERVERS="10.68.1.2"
INTERFACES="eth1 eth2 eth3 eth4"
OPTIONS=' > /etc/default/isc-dhcp-relay

echo 'net.ipv4.ip_forward=1' > /etc/sysctl.conf

service isc-dhcp-relay restart
```

### Soal 5
Pada DHCP Server (Himmel) tambahkan script berikut 
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
