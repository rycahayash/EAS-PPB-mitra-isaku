import 'package:flutter/material.dart';
import 'package:my_app/verification.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  late String _hp;
  late String _password;
  late String _confirmpassword;
  bool _obscureText = true;
  bool _obscureConfirmText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar'),
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
                'Silahkan isi formulir di bawah ini untuk mendaftar.',
                style: TextStyle(fontSize: 18.0),
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(labelText: 'No. HP'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Masukkan No. HP Anda';
                  }
                  return null;
                },
                onSaved: (value) => _hp = value?? '',
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    icon: Icon(_obscureText ? Icons.visibility_off :Icons.visibility),
                    onPressed: () {
                      setState(() {
                        _obscureText =!_obscureText;
                      });
                    },
                  ),
                ),
                obscureText: _obscureText,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Buat password untuk akun Anda';
                  }
                  return null;
                },
                onSaved: (value) => _password = value?? '',
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Konfirmasi Password',
                  suffixIcon: IconButton(
                    icon: Icon(_obscureConfirmText ? Icons.visibility_off :Icons.visibility),
                    onPressed: () {
                      setState(() {
                        _obscureConfirmText =!_obscureConfirmText;
                      });
                    },
                  ),
                ),
                obscureText: _obscureConfirmText,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Masukkan password yang sama';
                  }
                  return null;
                },
                onSaved: (value) => _confirmpassword = value?? '',
              ),
              const SizedBox(height: 64),
              FilledButton(
                onPressed: () {
                  if (_formKey.currentState?.validate()?? false) {
                    _formKey.currentState?.save();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const VerificationPage()),
                    );
                  }
                },
                style: ButtonStyle(
                  minimumSize: WidgetStateProperty.all(const Size(double.infinity, 48)),
                ),
                child: const Text('Selanjutnya', style: TextStyle(fontSize: 20),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}