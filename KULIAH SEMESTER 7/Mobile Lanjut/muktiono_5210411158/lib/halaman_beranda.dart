import 'package:flutter/material.dart';
import 'package:muktiono_5210411158/halaman_akun.dart';
import 'package:muktiono_5210411158/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HalamanBeranda(),
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.purple,
      ),
    );
  }
}

class HalamanBeranda extends StatefulWidget {
  const HalamanBeranda({super.key});

  @override
  _HalamanBerandaState createState() => _HalamanBerandaState();
}

class _HalamanBerandaState extends State<HalamanBeranda> {
  int _currentIndex = 0;

  // Fungsi untuk menangani perubahan halaman saat item di-tap
  void _onItemTapped(int index) {
    if (index == 2) { // Indeks untuk "Logout"
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
    } 
    else {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Guest'),
        leading: const Icon(Icons.account_circle),
        actions: const [
          Icon(Icons.notifications),
          Icon(Icons.settings),
        ],
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          SingleChildScrollView( // Membuat konten scrollable
            child: _buildHalamanHome(), // Halaman utama
          ),
          const HalamanAkun(), // Halaman akun
          const LoginScreen() // Halaman login
        ],
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Akun'),
          BottomNavigationBarItem(icon: Icon(Icons.logout), label: 'Logout'),
        ],
        currentIndex: _currentIndex, // Set the active item based on the current index
        onTap: _onItemTapped, // Handle tap to update the index
        selectedItemColor: Colors.blue, // Active color
        unselectedItemColor: Colors.grey, // Inactive color
      ),
    );
  }

  Widget _buildHalamanHome() {
    return Column(
      children: [
        // Grid View
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Widget Grid View', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              SizedBox(
                height: 120, // Adjust the height as needed
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5, // Example count
                  itemBuilder: (context, index) {
                    return Container(
                      width: 100,
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.purple[50],
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.image, size: 40),
                          SizedBox(height: 8),
                          Text('Artist'),
                          Text('Song', style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),



        // List View
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Widget List View', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(), // Disable scrolling for this list
                itemCount: 5, // Example count
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.purple[50],
                    ),
                    child: const ListTile(
                      leading: Icon(Icons.image, size: 40),
                      title: Text('Headline'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Ini adalah widget list view...'),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Icon(Icons.calendar_today, size: 14),
                              SizedBox(width: 5),
                              Text('Today • 23 min', style: TextStyle(fontSize: 12)),
                            ],
                          ),
                        ],
                      ),
                      trailing: Icon(Icons.play_arrow),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
