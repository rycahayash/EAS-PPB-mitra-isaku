import 'package:flutter/material.dart';
import 'package:my_app/input_business_data.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  late String _hp;
  late String _password;
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Masuk'),
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
                'Silahkan masukkan No. HP dan Password yang terdaftar.',
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
                    return 'Masukkan password Anda';
                  }
                  return null;
                },
                onSaved: (value) => _password = value?? '',
              ),
              const SizedBox(height: 200),
              FilledButton(
                onPressed: () {
                  if (_formKey.currentState?.validate()?? false) {
                    _formKey.currentState?.save();
                    // Login logic here
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => InputBusinessData()),
                    );
                  }
                },
                style: ButtonStyle(
                  minimumSize: WidgetStateProperty.all(const Size(double.infinity, 48)),
                ),
                child: const Text('Masuk', style: TextStyle(fontSize: 20),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}