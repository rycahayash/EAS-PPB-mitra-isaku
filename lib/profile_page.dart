import 'package:flutter/material.dart';
import 'package:my_app/landing_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/user_photo.png',
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 64),
            const Text('Nama', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            const Text('NJessy', style: TextStyle(fontSize: 20),),
            const SizedBox(height: 16),
            const Text('No. HP', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            const Text('0123456789012', style: TextStyle(fontSize: 20),),
            const SizedBox(height: 64),
            FilledButton(
              onPressed: () {
                _showConfirmationDialog(context);
              },
              style: ButtonStyle(
                minimumSize: WidgetStateProperty.all(const Size(double.infinity, 48)), // adjust the height as needed
              ),
              child: const Text('Keluar', style: TextStyle(fontSize: 20),),
            ),
          ],
        ),
      ),
    );
  }

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Keluar'),
          content: const Text('Anda yakin ingin keluar dari Mitra i.Saku?'),
          actions: [
            TextButton(
              child: const Text('Batal'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Keluar'),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LandingPage()),
                );
              },
            ),
          ],
        );
      },
    );
  }
}