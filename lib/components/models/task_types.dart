import 'package:json_annotation/json_annotation.dart';
import 'package:online_garden/components/models/frequency_types.dart';

part 'task_types.g.dart';

abstract class TaskTypes {
  final String text = 'TaskTypes';

  Map<String, dynamic> toJson();

  TaskTypes fromJson(Map<String, dynamic> json);
}

@JsonSerializable()
class Watering extends TaskTypes {
  @override
  final String text = 'Watering';

  TaskTypes fromJson(Map<String, dynamic> json) => _$WateringFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$WateringToJson(this);
}

@JsonSerializable()
class LandTransplantation extends TaskTypes {
  @override
  final String text = 'Land transplantation';

  @override
  TaskTypes fromJson(Map<String, dynamic> json) =>
      _$LandTransplantationFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$LandTransplantationToJson(this);
}

@JsonSerializable()
class TransplantingToAnotherPot extends TaskTypes {
  @override
  final String text = 'Transplanting to another pot';

  @override
  TaskTypes fromJson(Map<String, dynamic> json) =>
      _$TransplantingToAnotherPotFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TransplantingToAnotherPotToJson(this);
}

@JsonSerializable()
class FertilizingPlants extends TaskTypes {
  @override
  final String text = 'Fertilizing plants';

  @override
  TaskTypes fromJson(Map<String, dynamic> json) =>
      _$FertilizingPlantsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$FertilizingPlantsToJson(this);
}

@JsonSerializable()
class CustomTaskType extends TaskTypes {
  @override
  String text = 'Custom task type';

  @override
  TaskTypes fromJson(Map<String, dynamic> json) =>
      _$CustomTaskTypeFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CustomTaskTypeToJson(this);
}
