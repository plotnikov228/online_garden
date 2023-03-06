import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_garden/components/models/frequency_types.dart';
import 'package:online_garden/components/models/plant_model.dart';
import 'package:online_garden/components/models/task_types.dart';
import 'package:online_garden/features/main/data/repositories/main_repository.dart';
import 'package:online_garden/features/main/domain/usecases/get_plants.dart';
import 'package:online_garden/features/tasks/domain/entities/task.dart';
import 'package:online_garden/features/tasks/presentation/select_plant/bloc/event.dart';
import 'package:online_garden/features/tasks/presentation/select_plant/bloc/state.dart';
import 'package:online_garden/features/tasks/presentation/select_task_type/presentation/select_type_page.dart';

class SelectPlantBloc extends Bloc<SelectPlantEvent, SelectPlantState> {
  SelectPlantBloc(super.initialState) {
    late List<PlantComponent> plants;
    TaskTypes taskType = Watering();
    var endPoint = DateTime.now();
    endPoint.day + 1;
    FrequencyTypes frequencyTypes = OnceADay(referencePoint: DateTime.now(), endPoint: endPoint, repeat: true);

    late Task task;
    late int? selectedIndex;
    on<SetupTaskEvent>((event, emit) async {
      plants = await GetPlants(MainRepositoryImpl()).getPlants();
      if(plants.isNotEmpty) {
        task = Task(taskType, plants.first, frequencyTypes);
        emit(SelectPlantTaskState(plants, null));
      } else {
        emit(SelectPlantTaskState([], null));
      }
    });

    on<ChangeSelectedIndexEvent>((event, emit) async {
      selectedIndex = event.index;
      emit(SelectPlantTaskState(plants, selectedIndex));
    });

    on<SelectEvent>((event, emit) async {
      if(selectedIndex != null) {
        task.plant = plants[selectedIndex!];
        selectedIndex = null;
        Navigator.push(event.context, MaterialPageRoute(builder: (BuildContext context) => const SelectTypePage(),settings: RouteSettings(  arguments: {'task': task},)));
      } else {
        ScaffoldMessenger.of(event.context).showSnackBar(const SnackBar(content: Text('All fields must be filled in')));
      }
    });

  }
}