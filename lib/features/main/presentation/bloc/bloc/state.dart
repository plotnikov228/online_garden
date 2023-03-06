
import 'package:online_garden/components/models/plant_model.dart';
import 'package:online_garden/features/main/domain/entities/plant_model.dart';
import 'package:online_garden/features/main/domain/entities/task_model.dart';

abstract class MainState {}

class HomeLoadingState extends MainState {}
class HomeState extends MainState {
  final bool isLoading;
  final List<TaskModel> tasks;
  final List<PlantComponent> plants;

  HomeState(this.tasks, this.plants, this.isLoading);
}
class MenuState extends MainState {

}
