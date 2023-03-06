import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_garden/components/models/frequency_types.dart';
import 'package:online_garden/components/models/plant_model.dart';
import 'package:online_garden/components/models/task_types.dart';
import 'package:online_garden/features/tasks/domain/entities/task.dart';
import 'package:online_garden/features/tasks/presentation/select_plant/bloc/state.dart';
import 'package:online_garden/features/tasks/presentation/select_task_type/bloc/event.dart';
import 'package:online_garden/features/tasks/presentation/select_task_type/bloc/state.dart';

class SelectTaskTypeBloc extends Bloc<SelectTaskTypeEvent, SelectTaskTypeState> {
  final Task task;
  SelectTaskTypeBloc(super.initialState, this.task) {
    late List<PlantComponent> plants;
    final List<TaskTypes> taskTypes = [Watering(), LandTransplantation(), TransplantingToAnotherPot(), FertilizingPlants(), CustomTaskType()];
    late int? selectedIndex;

    on<ChangeSelectedIndexEvent>((event, emit) async {
      selectedIndex = event.index;
      emit(SelectState(taskTypes, selectedIndex));
    });

    on<SelectEvent>((event, emit) async {
      if(selectedIndex != null) {
        task.taskTypes = taskTypes[selectedIndex!];
        if(task.taskTypes == CustomTaskType()){
/*
          Navigator.push(event.context, MaterialPageRoute(builder: (BuildContext context) => const ConstructTaskTypePage(),settings: RouteSettings( arguments: {'task': task},)));
*/
        }
/*
        Navigator.push(event.context, MaterialPageRoute(builder: (BuildContext context) => const SelectFrequencyPage(),settings: RouteSettings( arguments: {'task': task},)));
*/
      } else {
        ScaffoldMessenger.of(event.context).showSnackBar(const SnackBar(content: Text('All fields must be filled in')));
      }
    });
  }
}