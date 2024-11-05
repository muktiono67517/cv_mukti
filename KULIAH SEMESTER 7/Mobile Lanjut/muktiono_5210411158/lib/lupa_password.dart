import 'package:flutter/material.dart';

class LupaPasswordScreen extends StatelessWidget {
  const LupaPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50], // Latar belakang yang konsisten
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo atau gambar
            Image.asset('assets/images/icon_utama.png'),
            const SizedBox(height: 20),

            // Pesan

    // Teks penjelasan "Pesan"
            const Text(
              "Pesan",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10), // Jarak setelah teks "Pesan"


            // Teks penjelasan
            const Text(
              "Masukkan email Anda dan tunggu kode etik akan dikirimkan.",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 16), // Ukuran font bisa disesuaikan
            ),
            const SizedBox(height: 20), // Jarak setelah teks penjelasan


            // Keterangan untuk Masukkan Email
           const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Masukkan Email",
                style: TextStyle(fontSize: 16), // Mengatur ukuran font
              ),
            ),
            const SizedBox(height: 8), // Jarak sebelum input email

            // Input Email dengan kotak
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Colors.blue), // Warna border
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: "example@email.com", // Hint text untuk email
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.normal, // Mengatur ketebalan hint text
                    color: Colors.grey, // Warna hint text
                  ),
                  border: InputBorder.none, // Menghapus border default
                  contentPadding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0), // Padding dalam TextField
                ),
              ),
            ),
            const SizedBox(height: 20), // Jarak setelah input email

            // Tombol Kirim
            SizedBox(
              width: double.infinity, // Membuat lebar tombol menjadi penuh
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Warna latar belakang
                  foregroundColor: Colors.white, // Warna teks saat tombol tidak aktif
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0), // Bentuk tombol
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0), // Padding tombol
                ),
                onPressed: () {
                  // Aksi saat tombol ditekan
                  // Misalnya, bisa menavigasi ke halaman lain
                },
                child: const Text("Kirim"), // Teks tombol
              ),
            ),
          ],
        ),
      ),
    );
  }
}
