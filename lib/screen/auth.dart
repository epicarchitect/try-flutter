import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Auth'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              validator: (value) {
                return value == null || value.isEmpty ? 'Empty!' : null;
              },
            ),
            TextFormField(
              validator: (value) {
                return value == null || value.isEmpty ? 'Empty!' : null;
              },
            ),
            ElevatedButton(
              onPressed: () {
                final isValidForm = _formKey.currentState!.validate();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      isValidForm ? 'Your input valid!' : 'Your input invalid!',
                    ),
                  ),
                );
              },
              child: const Text('Validate!'),
            )
          ],
        ),
      ),
    );
  }
}
