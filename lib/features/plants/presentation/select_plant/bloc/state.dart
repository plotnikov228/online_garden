import 'package:online_garden/features/plants/domain/entities/plant_model.dart';

abstract class PlantsState {}

class InitialPlantsState extends PlantsState {

}
class LoadingPlantsState extends PlantsState {}
class FullPlantsState extends PlantsState {
  final List<Plant> plants;

  FullPlantsState(this.plants);
}