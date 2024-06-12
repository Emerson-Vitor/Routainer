import 'package:autoscript/core/http/dio_post.dart';
import 'package:autoscript/core/models/script_model.dart';
import 'package:autoscript/modulos/home/repositories/updateScript.dart';
import 'package:dio/dio.dart';

class editScript_controller{
  Future<void> editScript(Script script)async{
     IUpdateScriptReposirory? reposirory;

   String result = await reposirory!.postUpdateScript(script);
  }
}