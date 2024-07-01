import 'package:flutter/material.dart';

class QrCodePage extends StatelessWidget {
  const QrCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Code Bisnis'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary
      ),
      body: Center(
        child: Image.asset(
              'images/qr_code.png',
              width: 600, // adjust the width to your liking
              height: 600, // adjust the height to your liking
            ),
      ),
    );
  }
}