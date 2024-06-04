import 'package:autoscript/core/exeptions/NotFoundException.dart';
import 'package:autoscript/core/exeptions/ServerError.dart';
import 'package:autoscript/core/http/baseUrl_config.dart';

import 'package:autoscript/core/http/dio_post.dart';
import 'package:autoscript/core/models/script_model.dart';

abstract class IDeletedScriptReposirory {
  Future<String> DeletedScript(Script script);
}

class DeletedScriptReposirory implements IDeletedScriptReposirory {
  final IDioPostClient dio;

  DeletedScriptReposirory({required this.dio});

  @override
  Future<String> DeletedScript(Script script) async {
    final response = await dio.post(
        url: '${BaseUrl()}/rotinas/deletar/${script.id}', script: script);

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
