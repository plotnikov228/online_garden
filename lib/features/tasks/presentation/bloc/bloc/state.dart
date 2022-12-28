import 'package:online_garden/features/main/domain/entities/plant_model.dart';
import 'package:online_garden/features/tasks/domain/entities/task.dart';

abstract class TaskState {}

class InitialTaskState extends TaskState {
  final List<PlantModel> plants;
  final Task task;

  InitialTaskState(this.plants, this.task);
}