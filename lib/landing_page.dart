import 'package:flutter/material.dart';
import 'package:my_app/login_page.dart';
import 'package:my_app/sign_up_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Logo mitra i.saku
            Image.asset(
              'images/mitra_i_saku_logo.png',
              width: 400,
              height: 400,
            ),
            const SizedBox(height: 16),
            const Text(
              'Bisnis makin lancar, transaksi mudah',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 64),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: FilledButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                style: ButtonStyle(
                  minimumSize: WidgetStateProperty.all(const Size(double.infinity, 48)),
                ),
                child: const Text('Masuk', style: TextStyle(fontSize: 20),),
              ),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUpPage()),
                );
              },
              child: const Text('Belum punya akun? Daftar Sekarang', style: TextStyle(fontSize: 18),),
            ),
          ],
        ),
      ),
    );
  }
}