# Jarkom-Modul-5-IT09-2023

## Anggota

Nama  | NRP
------------- | -------------
Muhammad Hilmy Adhi Pradityo  | 5027211053
Athaya Reyhan Nugroho  | 5027211067

# Topologi
![App Screenshot](https://i.ibb.co/Z2cpgLm/Whats-App-Image-2023-12-15-at-18-24-51.jpg)

# VLSM
Tentukan terlebih dahulu subnet dari topologi dengan metode VLSM.
![App Screenshot](https://i.ibb.co/Y3pn3Gp/Whats-App-Image-2023-12-15-at-18-22-54.jpg)

## Rute dan Netmask
Tentukan Subnet Mask dari masing-masing subnet, dengan jumlah host yang dibutuhkan per subnetnya.
![App Screenshot](https://i.ibb.co/kHWyCyH/Whats-App-Image-2023-12-15-at-18-28-58.jpg)

## Konfigurasi IP
Buat perhitungan dari subnet mask dari masing-masing subnet untuk menentukan pembagian konfigurasi IP.
![App Screenshot](https://i.ibb.co/TYCg0R8/Whats-App-Image-2023-12-15-at-18-30-26.jpg)

## VLSM Tree 
Setelah konfigurasi IP didapatkan, gambarkan tree VLSM nya.
![App Screenshot](https://i.ibb.co/188LQQN/Whats-App-Image-2023-12-15-at-19-38-21.jpg)

# Pengerjaan
Setelah melakukan konfigurasi subnetting serta routing maka kita dapat mulai mengerjakan soal.

## Nomor 1
Pada soal diminta untuk melakukan konfigurasi IPTABLES tanpa menggunakan MASQUERADE.

Untuk melakukan hal ini, kami menjalankan command 
```
ETH0_IP=$(ip -4 addr show eth0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}') 

iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to-source $ETH0_IP
```
Alamat IP didapat lewat command ```grep```, kemudian dijadikan variabel untuk dijalankan pada saat melakukan IPTABLES. Cara melakukan test adalah dengan melakukan ping lewat node yang sudah diberikan IP oleh Aura.

![Screenshot 2023-12-20 192326](https://github.com/reyhanqb/Jarkom-IT09-2023/assets/107137535/2657af40-7fe3-4e58-a226-4098d1c4ae9f)


![Screenshot 2023-12-20 192354](https://github.com/reyhanqb/Jarkom-IT09-2023/assets/107137535/12584bb5-37dd-4dd7-b564-a6bcc1fcef3c)

## Nomor 2

Untuk mengerjakan soal nomor 2, lakukan konfigurasi berikut pada Web Server

```
iptables -F

iptables -A INPUT -p icmp -j ACCEPT

iptables -A INPUT -p tcp --dport 8080 -j ACCEPT

iptables -A INPUT -p tcp -j DROP

iptables -A INPUT -p udp -j DROP
```
Dapat dilihat netcat berhasil dijalankan pada port 8080

![Screenshot 2023-12-20 193301](https://github.com/reyhanqb/Jarkom-IT09-2023/assets/107137535/6f68e678-633b-4f27-9317-f933466274e8)

![Screenshot 2023-12-20 193047](https://github.com/reyhanqb/Jarkom-IT09-2023/assets/107137535/4614bd30-0b43-4d2c-a2ab-d323baba2a2d)

Dan gagal dijalankan pada port 8000

![Screenshot 2023-12-20 193136](https://github.com/reyhanqb/Jarkom-IT09-2023/assets/107137535/7ba60184-b4d8-42c1-b9be-e86206f1999c)

![Screenshot 2023-12-20 193148](https://github.com/reyhanqb/Jarkom-IT09-2023/assets/107137535/68bbb0f7-0b09-46bc-aecc-1acc2b0b9a51)

## Nomor 3

Untuk mengerjakan soal nomor 3, tambahkan konfigurasi berikut pada node ```Revolte```

```
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

iptables -A INPUT -p icmp -m connlimit --connlimit-above 3 --connlimit-mask 0 -j DROP
```
![Screenshot 2023-12-20 193432](https://github.com/reyhanqb/Jarkom-IT09-2023/assets/107137535/1c6750a0-42c1-43a7-992f-dd9de9102e15)

![Screenshot 2023-12-20 193407](https://github.com/reyhanqb/Jarkom-IT09-2023/assets/107137535/ffd043dc-ea26-409b-8804-1807891a2d09)

![Screenshot 2023-12-20 193352](https://github.com/reyhanqb/Jarkom-IT09-2023/assets/107137535/600b9545-e030-4f9a-8817-194bf71cdd8e)

![Screenshot 2023-12-20 193451](https://github.com/reyhanqb/Jarkom-IT09-2023/assets/107137535/518a417d-7615-4a8b-b209-be5321713959)

Dapat dilihat bahwa setelah dilakukan ping pada tiga client, client keempat tidak mendapatkan respon karena sudah melebihi connection limit

## Nomor 4

Diminta untuk melakukan pembatasan sehingga koneksi SSH ke Web Server hanya dapat dilakukan oleh GrobeForest. Untuk melakukan hal tersebut, tambahkan konfigurasi berikut di web server.

```
iptables -A INPUT -p tcp --dport 22 -m iprange --src-range 10.68.8.2-10.68.8.255 -j ACCEPT
iptables -A INPUT -p tcp --dport 22 -m iprange --src-range 10.68.9.0-10.68.9.255 -j ACCEPT
iptables -A INPUT -p tcp --dport 22 -m iprange --src-range 10.68.10.0-10.68.10.255 -j ACCEPT
iptables -A INPUT -p tcp --dport 22 -m iprange --src-range 10.68.11.0-10.68.11.254 -j ACCEPT
```


![Screenshot 2023-12-20 194114](https://github.com/reyhanqb/Jarkom-IT09-2023/assets/107137535/720e059f-8b22-4ed2-8e0b-79f2100fe178)

![Screenshot 2023-12-20 194056](https://github.com/reyhanqb/Jarkom-IT09-2023/assets/107137535/7f0e103d-7daa-4fd5-84b4-e7f1f7437327)

Saat dilakukan nmap dari SchwerMountains, semua port yang terhubung difilter. Namun dari GrobeForest, terdapat 1 port yang dapat mengakses meskipun state saat ini adalah closed.

## Nomor 5

Pada soal diminta untuk melakukan restrict access ke Web Server pada jam 08.00 - 16.00 dari hari Senin sampai Jumat. Untuk melakukan hal tersebut, buat konfigurasi berikut pada kedua Web Server

```
iptables -A INPUT -m time --timestart 08:00 --timestop 16:00 --weekdays Mon,Tue,Wed,Thu,Fri -j ACCEPT
iptables -A INPUT -j REJECT
```

![Screenshot 2023-12-20 195355](https://github.com/reyhanqb/Jarkom-IT09-2023/assets/107137535/dbb589b4-d1c5-498b-a7b8-e6f597efb0b7)

Dapat dilihat bahwa Web Server tidak dapat diakses diluar jam kerja yang ditetapkan