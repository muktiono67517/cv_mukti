import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:connectivity_plus/connectivity_plus.dart'; // Tambahkan import ini
import 'package:muktiono_5210411158/halaman_registrasi.dart';
import 'package:muktiono_5210411158/lupa_password.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Fungsi untuk login
  Future<void> login(String email, String password) async {
    // Memeriksa koneksi internet
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      _showErrorDialog("Tidak ada koneksi internet. Silakan coba lagi.");
      return;
    }

    final url = Uri.parse('https://5210411158.pythonanywhere.com/login'); // Ganti dengan URL API yang sesuai
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      if (data['status'] == 'success') {
        print('Login berhasil: ${data['message']}');
        // Navigasi ke halaman utama (sesuaikan dengan rute yang ada)
        Navigator.pushReplacementNamed(context, '/home'); 
      } else {
        _showErrorDialog('Login gagal: ${data['message']}');
      }
    } else {
      _showErrorDialog('Error: ${response.statusCode}, PythonAnywhere sedang bermasalah.');
    }
  }

  // Menampilkan dialog kesalahan
  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Kesalahan'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Tutup dialog
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo atau gambar
            Image.asset('assets/images/icon_utama.png'),
            const SizedBox(height: 20),

            // Judul Masuk
            const Text(
              "Masuk",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20), // Jarak setelah judul

            // Teks untuk Masukkan Email
            const Align(
              alignment: Alignment.centerLeft,
              child: Text("Masukan Email"),
            ),
            const SizedBox(height: 8), // Jarak sebelum TextField Email

            // Email input
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            const SizedBox(height: 20), // Jarak setelah Email input

            // Teks untuk Masukkan Password
            const Align(
              alignment: Alignment.centerLeft,
              child: Text("Masukan Password"),
            ),
            const SizedBox(height: 8), // Jarak sebelum TextField Password

            // Password input
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            const SizedBox(height: 20), // Jarak setelah Password input

            // Baris untuk teks "Belum Punya Akun?" dan "Lupa Password?"
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Belum Punya Akun?"),
                InkWell(
                  onTap: () {
                    // Navigasi ke LupaPasswordScreen
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LupaPasswordScreen()),
                    );
                  },
                  child: const Text(
                    "Lupa Password?",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20), // Jarak setelah baris teks

            // Teks untuk Daftar
            Align(
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () {
                  // Navigasi ke RegistrasiScreen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HalamanRegistrasi()),
                  );
                },
                child: const Text(
                  "Daftar",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ),
            const SizedBox(height: 20), // Jarak setelah teks Daftar

            // Tombol Masuk
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
                  // Panggil fungsi login saat tombol ditekan
                  login(emailController.text, passwordController.text);
                },
                child: const Text("Masuk"), // Teks tombol
              ),
            ),
          ],
        ),
      ),
    );
  }
}
