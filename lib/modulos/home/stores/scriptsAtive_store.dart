import 'package:autoscript/core/exeptions/NotFoundException.dart';
import 'package:autoscript/core/exeptions/ServerError.dart';
import 'package:autoscript/core/models/script_model.dart';
import 'package:autoscript/modulos/home/repositories/getScriptAtive_repositoryes.dart';
import 'package:flutter/foundation.dart';

class ScriptStore {
  final IScriptAtiveRepository repository;

  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);
  final ValueNotifier<List<Script>> state = ValueNotifier<List<Script>>([]);
  final ValueNotifier<String> erro = ValueNotifier<String>('');

  ScriptStore({required this.repository});

  getScriptsAtive() async {
    isLoading.value = true;
    try {
      final result = await repository.getScriptAtive();
      state.value = result;
    } on NotfoundException catch (e) {
      erro.value = e.message;
    } on ServerError catch (e) {
      erro.value = e.message;
    } catch (e) {
      erro.value = e.toString();
    }
    isLoading.value = false;
  }
}