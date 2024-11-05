import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HalamanRegistrasi extends StatefulWidget {
  const HalamanRegistrasi({super.key});

  @override
  _HalamanRegistrasiState createState() => _HalamanRegistrasiState();
}

class _HalamanRegistrasiState extends State<HalamanRegistrasi> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController nomorTeleponController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController universitasController = TextEditingController();

  void _register() async {
    String email = emailController.text;
    String password = passwordController.text;
    String confirmPassword = confirmPasswordController.text;
    String nama = namaController.text;
    String nomorTelepon = nomorTeleponController.text;
    String alamat = alamatController.text;
    String universitas = universitasController.text;

    // Validasi semua field wajib diisi
    if (nama.isEmpty) {
      _showErrorDialog("Nama lengkap wajib diisi!");
      return;
    }
    if (universitas.isEmpty) {
      _showErrorDialog("Nama universitas wajib diisi!");
      return;
    }
    if (email.isEmpty) {
      _showErrorDialog("Email wajib diisi!");
      return;
    }
    if (password.isEmpty) {
      _showErrorDialog("Password wajib diisi!");
      return;
    }
    if (confirmPassword.isEmpty) {
      _showErrorDialog("Konfirmasi password wajib diisi!");
      return;
    }
 if (nomorTelepon.length != 12) {
    _showErrorDialog("Nomor telepon harus 12 digit!");
    return;
  }
    if (alamat.isEmpty) {
      _showErrorDialog("Alamat wajib diisi!");
      return;
    }
    if (password.length < 8) {
      _showErrorDialog("Password minimal 8 karakter!");
      return;
    }
    if (password != confirmPassword) {
      _showErrorDialog("Password dan Konfirmasi Password tidak cocok!");
      return;
    }
    if (nomorTelepon.length > 12) {
      _showErrorDialog("Nomor telepon maksimal 12 digit!");
      return;
    }

    final response = await http.post(
      Uri.parse('https://5210411158.pythonanywhere.com/register'), // Ganti dengan URL API yang sesuai
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'password': password,
        'nama': nama,
        'nomor_telepon': nomorTelepon,
        'alamat': alamat,
        'universitas': universitas,
      }),
    );

    if (response.statusCode == 201) {
      // Registrasi berhasil
      final data = jsonDecode(response.body);
      _showSuccessDialog(data['message']);
    } else {
      // Gagal registrasi
      final data = jsonDecode(response.body);
      _showErrorDialog(data['message']);
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Kesalahan'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showSuccessDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Sukses'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop(); // Kembali ke halaman sebelumnya
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/icon_utama.png'),
              const SizedBox(height: 20),

              const Text(
                "Daftar",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),

              // Input Nama
              const Align(
                alignment: Alignment.centerLeft,
                child: Text("Masukkan Nama", style: TextStyle(fontSize: 16)),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: namaController,
                decoration: const InputDecoration(
                  hintText: "Nama Lengkap",
                  hintStyle: TextStyle(fontWeight: FontWeight.normal), // Hint text tidak tebal
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),

              // Input Universitas
              const Align(
                alignment: Alignment.centerLeft,
                child: Text("Masukkan Universitas", style: TextStyle(fontSize: 16)),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: universitasController,
                decoration: const InputDecoration(
                  hintText: "Nama Universitas",
                  hintStyle: TextStyle(fontWeight: FontWeight.normal),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),

              // Input Email
              const Align(
                alignment: Alignment.centerLeft,
                child: Text("Masukkan Email", style: TextStyle(fontSize: 16)),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: "example@email.com",
                  hintStyle: TextStyle(fontWeight: FontWeight.normal),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),

              // Input Password
              const Align(
                alignment: Alignment.centerLeft,
                child: Text("Masukkan Password", style: TextStyle(fontSize: 16)),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: "Minimal 8 karakter",
                  hintStyle: TextStyle(fontWeight: FontWeight.normal),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),

              // Konfirmasi Password
              const Align(
                alignment: Alignment.centerLeft,
                child: Text("Konfirmasi Password", style: TextStyle(fontSize: 16)),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: confirmPasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: "Ulangi Password",
                  hintStyle: TextStyle(fontWeight: FontWeight.normal),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),

              // Input Nomor Telepon
              const Align(
                alignment: Alignment.centerLeft,
                child: Text("Masukkan Nomor Telepon", style: TextStyle(fontSize: 16)),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: nomorTeleponController,
                decoration: const InputDecoration(
                  hintText: "08123456789",
                  hintStyle: TextStyle(fontWeight: FontWeight.normal),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),

              // Input Alamat
              const Align(
                alignment: Alignment.centerLeft,
                child: Text("Masukkan Alamat", style: TextStyle(fontSize: 16)),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: alamatController,
                decoration: const InputDecoration(
                  hintText: "Alamat Lengkap",
                  hintStyle: TextStyle(fontWeight: FontWeight.normal),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),

              // Tombol Daftar
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _register,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                  ),
                  child: const Text("Daftar"),
                ),
              ),
              const SizedBox(height: 20),

              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Sudah Memiliki Akun? "),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop(); // Kembali ke halaman sebelumnya
                      },
                      child: const Text(
                        "Masuk",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
