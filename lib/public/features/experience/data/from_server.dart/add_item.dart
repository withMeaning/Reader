import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:read_with_meaning/public/constants/text_strings.dart';
import 'package:read_with_meaning/public/features/boot_up/login/data/secure_login/storage.dart';
import 'package:read_with_meaning/shared/domain/types/read.dart';

Future<http.Response> addRead(Read read) async {
  String authToken = await secureStorage.read(key: 'authToken') ?? "";
  var res = http.get(
    Uri.parse('$baseURL/add_item'),
    headers: <String, String>{'auth_token': authToken},
  ).timeout(const Duration(seconds: 5), onTimeout: () {
    throw TimeoutException('The connection has timed out!');
  });
  return res;
}

Future<http.Response> addLink(String url) async {
  String authToken = await secureStorage.read(key: 'authToken') ?? "";
  final bodyJson = json.encode({"link": url, "type": "read"});
  Logger().d(bodyJson);
  var res = http
      .post(Uri.parse('$baseURL/add_item'),
          headers: <String, String>{
            'auth_token': authToken,
            "Content-Type": "application/json",
          },
          body: bodyJson)
      .timeout(const Duration(seconds: 120), onTimeout: () {
    throw TimeoutException("The connection has timed out!");
  });
  return res;
}

Future<http.Response> addSource(String source) async {
  String authToken = await secureStorage.read(key: 'authToken') ?? "";
  final bodyJson = json.encode({"source": source});
  Logger().d(bodyJson);
  var res = http
      .post(Uri.parse('$baseURL/add_source'),
          headers: <String, String>{
            'auth_token': authToken,
            "Content-Type": "application/json",
          },
          body: bodyJson)
      .timeout(const Duration(seconds: 5), onTimeout: () {
    throw TimeoutException("The connection has timed out!");
  });
  return res;
}
