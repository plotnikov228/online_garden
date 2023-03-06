import 'package:online_garden/components/models/plant_model.dart';
import 'package:online_garden/components/models/task_model.dart';
import 'package:online_garden/features/main/domain/entities/plant_model.dart';
import 'package:online_garden/features/main/domain/entities/task_model.dart';

abstract class MainRepository {
  Future<List<TaskModel>> getTasks ();
  Future<void> updateTasks (List<TaskModel> tasksToUpdate);

  Future<List<PlantModel>> getPlants ();
  Future<void> updatePlants (List<PlantComponent> plantsToUpdate);
}