import 'package:flutter/material.dart';
import 'package:myapp/main.dart';

class AuthWidget extends StatefulWidget {
  AuthWidget({Key? key}) : super(key: key) {
    initLog();
  }

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  final _formKey = GlobalKey<FormState>();

  _AuthWidgetState() {
    initLog();
  }

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
