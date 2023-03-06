import 'package:online_garden/features/plants/domain/entities/plant_model.dart';

abstract class CustomizationPlantEvent {}

class AddPlantEvent extends CustomizationPlantEvent {
  final Plant plant;

  AddPlantEvent(this.plant);
}