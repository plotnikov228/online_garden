import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:online_garden/features/main/domain/entities/task_model.dart';
import 'package:path_provider/path_provider.dart' as path;

class LocalDataSources {

  static Future initDB () async{
    var _dir = await path.getApplicationDocumentsDirectory();
    Hive.init(_dir.path);
  }

  Future setBox(List<dynamic> model, String section) async {
    await Hive.openBox(section);
    for(var item in model) {
      Hive.box(section).add(item);
    }
  }

  Future deleteBox( String section) async {
    await Hive.box(section).clear();
  }

  static Future<List> getBox(String section) async {
    await Hive.openBox(section);
    List<dynamic> list = [];
    for(int i = 0; i < Hive.box(section).length; i++){
      list.add(Hive.box(section).getAt(i)!);
    }
    return list;
  }
}
