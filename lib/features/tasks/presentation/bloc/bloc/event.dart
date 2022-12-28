import 'package:flutter/material.dart';
import 'package:online_garden/features/tasks/domain/entities/task.dart';

abstract class TaskEvent {}
class SetupTaskEvent extends TaskEvent {}

class RefreshTaskEvent extends TaskEvent {
  final Task task;

  RefreshTaskEvent(this.task);
}

class CreateTaskEvent extends TaskEvent {
  final Task task;
  final BuildContext context;

  CreateTaskEvent(this.task, this.context);
}