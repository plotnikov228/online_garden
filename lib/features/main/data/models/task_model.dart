import 'package:online_garden/components/extensions/frequency_types.dart';
import 'package:online_garden/components/extensions/task_types.dart';
import 'package:online_garden/components/models/frequency_types.dart';
import 'package:online_garden/components/models/task_types.dart';
import 'package:online_garden/features/main/domain/entities/task_model.dart';

class TaskModelImpl extends TaskModel {
  @override
  final String name;
  @override
  final bool isComplete;
  @override
  final TaskTypes taskTypes;
  @override
  final FrequencyTypes frequency;

  TaskModelImpl(
      {required this.name,
      required this.isComplete,
      required this.taskTypes,
      required this.frequency})
      : super(
            name: name,
            isComplete: isComplete,
            taskTypes: taskTypes,
            frequency: frequency);

  factory TaskModelImpl.fromJson(Map<String, dynamic> json) => TaskModelImpl(
      name: json['name'],
      isComplete: json['isComplete'],
      taskTypes: json['taskTypes'].toString().stringInTaskTypes(),
      frequency: (json['frequency'] as Map<String, dynamic>).mapInFrequencyTypes());

  Map<String, dynamic> toJson() => {
    'name':name,
    'isComplete':isComplete,
    'taskTypes':taskTypes.text,
    'frequency':frequency.toJson()
  };
}
