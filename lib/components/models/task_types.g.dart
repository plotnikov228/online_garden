// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_types.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Watering _$WateringFromJson(Map<String, dynamic> json) => Watering();

Map<String, dynamic> _$WateringToJson(Watering instance) =>
    <String, dynamic>{'text': instance.text};

LandTransplantation _$LandTransplantationFromJson(Map<String, dynamic> json) =>
    LandTransplantation();

Map<String, dynamic> _$LandTransplantationToJson(
        LandTransplantation instance) =>
    <String, dynamic>{'text': instance.text};

TransplantingToAnotherPot _$TransplantingToAnotherPotFromJson(
        Map<String, dynamic> json) =>
    TransplantingToAnotherPot();

Map<String, dynamic> _$TransplantingToAnotherPotToJson(
        TransplantingToAnotherPot instance) =>
    <String, dynamic>{'text': instance.text};

FertilizingPlants _$FertilizingPlantsFromJson(Map<String, dynamic> json) =>
    FertilizingPlants();

Map<String, dynamic> _$FertilizingPlantsToJson(FertilizingPlants instance) =>
    <String, dynamic>{'text': instance.text};

CustomTaskType _$CustomTaskTypeFromJson(Map<String, dynamic> json) =>
    CustomTaskType()..text = json['text'] as String;

Map<String, dynamic> _$CustomTaskTypeToJson(CustomTaskType instance) =>
    <String, dynamic>{
      'text': instance.text,
    };
