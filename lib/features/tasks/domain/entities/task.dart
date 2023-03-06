import 'package:online_garden/components/models/frequency_types.dart';
import 'package:online_garden/components/models/plant_model.dart';
import 'package:online_garden/components/models/task_model.dart';
import 'package:online_garden/components/models/task_types.dart';

class Task extends TaskComponent {
  @override
  TaskTypes taskTypes;
  PlantComponent plant;
  @override
  FrequencyTypes frequency;


  Task(this.taskTypes, this.plant, this.frequency) : super('${taskTypes.text} ${plant.name} in ${frequency}', taskTypes, frequency);
}