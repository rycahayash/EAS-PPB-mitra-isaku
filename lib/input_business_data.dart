import 'package:flutter/material.dart';
import 'package:my_app/registered_merchant_page.dart';

class InputBusinessData extends StatefulWidget {
  const InputBusinessData({super.key});

  @override
  _InputBusinessDataState createState() => _InputBusinessDataState();
}

class _InputBusinessDataState extends State<InputBusinessData> {
  final _formKey = GlobalKey<FormState>();
  late String _namaBisnis;
  late String _namaContactPerson;
  late String _jenisBisnis;
  late String _kota;
  late String _pesan;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jadi Merchant'),
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
                'Anda ingin menjadi merchant kami, silahkan isi data berikut:',
                style: TextStyle(fontSize: 18.0),
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Nama Bisnis'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Masukkan nama bisnis Anda';
                  }
                  return null;
                },
                onSaved: (value) => _namaBisnis = value?? '',
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Nama Contact Person'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Masukkan nama contact person pada bisnis Anda';
                  }
                  return null;
                },
                onSaved: (value) => _namaContactPerson = value?? '',
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Jenis Bisnis'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Masukkan jenis bisnis Anda';
                  }
                  return null;
                },
                onSaved: (value) => _jenisBisnis = value?? '',
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Kota'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Masukkan kota bisnis Anda berada';
                  }
                  return null;
                },
                onSaved: (value) => _kota = value?? '',
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Pesan (opsional)'),
                onSaved: (value) => _pesan = value?? '',
                initialValue: '',
              ),
              const SizedBox(height: 32),
              FilledButton(
                onPressed: () {
                  if (_formKey.currentState?.validate()?? false) {
                    _formKey.currentState?.save();
                    // Login logic here
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => RegisteredMerchantPage()),
                    );
                  }
                },
                style: ButtonStyle(
                  minimumSize: WidgetStateProperty.all(const Size(double.infinity, 48)),
                ),
                child: const Text('Kirim', style: TextStyle(fontSize: 20),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}