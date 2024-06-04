import 'package:autoscript/core/models/script_model.dart';
import 'package:dio/dio.dart';

abstract class IDioPostClient {
  Future post({required String url, required Script script});
}

class DioPostClient implements IDioPostClient {
    final dio = Dio();


  @override
  Future post({required String url, required Script script})async {
    return await dio.post(url, data: script);
  }
}
