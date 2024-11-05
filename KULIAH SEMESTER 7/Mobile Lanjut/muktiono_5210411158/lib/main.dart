import 'package:flutter/material.dart';
import 'package:muktiono_5210411158/halaman_ubah_profil_akun.dart';
import 'flash_screen.dart';
import 'login.dart';
import 'lupa_password.dart';
import 'halaman_registrasi.dart';
import 'halaman_beranda.dart';
import 'halaman_akun.dart';


void main() {
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsi App',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => const FlashScreen(),
        '/login': (context) => const LoginScreen(),
        '/lupaPassword': (context) => const LupaPasswordScreen(),
        '/registrasi': (context) => const HalamanRegistrasi(),
        '/home': (context) => const HalamanBeranda(),
        '/akun': (context) => const HalamanAkun(),
        '/halamanUbahProfilAkun':(context)=> const HalamanUbahProfilAkun()
      },
    );
  }
}
