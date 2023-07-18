import 'package:flutter/cupertino.dart';
import 'package:http_interceptor/http_interceptor.dart';

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({RequestData? data}) async {
    if (data != null) {
      debugPrint('Request');
      debugPrint('url: ${data.url}');
      debugPrint('headers: ${data.headers}');
      debugPrint('body: ${data.body}');
      return data;
    }
    return data!;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData? data}) async {
    if (data != null) {
      debugPrint('Response');
      debugPrint('status code: ${data.statusCode}');
      debugPrint('headers: ${data.headers}');
      debugPrint('body: ${data.body}');
      return data;
    }
    return data!;
  }
}
