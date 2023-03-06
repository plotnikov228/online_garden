import 'package:online_garden/components/models/plant_model.dart';

abstract class SelectPlantState {}

class LoadingTaskState extends SelectPlantState {}
class SelectPlantTaskState extends SelectPlantState {
  final List<PlantComponent>? plants;
  final int? selectedIndex;
  SelectPlantTaskState(this.plants, this.selectedIndex);
}