import 'package:flutter/material.dart';
import 'dart:async';

class FlashScreen extends StatefulWidget {
  const FlashScreen({super.key});

  @override
  _FlashScreenState createState() => _FlashScreenState();
}

class _FlashScreenState extends State<FlashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(); // Ulang terus menerus

    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, '/login');
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/icon_utama.png'), // Ganti dengan path logo Anda
            const SizedBox(height: 30),
            const Text("Tunggu..."),
            const SizedBox(height: 20),
            // Fidget spinner
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.rotate(
                  angle: _controller.value * 2.0 * 3.14159, // 2 * pi
                  child: child,
                );
              },
              child: SizedBox(
                width: 100,
                height: 100,
                child: CustomPaint(
                  painter: FidgetSpinnerPainter(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FidgetSpinnerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    // Menggambar bentuk fidget spinner
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 40, paint);
    paint.color = Colors.red;
    canvas.drawCircle(Offset(size.width / 2 - 30, size.height / 2), 20, paint);
    canvas.drawCircle(Offset(size.width / 2 + 30, size.height / 2), 20, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
