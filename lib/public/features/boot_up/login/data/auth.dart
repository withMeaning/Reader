import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:read_with_meaning/public/constants/text_strings.dart';

Future<http.Response> getAuthStatus(String privateKey) async {
  return http.get(
    Uri.parse('$baseURL/auth_session'),
    headers: <String, String>{'auth_token': privateKey},
  ).timeout(const Duration(seconds: 2), onTimeout: () {
    throw TimeoutException('The connection has timed out!');
  });
}
