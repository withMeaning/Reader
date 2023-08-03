import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:read_with_meaning/public/constants/text_strings.dart';
import 'package:read_with_meaning/public/features/boot_up/login/data/secure_login/storage.dart';

Future<http.Response> getItems() async {
  String authToken = await secureStorage.read(key: 'authToken') ?? "";
  var res = http.get(
    Uri.parse('$baseURL/get_items'),
    headers: <String, String>{'auth_token': authToken},
  ).timeout(const Duration(seconds: 120), onTimeout: () {
    throw TimeoutException('The connection has timed out!');
  });
  return res;
}
