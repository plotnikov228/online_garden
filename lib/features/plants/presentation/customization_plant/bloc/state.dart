import 'package:online_garden/features/plants/domain/entities/plant_model.dart';

abstract class CustomizationPlantState {}

class InitialCustomizationPlantState extends CustomizationPlantState {
  final Plant plant;

  InitialCustomizationPlantState(this.plant);
}