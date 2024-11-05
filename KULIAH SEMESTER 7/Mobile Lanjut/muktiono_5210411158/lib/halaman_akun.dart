import 'package:flutter/material.dart';
import 'package:muktiono_5210411158/halaman_ubah_profil_akun.dart';
import 'package:muktiono_5210411158/privacy_policy.dart';
import 'package:muktiono_5210411158/terms_service.dart';

class HalamanAkun extends StatelessWidget {
  const HalamanAkun({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Akun"),
      ),
      body: ListView(
        children: [
          // Bagian untuk tampilan profil (gambar akun dan nama)
          Center(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.purple[50],
                borderRadius: BorderRadius.circular(10),
              ),


              width: 200,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.account_circle, size: 50, color: Colors.grey),
                      Icon(Icons.account_circle, size: 50, color: Colors.grey),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.account_circle, size: 50, color: Colors.grey),
                      Icon(Icons.account_circle, size: 50, color: Colors.grey),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Nama Lengkap', // Ganti dengan nama user
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Asal Universitas', // Ganti dengan asal universitas user
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20), // Spasi antara bagian profil dan menu akun

          // Daftar menu akun
          ListTile(
            title: const Text("Kelola Akun"),
            trailing: const Icon(Icons.arrow_forward), // Menambahkan panah ke kanan
            onTap: () {
              // Navigasi ke halaman Ubah Profil Akun
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HalamanUbahProfilAkun()),
              );
            },
          ),
          ListTile(
            title: const Text("Notifikasi"),
            trailing: const Icon(Icons.arrow_forward), // Menambahkan panah ke kanan
            onTap: () {},
          ),
          ListTile(
            title: const Text("Kebijakan Privasi"),
            trailing: const Icon(Icons.arrow_forward), // Menambahkan panah ke kanan
            onTap: () { 
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HalamanKebijakanPrivasi()),
              );
            },
          ),
          ListTile(
            title: const Text("Syarat dan Ketentuan"),
            trailing: const Icon(Icons.arrow_forward), // Menambahkan panah ke kanan
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HalamanSyaratDanKetentuan()),
              );
            },
          ),
        ],
      ),
    );
  }
}
