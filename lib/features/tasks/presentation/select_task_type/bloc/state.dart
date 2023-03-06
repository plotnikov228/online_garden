import 'package:online_garden/components/models/plant_model.dart';
import 'package:online_garden/components/models/task_types.dart';

abstract class SelectTaskTypeState {}

class SelectState extends SelectTaskTypeState {
  final List<TaskTypes> taskTypes;
  final int? selectedIndex;
  SelectState(this.taskTypes, this.selectedIndex);
}