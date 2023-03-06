import 'package:online_garden/components/models/frequency_types.dart';
import 'package:online_garden/components/models/task_model.dart';
import 'package:online_garden/components/models/task_types.dart';

class TaskModel extends TaskComponent {
  final String name;
  final TaskTypes taskTypes;
  final FrequencyTypes frequency;
  final bool isComplete;

  TaskModel({
    required this.name,
    required this.isComplete,
    required this.taskTypes,
    required this.frequency,
  }) : super(name, taskTypes, frequency);
}
