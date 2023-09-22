# Jarkom-Modul-1-IT09-2023

# Anggota

Muhammad Hilmy Adhi Pradityo - 5027211053
Athaya Reyhan Nugroho - 5027211067

# Soal 1
## Pertanyaan
User melakukan berbagai aktivitas dengan menggunakan protokol FTP. Salah satunya adalah mengunggah suatu file.
   a. Berapakah sequence number (raw) pada packet yang menunjukkan aktivitas tersebut?
   b. Berapakah acknowledge number (raw) pada packet yang menunjukkan aktivitas tersebut? 
   c. Berapakah sequence number (raw) pada packet yang menunjukkan response dari aktivitas tersebut?
   d. Berapakah acknowledge number (raw) pada packet yang menunjukkan response dari aktivitas tersebut?

## Jawaban
1. Gunakan script filter “ftp || ftp-data”
2. Cari dengan kata kunci STOR dan sequence number dan acknowledge number akan muncul
3. Jawab per soalnya

![Picture6](https://github.com/reyhanqb/Jarkom-Modul-1-IT09-2023/assets/107137535/d3427f93-0a7b-421b-89b6-a28568b47bd2)

# Soal 2
## Pertanyaan
Sebutkan web server yang digunakan pada portal praktikum Jaringan Komputer!

## Jawaban
Nama server bisa didapat dengan cara mengakses developer tools di web, lalu cek response header yang pertama kali muncul.
1. Pada soal 2, lakukan inspect pada soal
2. Pilih bagian network dan klik bagian events
3. Terdapat keterangan nama server yang digunakan sesuai yang diperintah soal
4. Pada wsl masukkan command “nc 10.21.78.111 13579”
5. Masukkan jawaban yang diminta (gunicorn) dan flag akan muncul

![Picture1](https://github.com/reyhanqb/Jarkom-Modul-1-IT09-2023/assets/107137535/af4b07bc-bde3-4c4a-93f2-4fd387fa1dc1)
![Picture2](https://github.com/reyhanqb/Jarkom-Modul-1-IT09-2023/assets/107137535/da8263f3-c18b-41dc-971a-b4f28ffa12a8)

# Soal 3
## Pertanyaan
a.) Berapa banyak paket yang tercapture dengan IP source maupun destination address adalah 239.255.255.250 dengan port 3702?
b.) Protokol layer transport apa yang digunakan?

## Jawaban
a.) Gunakan query (ip.src ==  239.255.255.250 || ip.dst ==  239.255.255.250) && udp.port == 3702, lalu export file untuk hitung jumlah package yang ada.

![Screenshot (197)](https://github.com/reyhanqb/Jarkom-Modul-1-IT09-2023/assets/107137535/e9092fb2-e4da-4741-8de4-6971a403ed31)

b.) UDP

