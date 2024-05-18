import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:posts_all/core/error/exception.dart';

import '../network_call/call.dart';

abstract interface class NetworkDataSource {
  Future<dynamic> apiTypeGet({
    required String url,
  });

  Future<dynamic> apiTypePost({
    required String url,
    required Map<String, dynamic> body,
  });

  Future<dynamic> apiTypeDelete({
    required String url,
  });

  Future<dynamic> apiTypePut({
    required String url,
    required Map<String, dynamic> body,
  });
}

class NetworkImpl implements NetworkDataSource {
  final NetworkMethodsCall networkMethodsCall;

  NetworkImpl(this.networkMethodsCall);

  //delete
  @override
  Future<dynamic> apiTypeDelete(
      {required String url}) async {
    try {
      final response =
          await networkMethodsCall.apiTypeDelete(url: url);
      return returnResponse(response);
    } on HttpException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  // get
  @override
  Future<dynamic> apiTypeGet({required String url}) async {
    try {
      final response = await networkMethodsCall.apiTypeGet(url: url);
      return returnResponse(response);
    } on HttpException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  // post
  @override
  Future<dynamic> apiTypePost(
      {required String url, required Map<String, dynamic> body}) async {
    try {
      final response =
          await networkMethodsCall.apiTypePost(url: url, body: body);
      return returnResponse(response);
    } on HttpException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  //put
  @override
  Future<dynamic> apiTypePut(
      {required String url, required Map<String, dynamic> body}) async {
    try {
      final response =
          await networkMethodsCall.apiTypePut(url: url, body: body);
      return returnResponse(response);
    } on HttpException catch (e) {
      throw ServerException(e.message);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  //convert data into Map form
  static dynamic returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        final responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw ServerException("Something Went Wrong");
      case 500:
      case 404:
        throw ServerException("Unauthorized Request");
      default:
        throw ServerException(
            "Error occurred while communicating with server with status code");
    }
  }
}
