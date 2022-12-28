import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:online_garden/features/main/data/data_sources/local/tasks_datasource.dart';
import 'package:online_garden/features/main/data/models/plant_model.dart';
import 'package:online_garden/features/main/data/models/task_model.dart';
import 'package:online_garden/features/main/domain/entities/plant_model.dart';
import 'package:online_garden/features/main/domain/entities/task_model.dart';
import 'package:online_garden/features/main/domain/repositroties/repository.dart';

class MainRepositoryImpl extends MainRepository {
  final LocalDataSources _tasksDataSources = LocalDataSources();

  @override
  Future<List<TaskModel>> getTasks() async {
    // TODO: implement getTasks
    await Hive.openBox('tasks');
    List<dynamic> list = [];
    for(int i = 0; i < Hive.box('tasks').length; i++){
      list.add(Hive.box('tasks').getAt(i)!);
    }
    return list.map((e) => TaskModelImpl.fromJson(jsonDecode(e))).toList();
  }

  @override
  Future<void> updateTasks(List<TaskModel> tasksToUpdate) async {
    // TODO: implement updateTasks
    await _tasksDataSources.deleteBox('tasks');
    await Hive.openBox('tasks');
    List<TaskModelImpl> list = tasksToUpdate.map((e) => TaskModelImpl(name: e.name, isComplete: e.isComplete)).toList();
    for(var item in list) {
      Hive.box('tasks').add(jsonEncode(item.toJson()));
    }
  }

  @override
  Future<List<PlantModel>> getPlants() async {
    await Hive.openBox('plants');
    List<dynamic> list = [];
    for(int i = 0; i < Hive.box('plants').length; i++){
      list.add(Hive.box('plants').getAt(i)!);
    }
    return list.map((e) => PlantModelImpl.fromJson(jsonDecode(e))).toList();
  }

  @override
  Future<void> updatePlants(List<PlantModel> plantsToUpdate) async {
    // TODO: implement updatePlants
    await _tasksDataSources.deleteBox('plants');
    List<PlantModelImpl> list = plantsToUpdate.map((e) => PlantModelImpl(name: e.name, description: e.description, image: e.image)).toList();
    await Hive.openBox('plants');
    for(var item in list) {
      Hive.box('plants').add(jsonEncode(item.toJson()));
    }
  }


}