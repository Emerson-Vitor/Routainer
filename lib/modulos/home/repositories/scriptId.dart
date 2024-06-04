import 'dart:convert';

import 'package:autoscript/core/exeptions/NotFoundException.dart';
import 'package:autoscript/core/exeptions/ServerError.dart';
import 'package:autoscript/core/http/baseUrl_config.dart';
import 'package:autoscript/core/http/dio_get.dart';
import 'package:autoscript/core/models/script_model.dart';

abstract class IScriptIdRepository {
  Future<List<Script>> getIdScriptAtive(Script script);
}

class ScriptIdRepository implements IScriptIdRepository {
  final IDioClient dio;

  ScriptIdRepository({required this.dio});

  @override
  Future<List<Script>> getIdScriptAtive(Script script) async {
    final response =
        await dio.get(url: '${BaseUrl()} /rotinas/rotina/${script.id}');

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