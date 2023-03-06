import 'package:online_garden/components/models/task_types.dart';

import 'frequency_types.dart';

abstract class TaskComponent {
  final String taskName;
  final TaskTypes taskTypes;
  final FrequencyTypes frequency;

  TaskComponent(this.taskName, this.taskTypes, this.frequency);
}