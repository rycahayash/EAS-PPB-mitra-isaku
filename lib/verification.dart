import 'package:flutter/material.dart';
import 'package:my_app/landing_page.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key});

  @override
  _VerificationPageState createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  final _formKey = GlobalKey<FormState>();
  late String _code;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kode Verifikasi'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              const Text(
                'Silahkan masukkan kode verifikasi yang telah dikirim melalui WhatsApp atau SMS.',
                style: TextStyle(fontSize: 18.0),
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Kode Verifikasi'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Masukkan kode verifikasi Anda';
                  }
                  return null;
                },
                onSaved: (value) => _code = value?? '',
              ),
              const SizedBox(height: 256),
              FilledButton(
                onPressed: () {
                  if (_formKey.currentState?.validate()?? false) {
                    _formKey.currentState?.save();
                    // Sign up logic here
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const LandingPage()),
                    );
                  }
                },
                style: ButtonStyle(
                  minimumSize: WidgetStateProperty.all(const Size(double.infinity, 48)),
                ),
                child: const Text('Daftar', style: TextStyle(fontSize: 20),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}