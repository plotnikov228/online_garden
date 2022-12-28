
import 'package:online_garden/features/main/domain/entities/plant_model.dart';
import 'package:online_garden/features/main/domain/entities/task_model.dart';

abstract class MainState {}

class InitialState extends MainState {

}
class HomeState extends MainState {
  final List<TaskModel> tasks;
  final List<PlantModel> plants;

  HomeState(this.tasks, this.plants);
}
class MenuState extends MainState {

}
