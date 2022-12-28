import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_garden/features/main/data/repositories/main_repository.dart';
import 'package:online_garden/features/main/domain/usecases/get_plants.dart';
import 'package:online_garden/features/tasks/domain/entities/task.dart';
import 'package:online_garden/features/tasks/domain/entities/task_type.dart';
import 'package:online_garden/features/tasks/presentation/bloc/bloc/event.dart';
import 'package:online_garden/features/tasks/presentation/bloc/bloc/state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc(super.initialState) {
    var plants = GetPlants(MainRepositoryImpl()).getPlants();
    Task task = Task('', '', '', []);
    on<SetupTaskEvent>((event, emit) async {
      task.type = TaskType.taskTypes[0].name;
     emit(InitialTaskState(await plants, task));
    });

    on<CreateTaskEvent>((event, emit) async {
      if(event.task.plant.isNotEmpty && event.task.type.isNotEmpty) {
        if(event.task.type == 'on concrete days' && event.task.days.isNotEmpty){
          task.name = 'Watering ${event.task.plant} on ${event.task.days.iterator}';
          print(task.name);
          Navigator.pop(event.context, event.task);
        } else {
          task.name = 'Watering ${task.plant} ${task.type}';
          print(task.name);
          Navigator.pop(event.context, event.task);
        }
      } else {
        ScaffoldMessenger.of(event.context).showSnackBar(SnackBar(content: Text('All fields must be filled in')));
      }
      emit(InitialTaskState(await plants, task));
    });

    on<RefreshTaskEvent>((event, emit) async {
      emit(InitialTaskState(await plants, event.task));
    });
  }
}