import 'package:flutter/material.dart';
import 'package:my_app/qr_code_page.dart';
import 'package:my_app/transaction_page.dart';
import 'package:my_app/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    _BerandaPage(),
    const QrCodePage(),
    const TransactionPage(),
    const ProfilePage(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Theme.of(context).colorScheme.secondary,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code),
            label: 'QR Code',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.payment),
            label: 'Transaksi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}

class _BerandaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/mitra_i_saku_logo.png',
              width: 150, // adjust the width to your liking
              height: 150, // adjust the height to your liking
            ),
            const SizedBox(height: 16),
            const Text('Selamat datang di mitra i.saku!', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            const SizedBox(height: 128),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _MenuContainer(
                  logo: Icons.transfer_within_a_station,
                  label: 'Transfer',
                ),
                _MenuContainer(
                  logo: Icons.monetization_on,
                  label: 'Cash',
                ),
                _MenuContainer(
                  logo: Icons.upgrade,
                  label: 'Top Up',
                ),
                _MenuContainer(
                  logo: Icons.payment,
                  label: 'Transaksi',
                ),
              ],
            ),
            const SizedBox(height: 48),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _MenuContainer(
                  logo: Icons.shopping_cart,
                  label: 'Merchant',
                ),
                _MenuContainer(
                  logo: Icons.discount,
                  label: 'Diskon',
                ),
                _MenuContainer(
                  logo: Icons.qr_code,
                  label: 'Scan QR',
                ),
                _MenuContainer(
                  logo: Icons.info,
                  label: 'Informasi',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _MenuContainer extends StatelessWidget {
  final IconData logo;
  final String label;

  const _MenuContainer({required this.logo, required this.label});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      child: Column(
        children: [
          Icon(logo, size: 30, color: Theme.of(context).colorScheme.primary,),
          Text(label, style: TextStyle(fontSize: 12, color: Theme.of(context).colorScheme.primary,)),
        ],
      ),
    );
  }
}