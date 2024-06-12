import 'package:autoscript/core/exeptions/NotFoundException.dart';
import 'package:autoscript/core/exeptions/ServerError.dart';
import 'package:autoscript/core/http/baseUrl_config.dart';

import 'package:autoscript/core/http/dio_post.dart';
import 'package:autoscript/core/models/script_model.dart';

abstract class ICreateScriptReposirory {
  Future<String> createScript(Script script);
}

class CreateScriptReposirory implements ICreateScriptReposirory {
  final IDioPostClient dio;

  CreateScriptReposirory({required this.dio});

  @override
  Future<String> createScript(Script script) async {
    if(Script == null){
            throw Exception('Arquivo vazio');
    }
    final response =
        await dio.post(url: '${BaseUrl()}/rotinas/criar', script: script);

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
