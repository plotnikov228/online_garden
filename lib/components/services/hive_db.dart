import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as path;

class HiveDB {

  static Future initDB () async{
    var _dir = await path.getApplicationDocumentsDirectory();
    Hive.init(_dir.path);
  }

  static Future deleteBox( String section) async {
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
  // in cycle
  static Future setBox(dynamic value, String section) async {
    await Hive.openBox(section);
      Hive.box(section).add(jsonEncode(value));
  }
}