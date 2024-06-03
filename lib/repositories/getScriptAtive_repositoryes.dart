import 'dart:convert';

import 'package:autoscript/exeptions/NotFoundException.dart';
import 'package:autoscript/exeptions/ServerError.dart';
import 'package:autoscript/http/baseUrl_config.dart';
import 'package:autoscript/http/dio_get.dart';
import 'package:autoscript/models/script_model.dart';

abstract class IScriptAtiveRepository {
  Future<List<Script>> getScriptAtive();
}

class ScriptAtiveRepository implements IScriptAtiveRepository {
  final IDioClient dio;

  ScriptAtiveRepository({required this.dio});

  @override
  Future<List<Script>> getScriptAtive() async {
    final response = await dio.get(url: '${BaseUrl()}/rotinas/listar/ativar');

    if (response.statusCode == 200) {
      final List<Script> scripts = [];

      final body = jsonDecode(response.body);

      body['API'].map((item) {
        final Script script = Script.fromMap(item);
        scripts.add(script);
      }).toList();

      return scripts;
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
