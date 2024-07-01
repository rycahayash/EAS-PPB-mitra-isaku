import 'package:flutter/material.dart';
import 'package:my_app/home_page.dart';

class RegisteredMerchantPage extends StatelessWidget {
  const RegisteredMerchantPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Merchant Terdaftar'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Bisnis Anda berhasil terdaftar',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            // Logo check
            Image.asset(
              'images/symbol_check.png',
              width: 400, // adjust the width to your liking
              height: 400, // adjust the height to your liking
            ),
            const SizedBox(height: 64),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: FilledButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                style: ButtonStyle(
                  minimumSize: WidgetStateProperty.all(const Size(double.infinity, 48)),
                ),
                child: const Text('Oke', style: TextStyle(fontSize: 20),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}