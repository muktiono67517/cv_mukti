import 'package:flutter/material.dart';

class HalamanKebijakanPrivasi extends StatelessWidget {
  const HalamanKebijakanPrivasi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kebijakan Privasi'),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Kebijakan Privasi',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Terakhir diperbarui: [Tanggal]',
              style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 16),
            Text(
              'Kami di [Nama Perusahaan] menghargai privasi Anda dan berkomitmen untuk melindungi informasi pribadi Anda. Kebijakan ini menjelaskan informasi yang kami kumpulkan, bagaimana kami menggunakannya, dan langkah-langkah yang kami ambil untuk melindungi informasi tersebut.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Informasi yang Kami Kumpulkan',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Kami dapat mengumpulkan informasi berikut:',
              style: TextStyle(fontSize: 16),
            ),
            Text('- Nama'),
            Text('- Alamat email'),
            Text('- Nomor telepon'),
            Text('- Informasi penggunaan aplikasi'),
            SizedBox(height: 16),
            Text(
              'Penggunaan Informasi',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Informasi yang kami kumpulkan digunakan untuk:',
              style: TextStyle(fontSize: 16),
            ),
            Text('- Menyediakan dan memelihara layanan kami'),
            Text('- Memberikan dukungan kepada pengguna'),
            Text('- Meningkatkan layanan kami'),
            Text('- Mengirimkan informasi dan pembaruan'),
            SizedBox(height: 16),
            Text(
              'Keamanan Informasi',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Kami mengambil langkah-langkah yang tepat untuk melindungi informasi pribadi Anda dari kehilangan, pencurian, dan penyalahgunaan. Namun, tidak ada metode transmisi melalui internet atau metode penyimpanan elektronik yang 100% aman.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Perubahan pada Kebijakan Privasi',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Kami dapat memperbarui kebijakan privasi ini dari waktu ke waktu. Kami akan memberitahukan Anda tentang perubahan dengan memposting kebijakan privasi yang baru di halaman ini. Anda disarankan untuk meninjau kebijakan ini secara berkala untuk mengetahui perubahan.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Hubungi Kami',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Jika Anda memiliki pertanyaan tentang kebijakan privasi ini, silakan hubungi kami di [Alamat Email].',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
