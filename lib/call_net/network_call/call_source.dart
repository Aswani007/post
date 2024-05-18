import 'dart:convert';

import 'package:http/http.dart' as http;

import 'call.dart';

class NetworkCallSource implements NetworkMethodsCall {
  @override
  Future apiTypeDelete({required String url}) async {
    final apiUrl = Uri.parse(url);
    final response = await http.delete(apiUrl);
    return response;
  }

  @override
  Future apiTypeGet({required String url}) async {
    final apiUrl = Uri.parse(url);
    final response = await http.get(apiUrl);
    return response;
  }

  @override
  Future apiTypePost(
      {required String url, required Map<String, dynamic> body}) async {
    final apiUrl = Uri.parse(url);
    final response = await http.post(apiUrl, body: jsonEncode(body));
    return response;
  }

  @override
  Future apiTypePut(
      {required String url, required Map<String, dynamic> body}) async {
    Map<String, String> header = {
      'Content-type': 'application/json',
    };
    final apiUrl = Uri.parse(url);
    final response = await http.put(
      apiUrl,
      body: jsonEncode(body),
      headers: header,
    );
    return response;
  }
}
