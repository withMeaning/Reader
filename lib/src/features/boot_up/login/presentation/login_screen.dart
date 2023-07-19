import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:read_with_meaning/src/features/boot_up/login/data/secure_login/utils.dart';

import '../../../../routing/routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _privateKeyController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: _privateKeyController,
                decoration: const InputDecoration(labelText: 'Private Key'),
                obscureText: true,
                onFieldSubmitted: (_) {
                  _submit();
                },
                textInputAction: TextInputAction.done,
              ),
              ElevatedButton(
                onPressed: () {
                  _submit();
                },
                child: const Text('Submit'),
              )
            ],
          ),
        ),
      ),
    );
  }

  _submit() {
    if (_formKey.currentState!.validate()) {
      logIn(context, _privateKeyController.text, mounted).then((redirectYes) =>
          redirectYes ? context.replaceNamed(AppRoute.now.name) : null);
    }
  }

  @override
  void dispose() {
    _privateKeyController.dispose();
    super.dispose();
  }
}
