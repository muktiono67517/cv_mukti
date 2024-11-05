import 'package:flutter/material.dart';
import 'package:muktiono_5210411158/halaman_beranda.dart';
import 'package:muktiono_5210411158/login.dart';

class HalamanUbahProfilAkun extends StatefulWidget {
  const HalamanUbahProfilAkun({super.key});

  @override
  _HalamanUbahProfilAkunState createState() => _HalamanUbahProfilAkunState();
}

class _HalamanUbahProfilAkunState extends State<HalamanUbahProfilAkun> {
  int _currentIndex = 1; // Set default index untuk halaman ini (Akun)

  // Fungsi untuk menangani perubahan halaman saat item di-tap
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    // Navigasi ke halaman yang sesuai
    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HalamanBeranda()),
        );
        break;
      case 1:
        // Tetap di Halaman Ubah Profil Akun
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Untuk kembali ke halaman sebelumnya
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 10),
              // Bagian tampilan gambar profil
              Container(
                padding: const EdgeInsets.all(0), // Kurangi padding agar lebih kecil
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: const Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.account_circle, size: 50, color: Colors.grey), // Kurangi ukuran ikon
                        Icon(Icons.account_circle, size: 50, color: Colors.grey),
                      ],
                    ),
                    SizedBox(height: 8), // Kurangi jarak antar elemen
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.account_circle, size: 50, color: Colors.grey),
                        Icon(Icons.account_circle, size: 50, color: Colors.grey),
                      ],
                    ),
                    SizedBox(height: 12), // Kurangi jarak sebelum teks
                    Text(
                      'Nama Lengkap', // Ganti dengan nama user
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold), // Ukuran font lebih kecil
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Asal Universitas', // Ganti dengan asal universitas user
                      style: TextStyle(fontSize: 12, color: Colors.grey), // Ukuran font lebih kecil
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Bagian Form Input
              const ProfileTextField(labelText: 'Email'),
              const SizedBox(height: 10),
              const ProfileTextField(labelText: 'Nama'),
              const SizedBox(height: 10),
              const ProfileTextField(labelText: 'Nomor Telepon'),
              const SizedBox(height: 10),
              const ProfileTextField(labelText: 'Alamat'),
              const SizedBox(height: 20),
              
              // Tombol Ubah Profil
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Ubah Profil',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Akun',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: 'Logout',
          ),
        ],
        currentIndex: _currentIndex, // Set the active item based on the current index
        onTap: _onItemTapped, // Handle tap to update the index
        selectedItemColor: Colors.blue, // Active color
        unselectedItemColor: Colors.grey, // Inactive color
      ),
    );
  }
}

class ProfileTextField extends StatelessWidget {
  final String labelText;

  const ProfileTextField({super.key, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.blue),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.blueAccent),
        ),
      ),
    );
  }
}
