abstract interface class NetworkMethodsCall {
  Future apiTypeGet({
    required String url,
  });

  Future apiTypePost({
    required String url,
    required Map<String, dynamic> body,
  });

  Future apiTypeDelete({
    required String url,
  });

  Future apiTypePut({
    required String url,
    required Map<String, dynamic> body,
  });
}
