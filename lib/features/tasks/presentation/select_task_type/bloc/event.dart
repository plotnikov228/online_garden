import 'package:flutter/material.dart';
import 'package:online_garden/components/models/plant_model.dart';
import 'package:online_garden/features/main/presentation/bloc/bloc/event.dart';
import 'package:online_garden/features/tasks/domain/entities/task.dart';

abstract class SelectTaskTypeEvent {}
class SetupTaskEvent extends SelectTaskTypeEvent {}

class ChangeSelectedIndexEvent extends SelectTaskTypeEvent{
  final int index;
  ChangeSelectedIndexEvent(this.index);
}

class SelectEvent extends SelectTaskTypeEvent {
  final BuildContext context;
  SelectEvent(this.context);
}
