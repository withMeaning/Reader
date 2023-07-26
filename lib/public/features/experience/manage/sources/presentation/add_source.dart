import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:read_with_meaning/public/constants/app_sizes.dart';
import 'package:read_with_meaning/public/constants/text_strings.dart';
import 'package:read_with_meaning/public/features/boot_up/login/data/secure_login/storage.dart';
import 'package:read_with_meaning/public/features/experience/data/database/database.dart';
import 'package:http/http.dart' as http;

// ? is there a cleaner way to pass the ref to application add_exp_to_db.dart?
class AddSourceForm extends ConsumerStatefulWidget {
  const AddSourceForm({super.key});

  @override
  ConsumerState<AddSourceForm> createState() => _AddExpFormState();
}

class _AddExpFormState extends ConsumerState<AddSourceForm> {
  final _formKey = GlobalKey<FormState>();
  final _linkController = TextEditingController();
  final FocusNode _thirdNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: _linkController,
                decoration: const InputDecoration(labelText: 'Link'),
                onFieldSubmitted: (_) {
                  _submit();
                },
                textInputAction: TextInputAction.done,
                focusNode: _thirdNode,
              ),
              gapH12,
              ElevatedButton(
                onPressed: () {
                  _submit();
                },
                child:
                    Text(style: Theme.of(context).textTheme.labelLarge, 'Add'),
              )
            ],
          ),
        ),
      ),
    );
  }

  _submit() {
    //addExpToDB(ref, _titleController.text, _mainContentController.text,
    // _linkController.text);
    final database = ref.read(AppDatabase.provider);
    database.into(database.sources).insert(
        SourcesCompanion.insert(link: _linkController.text, resonance: 50));
    addSource(_linkController.text);
    context.pop("");
  }

  @override
  void dispose() {
    _linkController.dispose();
    super.dispose();
  }
}

Future<http.Response> addSource(String source) async {
  String authToken = await secureStorage.read(key: 'authToken') ?? "";
  final bodyJson = json.encode({"source": source});
  debugPrint(bodyJson);
  var res = http
      .post(Uri.parse('$baseURL/add_source'),
          headers: <String, String>{
            'auth_token': authToken,
            "Content-Type": "application/json",
          },
          body: bodyJson)
      .timeout(const Duration(seconds: 2), onTimeout: () {
    throw TimeoutException();
  });
  return res;
}

class TimeoutException {}
