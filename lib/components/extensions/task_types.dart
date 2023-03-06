import 'package:online_garden/components/models/task_types.dart';

extension SearchTaskTypes on String {
  stringInTaskTypes () {
    switch(this){
      case 'Watering':
        return Watering();
      case 'Land transplantation':
        return LandTransplantation();
      case 'Transplanting to another pot':
        return TransplantingToAnotherPot();
      case 'Fertilizing plants':
        return FertilizingPlants();
      default:
        return CustomTaskType();
    }
  }
}