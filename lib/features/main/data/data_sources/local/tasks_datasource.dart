import 'dart:convert';
import 'package:online_garden/components/models/plant_model.dart';
import 'package:online_garden/components/services/hive_db.dart';
import 'package:online_garden/features/main/data/models/plant_model.dart';
import 'package:online_garden/features/main/domain/entities/plant_model.dart';
import 'package:online_garden/features/main/domain/entities/task_model.dart';

import '../../models/task_model.dart';

class LocalDataSources {

  final _taskTag = 'tasks';
  final _plantTag = 'plants';

  Future<List<PlantModel>> getPlants() async {
    return (await HiveDB.getBox(_plantTag)).map((e) =>
        PlantModelImpl.fromJson(jsonDecode(e))).toList();
  }

  Future<List<TaskModel>> getTasks() async {
    return (await HiveDB.getBox(_taskTag)).map((e) =>
        TaskModelImpl.fromJson(jsonDecode(e))).toList();
  }

  Future<void> updatePlants(List<PlantComponent> plantsToUpdate) async {
    // TODO: implement updatePlants
    await HiveDB.deleteBox(_plantTag);
    final list = plantsToUpdate.map((e) =>
        PlantModelImpl(name: e.name,
          description: e.description,
          image: e.image,
          nickname: e.nickname,)).toList();
    for (var item in list) {
      HiveDB.setBox(item.toJson(), _plantTag);
    }
  }

  Future<void> updateTasks(List<TaskModel> tasksToUpdate) async {
    // TODO: implement updateTasks
    await HiveDB.deleteBox(_taskTag);
    List<TaskModelImpl> list = tasksToUpdate.map((e) => TaskModelImpl(name: e.name, isComplete: e.isComplete, taskTypes: e.taskTypes, frequency: e.frequency)).toList();
    for(var item in list) {
      HiveDB.setBox(item.toJson(), _taskTag);
    }
  }
}