![Picture3](https://github.com/reyhanqb/Jarkom-Modul-1-IT09-2023/assets/107137535/f60bab35-6f52-4a98-b736-6ef0fdd65226)

# Soal 4
## Pertanyaan
Berapa nilai checksum yang didapat dari header pada paket nomor 130?

## Jawaban
1. Upload soal 4 ke wireshark dan buka packet no 130 sesuai yang ada pada soal
2. Value checksum dapat dilihat disini

![Picture4](https://github.com/reyhanqb/Jarkom-Modul-1-IT09-2023/assets/107137535/bc40910d-0e08-4fc8-a3f1-2f87b8c00bfc)

3. Ketik command “nc 10.21.78.111 13591” pada wsl
4. Jawab dengan checksum tadi dan flag muncul

# Soal 5
## Pertanyaan
Elshe menemukan suatu file packet capture yang menarik. Bantulah Elshe untuk menganalisis file packet capture tersebut.
   a. Berapa banyak packet yang berhasil di capture dari file pcap tersebut?
   b. Port berapakah pada server yang digunakan untuk service SMTP?
   c. Dari semua alamat IP yang tercapture, IP berapakah yang merupakan public IP?

## Jawaban
1. Upload soal 5 ke wireshark

2. Follow UDP Stream package lalu didapat password NWltcGxlUGFzNXdvcmQ= yang dienkripsi dengan base64.
![Screenshot (200)](https://github.com/reyhanqb/Jarkom-Modul-1-IT09-2023/assets/107137535/547dc85f-9879-4638-a532-d0293d2434f1)
3. Setelah dibuka file .txt, keluar instruksi untuk nc ke 10.21.78.111 11111.
   a. Jawabannya adalah 60 setelah export file dan hitung

   b. Port yg digunakan SMTP disini yaitu 25
   ![Screenshot (199)](https://github.com/reyhanqb/Jarkom-Modul-1-IT09-2023/assets/107137535/dbe957e3-c1b0-42f4-b2fc-8606621b83e7)
   c. Jawaban yang tidak mungkin cuma 192.168.1.1, karena 192 sifatnya local.

# Soal 6
## Pertanyaan
Seorang anak bernama Udin Berteman dengan SlameT yang merupakan seorang penggemar film detektif. sebagai teman yang baik, Ia selalu mengajak slamet untuk bermain valoranT bersama. suatu malam, terjadi sebuah hal yang tak terdUga. ketika udin mereka membuka game tersebut, laptop udin menunjukkan sebuah field text dan Sebuah kode Invalid bertuliskan "server SOURCE ADDRESS 7812 is invalid". ketika ditelusuri di google, hasil pencarian hanya menampilkan a1 e5 u21. jiwa detektif slamet pun bergejolak. bantulah udin dan slamet untuk menemukan solusi kode error tersebut.

# Soal 7
## Pertanyaan
Berapa jumlah packet yang menuju IP 184.87.193.88?

## Jawaban
1. Download File pcap dari no 7 dan upload ke wireshark
2. Masukkan query berikut “ip.dst==184.87.193.88” sesuai ip yang ada pada soal
3. Hitung pada bagian destination jumlah ip yang terdapat seperti pada soal (184.87.193.88)
4. Pada wsl masukkan command “nc 10.21.78.111 6565”
5. Masukkan jawaban jumlah dari ip tadi di bagian answer dan flag muncul

![Screenshot (198)](https://github.com/reyhanqb/Jarkom-Modul-1-IT09-2023/assets/107137535/ffabe3fa-7f8a-4683-b89f-182a0a146eda)

# Soal 8
## Pertanyaan
Berikan kueri filter sehingga wireshark hanya mengambil semua protokol paket yang menuju port 80! (Jika terdapat lebih dari 1 port, maka urutkan sesuai dengan abjad)

## Jawaban
1. Pada wsl masukkan “nc 10.21.78.111 7171”
2. Jawab dengan kueri yang diminta yaitu “tcp.dstport == 80 || udp.dstport == 80” dan flag ditemukan

![Picture5](https://github.com/reyhanqb/Jarkom-Modul-1-IT09-
   
# Soal 9
## Pertanyaan
Berikan kueri filter sehingga wireshark hanya mengambil paket yang berasal dari alamat 10.51.40.1 tetapi tidak menuju ke alamat 10.39.55.34!

## Jawaban
Gunakan query ip.src == 10.51.40.1 && ip.dst != 10.39.55.34

# Soal 10
## Pertanyaan
Sebutkan kredensial yang benar ketika user mencoba login menggunakan Telnet

## Jawaban
1. Upload file soal no 10 ke wireshark
2. Pada filter masukkan kata kunci “telnet”
3. Cari satu-persatu dari hasil filter tadi hingga menemukan username dan passwordnya
4. Setelah menemukannya, buka wsl dan masukkan command "nc 10.21.78.111 7373"
5. Jawab pertanyaan dengan username dan password yang ditemukan tadi sesuai format yang diminta (dhafin:kesayangannyak0k0) dan flag akan muncul

![WhatsApp Image 2023-09-22 at 6 27 52 PM](https://github.com/reyhanqb/Jarkom-Modul-1-IT09-2023/assets/107137535/610e3ad9-2c0f-4db3-abee-ca7ead2daa58)
