import 'package:flutter/material.dart';

class HalamanSyaratDanKetentuan extends StatelessWidget {
  const HalamanSyaratDanKetentuan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Syarat dan Ketentuan'),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Syarat dan Ketentuan',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Terakhir diperbarui: [Tanggal]',
              style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 16),
            Text(
              'Selamat datang di [Nama Perusahaan]! Dengan mengakses atau menggunakan layanan kami, Anda setuju untuk terikat oleh syarat dan ketentuan berikut. Jika Anda tidak setuju dengan syarat ini, Anda tidak boleh menggunakan layanan kami.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Penggunaan Layanan',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Anda setuju untuk menggunakan layanan kami hanya untuk tujuan yang sah dan sesuai dengan hukum yang berlaku. Anda tidak diperbolehkan untuk menggunakan layanan kami dengan cara yang melanggar hukum atau merugikan orang lain.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Pendaftaran Akun',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Untuk menggunakan beberapa layanan kami, Anda mungkin perlu mendaftar untuk akun. Anda setuju untuk memberikan informasi yang akurat dan terbaru saat mendaftar dan untuk menjaga kerahasiaan kata sandi Anda.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Hak Kekayaan Intelektual',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Semua konten dan materi yang terdapat dalam layanan kami, termasuk namun tidak terbatas pada teks, grafik, logo, dan perangkat lunak, adalah hak cipta dan milik [Nama Perusahaan]. Anda tidak diperbolehkan untuk menggunakan konten ini tanpa izin tertulis dari kami.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Batasan Tanggung Jawab',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Kami tidak bertanggung jawab atas kerugian atau kerusakan yang timbul dari penggunaan layanan kami. Penggunaan layanan kami sepenuhnya merupakan risiko Anda sendiri.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Perubahan pada Syarat dan Ketentuan',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Kami dapat memperbarui syarat dan ketentuan ini dari waktu ke waktu. Kami akan memberitahukan Anda tentang perubahan dengan memposting syarat dan ketentuan yang baru di halaman ini. Anda disarankan untuk meninjau syarat ini secara berkala.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Hubungi Kami',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Jika Anda memiliki pertanyaan tentang syarat dan ketentuan ini, silakan hubungi kami di [Alamat Email].',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
