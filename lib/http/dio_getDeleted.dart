import 'package:autoscript/exeptions/NotFoundException.dart';
import 'package:autoscript/exeptions/ServerError.dart';
import 'package:autoscript/http/baseUrl_config.dart';
import 'package:autoscript/models/script_model.dart';
import 'package:dio/dio.dart';

abstract class IDioClient {
  Future get({required String url, required Script script});
}

class DioClient implements IDioClient {
  final dio = Dio();

  @override
  Future get({required String url, required Script script}) async {
    return await dio.get('${BaseUrl()}/rotinas/listar/${script.id}');
  }
}
