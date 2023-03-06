import 'package:flutter/material.dart';
import 'package:online_garden/components/models/plant_model.dart';
import 'package:online_garden/features/main/presentation/bloc/bloc/event.dart';
import 'package:online_garden/features/tasks/domain/entities/task.dart';

abstract class SelectPlantEvent {}
class SetupTaskEvent extends SelectPlantEvent {}

class ChangeSelectedIndexEvent extends SelectPlantEvent{
  final int index;
  ChangeSelectedIndexEvent(this.index);
}

class SelectEvent extends SelectPlantEvent {
  final BuildContext context;
  SelectEvent(this.context);
}
