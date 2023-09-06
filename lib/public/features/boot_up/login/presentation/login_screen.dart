import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:read_with_meaning/public/features/boot_up/login/data/secure_login/utils.dart';
import 'package:read_with_meaning/public/features/experience/plan/stream_file/data/realm_repository.dart';

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
          child: Consumer(builder: (context, ref, __) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  controller: _privateKeyController,
                  decoration: const InputDecoration(labelText: 'Private Key'),
                  obscureText: true,
                  onFieldSubmitted: (_) {
                    _submit(ref);
                  },
                  textInputAction: TextInputAction.done,
                ),
                ElevatedButton(
                  onPressed: () {
                    _submit(ref);
                  },
                  child: const Text('Submit'),
                )
              ],
            );
          }),
        ),
      ),
    );
  }

  _submit(WidgetRef ref) {
    if (_formKey.currentState!.validate()) {
      logIn(context, _privateKeyController.text.trim(), mounted)
          .then((redirectYes) {
        ref.read(loginRealmRepositoryProvider);
        ref.refresh(currentUserProvider);
        //ref.read(realmSetupProvider);
        //Logger().i('realm: ${ref.read(realmProvider)}');
        //redirectYes ? context.replaceNamed(AppRoute.now.name) : null;
      });
    }
  }

  @override
  void dispose() {
    _privateKeyController.dispose();
    super.dispose();
  }
}
