# Jarkom-Modul-4-IT09-2023

## Anggota
Muhammad Hilmy Adhi Pradityo - 5027211053

Athaya Reyhan Nugroho - 5027211067

# Topologi
![App Screenshot](https://i.ibb.co/JK1YKfJ/Whats-App-Image-2023-12-05-at-13-12-40.jpg)

# VLSM
Tentukan terlebih dahulu subnet dari topologi dengan metode VLSM.
![App Screenshot](https://i.ibb.co/yNRCHSG/Whats-App-Image-2023-12-05-at-13-19-24.jpg)

## Rute dan Netmask
Tentukan Subnet Mask dari masing-masing subnet, dengan jumlah host yang dibutuhkan per subnetnya.
![App Screenshot](https://i.ibb.co/XFPYhhz/Whats-App-Image-2023-12-02-at-01-56-25.jpg)

## Konfigurasi IP
Buat perhitungan dari subnet mask dari masing-masing subnet untuk menentukan pembagian konfigurasi IP.
![App Screenshot](https://i.ibb.co/QKBmxNx/Whats-App-Image-2023-12-02-at-01-56-52.jpg)

## VLSM Tree 
Setelah konfigurasi IP didapatkan, gambarkan tree VLSM nya.
![App Screenshot](https://i.ibb.co/v4Sw9rt/Whats-App-Image-2023-12-02-at-02-33-11-1.jpg)

## Konfigurasi di CPT
### Subnetting
Atur IP interface dari router yang mengarah ke client. (Contoh: A21, Denken-Switch2-RoyalCapital-Switch2-WilleRegion)
![App Screenshot](https://i.ibb.co/tZ0VSpj/Whats-App-Image-2023-12-05-at-13-39-07.jpg)

Atur IP interface dari client yang mengarah ke router. (Contoh: A21, RoyalCapital-Switch2-Denken)
![App Screenshot](https://i.ibb.co/tCK5yB7/Whats-App-Image-2023-12-05-at-13-43-15.jpg)
![App Screenshot](https://i.ibb.co/jV8H3MP/Whats-App-Image-2023-12-05-at-13-46-59.jpg)

Atur IP interface dari client yang mengarah ke router. (Contoh: A21, WilleRegion-Switch2-Denken)
![App Screenshot](https://i.ibb.co/nLbjwd0/Whats-App-Image-2023-12-05-at-13-44-53.jpg)
![App Screenshot](https://i.ibb.co/jw755FS/Whats-App-Image-2023-12-05-at-13-49-04.jpg)

Atur IP interface dari router utama yang mengarah ke router subnet. (Contoh: Subnet A20, Aura-Denken)
![App Screenshot](https://i.ibb.co/nPrQMxW/Whats-App-Image-2023-12-05-at-13-53-19.jpg)

Atur IP interface dari router subnet yang mengarah ke router utama. (Contoh: Subnet A20, Denken-Aura)
![App Screenshot](https://i.ibb.co/CKHM5xf/Whats-App-Image-2023-12-05-at-13-55-27.jpg)

Jangan lupa lakukan untuk semua subnet yang ada.

### Routing
Atur default routing dari router subnet ke router utama. (Contoh: Denken-Aura)
![App Screenshot](https://i.ibb.co/XbRPJQh/Whats-App-Image-2023-12-05-at-14-00-06.jpg)

Atur routing dari router utama ke subnet client. (Contoh: Subnet A21, Aura-Denken)
![App Screenshot](https://i.ibb.co/Pm4Cc94/Whats-App-Image-2023-12-05-at-14-02-22.jpg)

Jangan lupa lakukan untuk semua subnet yang ada.

### Testing
Test dengan melakukan ping dari Aura ke RoyalCapital/WilleRegion dan sebaliknya.
![App Screenshot](https://i.ibb.co/dsTK5CV/Whats-App-Image-2023-12-05-at-14-08-56.jpg)

# CIDR

## Topologi

## Tree

## Pembagian IP
