import 'package:online_garden/components/models/plant_model.dart';
import 'package:online_garden/features/main/data/data_sources/local/tasks_datasource.dart';
import 'package:online_garden/features/main/domain/entities/plant_model.dart';
import 'package:online_garden/features/main/domain/entities/task_model.dart';
import 'package:online_garden/features/main/domain/repositories/repository.dart';

class MainRepositoryImpl extends MainRepository {
  final _tasksDataSources = LocalDataSources();

  @override
  Future<List<TaskModel>> getTasks() async {
    return _tasksDataSources.getTasks();
  }

  @override
  Future<void> updateTasks(List<TaskModel> tasksToUpdate) async {
    _tasksDataSources.updateTasks(tasksToUpdate);
  }

  @override
  Future<List<PlantModel>> getPlants() async {
    return _tasksDataSources.getPlants();
  }

  @override
  Future<void> updatePlants(List<PlantComponent> plantsToUpdate) async {
    _tasksDataSources.updatePlants(plantsToUpdate);
  }


}