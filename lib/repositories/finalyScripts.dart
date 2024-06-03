import 'dart:convert';

import 'package:autoscript/exeptions/NotFoundException.dart';
import 'package:autoscript/exeptions/ServerError.dart';
import 'package:autoscript/http/baseUrl_config.dart';
import 'package:autoscript/http/dio_get.dart';
import 'package:autoscript/models/script_model.dart';

abstract class IFScriptSyncRepository {
  Future<String> getFSyncScript();
}

class ScriptFSyncRepository implements IFScriptSyncRepository {
  final IDioClient dio;

  ScriptFSyncRepository({required this.dio});

  @override
  Future<String> getFSyncScript() async {
    final response = await dio.get(url: '${BaseUrl()}/rotinas/lasttimesync');

    if (response.statusCode == 200) {
      return response.body;
    } else if (response.statusCode == 404) {
      throw NotfoundException(
          'Erro ${response.statusCode}, URL não encontrada');
    } else if (response.statusCode == 500) {
      throw ServerError('Erro ${response.statusCode}, Error no servidor');
    } else {
      throw Exception('Não foi possivel carregar os scripts');
    }
  }
}
