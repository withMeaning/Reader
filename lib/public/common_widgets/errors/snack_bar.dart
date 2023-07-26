import 'package:flutter/material.dart';

// only call if you are within a scaffold!
snackBar(BuildContext context, String message) {
  return ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text(message)));
}
