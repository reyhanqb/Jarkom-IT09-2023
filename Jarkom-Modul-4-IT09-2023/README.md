# Jarkom-Modul-4-IT09-2023

## Anggota

Nama  | NRP
------------- | -------------
Muhammad Hilmy Adhi Pradityo  | 5027211053
Athaya Reyhan Nugroho  | 5027211067

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
![App Screenshot](https://i.ibb.co/vmSLTqB/Whats-App-Image-2023-12-05-at-16-50-58.jpg)

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
![Topologi](https://github.com/reyhanqb/Jarkom-IT09-2023/assets/107137535/70b7aea4-4e10-45d0-8ea7-d81a33b555bc)

## Tree
# Jarkom-Modul-4-IT09-2023

## Anggota

Nama  | NRP
------------- | -------------
Muhammad Hilmy Adhi Pradityo  | 5027211053
Athaya Reyhan Nugroho  | 5027211067

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
![App Screenshot](https://i.ibb.co/vmSLTqB/Whats-App-Image-2023-12-05-at-16-50-58.jpg)

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
![Topologi](https://github.com/reyhanqb/Jarkom-IT09-2023/assets/107137535/70b7aea4-4e10-45d0-8ea7-d81a33b555bc)

## Tree
![Tree](https://github.com/reyhanqb/Jarkom-IT09-2023/assets/107137535/8cdd2cd4-f531-4da9-ae83-72f77fa32178)

## Pembagian

![Screenshot 2023-12-05 153614](https://github.com/reyhanqb/Jarkom-IT09-2023/assets/107137535/778ab4ed-0a9c-4e0f-b6cf-bda9fa5f0d48)

![Screenshot 2023-12-05 153625](https://github.com/reyhanqb/Jarkom-IT09-2023/assets/107137535/453037fd-9f01-465a-8f84-40fe9b7e8b9e)

![Screenshot 2023-12-05 154223](https://github.com/reyhanqb/Jarkom-IT09-2023/assets/107137535/01f4c0fd-163b-42df-8a3f-ca0693ed1af9)

![Screenshot 2023-12-05 153749](https://github.com/reyhanqb/Jarkom-IT09-2023/assets/107137535/f7db4173-8deb-4aaa-8fb7-5b0cc234f40a)

![Screenshot 2023-12-05 153816](https://github.com/reyhanqb/Jarkom-IT09-2023/assets/107137535/ebc6074f-acc1-4420-9bc5-25928e4fbd0c)

![Screenshot 2023-12-05 153839](https://github.com/reyhanqb/Jarkom-IT09-2023/assets/107137535/d17a78f1-3ada-487b-9c89-5e4cb9a25462)

![Screenshot 2023-12-05 153853](https://github.com/reyhanqb/Jarkom-IT09-2023/assets/107137535/03d4f268-6570-4ac0-856d-07c9de01b77a)

![Screenshot 2023-12-05 153911](https://github.com/reyhanqb/Jarkom-IT09-2023/assets/107137535/f5c093e4-ab0c-411a-a8a4-60a185ee1f0f)

![Screenshot 2023-12-05 153925](https://github.com/reyhanqb/Jarkom-IT09-2023/assets/107137535/7d79eb61-cad7-452f-8e3f-aac1ca25894d)

## Pembagian

![Screenshot 2023-12-05 153614](https://github.com/reyhanqb/Jarkom-IT09-2023/assets/107137535/778ab4ed-0a9c-4e0f-b6cf-bda9fa5f0d48)

###

![Screenshot 2023-12-05 153625](https://github.com/reyhanqb/Jarkom-IT09-2023/assets/107137535/453037fd-9f01-465a-8f84-40fe9b7e8b9e)

![Screenshot 2023-12-06 153210](https://github.com/reyhanqb/Jarkom-IT09-2023/assets/107137535/bff235be-29f5-4a38-bcfe-344b6f1ffd57)

###

![Screenshot 2023-12-05 154223](https://github.com/reyhanqb/Jarkom-IT09-2023/assets/107137535/01f4c0fd-163b-42df-8a3f-ca0693ed1af9)

![Screenshot 2023-12-06 153228](https://github.com/reyhanqb/Jarkom-IT09-2023/assets/107137535/b140bb98-e5c7-4857-9bf6-e7e47fd5aae1)

###

![Screenshot 2023-12-05 153749](https://github.com/reyhanqb/Jarkom-IT09-2023/assets/107137535/f7db4173-8deb-4aaa-8fb7-5b0cc234f40a)

![Screenshot 2023-12-06 153245](https://github.com/reyhanqb/Jarkom-IT09-2023/assets/107137535/a14ad0a6-66b7-43f0-9202-3b6d24041124)

###

![Screenshot 2023-12-05 153816](https://github.com/reyhanqb/Jarkom-IT09-2023/assets/107137535/ebc6074f-acc1-4420-9bc5-25928e4fbd0c)

![Screenshot 2023-12-06 153333](https://github.com/reyhanqb/Jarkom-IT09-2023/assets/107137535/2cc2426f-ebc3-434b-ba14-7849a3117a40)

###

![Screenshot 2023-12-05 153839](https://github.com/reyhanqb/Jarkom-IT09-2023/assets/107137535/d17a78f1-3ada-487b-9c89-5e4cb9a25462)

![Screenshot 2023-12-06 153348](https://github.com/reyhanqb/Jarkom-IT09-2023/assets/107137535/869c6666-30d7-4910-921a-1c40982f6bb1)

###

![Screenshot 2023-12-05 153853](https://github.com/reyhanqb/Jarkom-IT09-2023/assets/107137535/03d4f268-6570-4ac0-856d-07c9de01b77a)

![Screenshot 2023-12-06 153407](https://github.com/reyhanqb/Jarkom-IT09-2023/assets/107137535/b66088df-0207-4eee-9bc9-6031de618389)

###

![Screenshot 2023-12-05 153911](https://github.com/reyhanqb/Jarkom-IT09-2023/assets/107137535/f5c093e4-ab0c-411a-a8a4-60a185ee1f0f)

![Screenshot 2023-12-06 153418](https://github.com/reyhanqb/Jarkom-IT09-2023/assets/107137535/17ef412b-2121-4c14-9391-887fa2932a54)

###


![Screenshot 2023-12-05 153925](https://github.com/reyhanqb/Jarkom-IT09-2023/assets/107137535/7d79eb61-cad7-452f-8e3f-aac1ca25894d)

![Screenshot 2023-12-06 153427](https://github.com/reyhanqb/Jarkom-IT09-2023/assets/107137535/06064031-4cdf-4d76-a2e5-6c530ef30e6e)

## Pembagian IP

Berikut ini merupakan IP yang didapat setelah melakukan pembagian

![Screenshot 2023-12-06 155642](https://github.com/reyhanqb/Jarkom-IT09-2023/assets/107137535/1267983a-2951-4123-96e4-da12d665012d)
