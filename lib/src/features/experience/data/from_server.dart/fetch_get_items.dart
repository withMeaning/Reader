import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:read_with_meaning/src/constants/text_strings.dart';
import 'package:read_with_meaning/src/features/boot_up/login/data/secure_login/storage.dart';

Future<http.Response> getItems() async {
  String authToken = await secureStorage.read(key: 'authToken') ?? "";
  var res = http.get(
    Uri.parse('$baseURL/get_items'),
    headers: <String, String>{'auth_token': authToken},
  ).timeout(const Duration(seconds: 2), onTimeout: () {
    throw TimeoutException('The connection has timed out!');
  });
  return res;
}
