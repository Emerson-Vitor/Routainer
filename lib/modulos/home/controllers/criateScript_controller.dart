import 'package:autoscript/core/models/script_model.dart';
import 'package:autoscript/modulos/home/repositories/criateScript.dart';

class CreateScriptContolller {
  Future<void> createScript(Script script)async{
    CreateScriptReposirory? reposirory;
    String result = await reposirory!.createScript(script);
  }
}