import 'package:flutter/material.dart';
import 'package:online_garden/features/plants/domain/entities/plant_model.dart';

abstract class PlantsEvent {}

class SetupPlantsEvent extends PlantsEvent {}
class SearchPlantsEvent extends PlantsEvent {
  final String text;
  final BuildContext context;
  SearchPlantsEvent(this.text, this.context);
}