import 'package:online_garden/features/tasks/domain/entities/task_type.dart';

class Task {
  String name;
  String plant;
  List<String> days;
  String type;

  Task(this.name, this.type, this.plant, this.days);
}