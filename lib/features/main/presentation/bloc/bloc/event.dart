import 'package:flutter/widgets.dart';
import 'package:online_garden/components/models/plant_model.dart';
import 'package:online_garden/features/main/domain/entities/plant_model.dart';
import 'package:online_garden/features/main/domain/entities/task_model.dart';

abstract class MainEvent {}

class GoToAnotherPageEvent extends MainEvent{
  final int index;

  GoToAnotherPageEvent(this.index);
}

class SetupHomePage extends MainEvent {

}
class UpdateTasksEvent extends MainEvent {
  final List<TaskModel> tasks;

  UpdateTasksEvent(this.tasks);
}

class UpdatePlantsEvent extends MainEvent {
  final List<PlantComponent> plants;
  final PlantComponent value;

  UpdatePlantsEvent(this.plants, this.value);

}