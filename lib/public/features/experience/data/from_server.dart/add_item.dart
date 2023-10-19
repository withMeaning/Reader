import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:read_with_meaning/public/constants/text_strings.dart';
import 'package:read_with_meaning/public/features/boot_up/login/data/secure_login/storage.dart';

// ! Drift
/* Future<http.Response> addRead(Read read) async {
  Logger().d("posting read: $read");
  String authToken = await secureStorage.read(key: 'authToken') ?? "";
  final bodyJson = json.encode({
    "title": read.base.content,
    "content": read.mainContent,
    "author": read.base.author,
    "link": read.link,
    "type": "read"
  });
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
} */

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

Future<http.Response> addResonance(String expId, int resonance) async {
  Logger().d("posting resonance $resonance for exp $expId");
  String authToken = await secureStorage.read(key: 'authToken') ?? "";
  final bodyJson = json.encode({
    "content": resonance.toString(),
    "link": expId,
    "type": "resonance",
  });
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
