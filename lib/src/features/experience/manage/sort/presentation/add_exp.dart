import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:read_with_meaning/src/constants/app_sizes.dart';
import 'package:read_with_meaning/src/features/experience/manage/sort/application/add_exp_to_db.dart';

// ? is there a cleaner way to pass the ref to application add_exp_to_db.dart?
class AddExpForm extends ConsumerStatefulWidget {
  const AddExpForm({super.key});

  @override
  ConsumerState<AddExpForm> createState() => _AddExpFormState();
}

class _AddExpFormState extends ConsumerState<AddExpForm> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _mainContentController = TextEditingController();
  final _linkController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final FocusNode _firstNode = FocusNode();
  final FocusNode _secondNode = FocusNode();
  final FocusNode _thirdNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SizedBox(
        height: MediaQuery.of(context).size.height * 0.5,
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Padding(
            padding: const EdgeInsets.all(28),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  controller: _titleController,
                  decoration: const InputDecoration(labelText: 'Title'),
                  autofocus: true,
                  onFieldSubmitted: (term) {
                    _fieldFocusChange(context, _firstNode, _secondNode);
                  },
                  textInputAction: TextInputAction.next,
                  focusNode: _firstNode,
                ),
                gapH8,
                TextFormField(
                  controller: _mainContentController,
                  minLines: 6,
                  maxLines: 10,
                  onFieldSubmitted: (term) {
                    _fieldFocusChange(context, _secondNode, _thirdNode);
                  },
                  textInputAction: TextInputAction.next,
                  focusNode: _secondNode,
                ),
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
                  child: Text(
                      style: Theme.of(context).textTheme.labelLarge, 'Add'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _submit() {
    addExpToDB(ref, _titleController.text, _mainContentController.text,
        _linkController.text);
    context.pop("");
  }

  _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _mainContentController.dispose();
    _linkController.dispose();
    super.dispose();
  }
}
