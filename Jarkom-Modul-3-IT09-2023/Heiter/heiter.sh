# echo nameserver 192.168.122.1 > /etc/resolv.conf

apt-get update 
apt-get install bind9 -y

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

echo 'options {
      directory "/var/cache/bind";

      forwarders {
              192.168.122.1;
      };

      // dnssec-validation auto;
      allow-query{any;};
      auth-nxdomain no;  
      listen-on-v6 { any; };
}; ' >/etc/bind/named.conf.options

service bind9 start