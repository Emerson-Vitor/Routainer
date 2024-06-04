import 'package:autoscript/core/exeptions/NotFoundException.dart';
import 'package:autoscript/core/exeptions/ServerError.dart';
import 'package:autoscript/core/http/baseUrl_config.dart';
import 'package:autoscript/core/http/dio_get.dart';


abstract class IScriptSyncRepository {
  Future<String> getSyncScript();
}

class ScriptSyncRepository implements IScriptSyncRepository {
  final IDioClient dio;

  ScriptSyncRepository({required this.dio});

  @override
  Future<String> getSyncScript() async {
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
