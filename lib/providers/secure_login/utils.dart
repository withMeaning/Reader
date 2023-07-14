import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:read_with_meaning/providers/secure_login/storage.dart';
import 'package:read_with_meaning/src/common_widgets/errors/snack_bar.dart';

import '../server_db/auth.dart';

Future<bool> logIn(
  BuildContext context,
  String privateKey,
  bool mounted,
) async {
  try {
    var authStatus = await getAuthStatus(privateKey);
    if (authStatus.statusCode == 200) {
      await secureStorage.write(key: 'authStatus', value: "loggedIn");
      await secureStorage.write(key: 'authToken', value: privateKey);
      if (!mounted) return false;
      return true;
    } else if (authStatus.statusCode == 401) {
      if (!mounted) return false;
      snackBar(context, 'Invalid authentication.');
      await secureStorage.write(key: 'authStatus', value: "loggedOut");
    } else {
      if (!mounted) return false;
      snackBar(context, 'Something went wrong.');
      await secureStorage.write(key: 'authStatus', value: "loggedOut");
    }
  } catch (e) {
    if (e is SocketException) {
      snackBar(context, 'No internet connection.');
    } else if (e is TimeoutException) {
      snackBar(context, 'Connection timed out.');
    } else {
      snackBar(context, e.toString());
    }
    return false;
  }
  return false;
}

Future<void> logOut() async {
  return await secureStorage.write(key: 'authStatus', value: "loggedOut");
}

Future<bool> checkUserAuthorizationStatus(mounted) async {
  String? authStatus = await secureStorage.read(key: 'authStatus');
  if (!mounted) return false;
  if (authStatus != null && authStatus == 'loggedIn') {
    return true;
  } else {
    return false;
  }
}
