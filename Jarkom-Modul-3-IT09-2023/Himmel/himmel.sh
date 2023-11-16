echo 'nameserver 192.168.122.1' > /etc/resolv.conf

apt-get update

apt-get install isc-dhcp-server -y

dhcpd --version

echo '
INTERFACESv4="eth0"
INTERFACESv6=""
' > /etc/default/isc-dhcp-server

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

host Revolte {
    harware ethernet fe:c0:13:f5:1c:02;
    fixed-address 10.68.3.69;
}
' > /etc/dhcp/dhcpd.conf

service isc-dhcp-server start