import 'package:online_garden/features/main/domain/entities/task_model.dart';

class TaskModelImpl extends TaskModel {
  TaskModelImpl({required super.name, required super.isComplete});

  factory TaskModelImpl.fromJson(Map<String, dynamic> json) {
    return TaskModelImpl(name: json['name'], isComplete: json['isComplete']);
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'isComplete': isComplete
    };
  }
}