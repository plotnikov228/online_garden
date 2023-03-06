import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:online_garden/components/models/frequency_types.dart';
import 'package:online_garden/components/models/plant_model.dart';
import 'package:online_garden/components/models/task_types.dart';
import 'package:online_garden/features/main/data/models/plant_model.dart';
import 'package:online_garden/features/main/data/repositories/main_repository.dart';
import 'package:online_garden/features/main/domain/entities/plant_model.dart';
import 'package:online_garden/features/main/domain/entities/task_model.dart';
import 'package:online_garden/features/main/domain/usecases/get_plants.dart';
import 'package:online_garden/features/main/domain/usecases/get_tasks.dart';
import 'package:online_garden/features/main/domain/usecases/update_plants.dart';
import 'package:online_garden/features/main/domain/usecases/update_tasks.dart';
import 'package:online_garden/features/main/presentation/bloc/bloc/event.dart';
import 'package:online_garden/features/main/presentation/bloc/bloc/state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc(super.initialState) {
    MainRepositoryImpl repositoryImpl = MainRepositoryImpl();

    List<TaskModel> tasks = [];
    List<PlantComponent> plants = [];
    bool isLoading = true;


    on<GoToAnotherPageEvent>((event, emit) async {
      var tasks = GetTasks(repositoryImpl).getTasks();
      var plants = GetPlants(repositoryImpl).getPlants();
      switch (event.index) {
        case 1:
          emit(MenuState());
          break;

        case 0:
          emit(HomeState(await tasks, await plants, isLoading));
          break;
      }
    });

    on<SetupHomePage>((event, emit) async {
      if (tasks.isEmpty && plants.isEmpty) {
        tasks = await GetTasks(repositoryImpl).getTasks();
        plants = await GetPlants(repositoryImpl).getPlants();
        var endForDay = DateTime.now();
        endForDay.day + 1;
        List<TaskModel> taskForSetup = [
          TaskModel(
              name: 'Create first task',
              isComplete: false,
              taskTypes: CustomTaskType(),
              frequency: OnceAWeek(referencePoint: DateTime.now(),
                day: 20,
                repeat: true,
                endPoint: endForDay,)),
          TaskModel(
              name: 'Add first plant',
              isComplete: false,
              taskTypes: CustomTaskType(),
              frequency: OnceADay(
                referencePoint: DateTime.now(), repeat: true, endPoint: endForDay,))
        ];

        if (tasks.isEmpty) {
          await UpdateTasks(repositoryImpl).updateTasks(taskForSetup);
        }
        tasks = await GetTasks(repositoryImpl).getTasks();
        isLoading = false;
        emit(HomeState(tasks, plants, isLoading));
      } else {
        emit(HomeState(tasks, plants, isLoading));
      }
    });

    on<UpdateTasksEvent>((event, emit) async {
      await UpdateTasks(repositoryImpl).updateTasks(event.tasks);
      tasks = await GetTasks(repositoryImpl).getTasks();
      emit(HomeState(tasks, plants, isLoading));
    });

    on<UpdatePlantsEvent>((event, emit) async {
      final response = await http.get(Uri.parse(event.value.image));

      final documentDirectory = await getApplicationDocumentsDirectory();




      int id = 0;

      for(final value in event.plants){
        if(value.name == event.value.name){
          id++;
        }
      }
      final String fileName = '${event.value.name}_${id++}';
      print('1');
       String imagePath = '${documentDirectory.path}/$fileName.png';

      final file = File(imagePath);
      file.writeAsBytesSync(response.bodyBytes);
      print(imagePath);
      PlantModel plant = PlantModelImpl(name: event.value.name, description: event.value.description, image: imagePath, nickname: event.value.nickname);
      event.plants.add(plant);
      await UpdatePlants(repositoryImpl).updatePlants(event.plants);
      plants = await GetPlants(repositoryImpl).getPlants();
      emit(HomeState(tasks, plants, isLoading));
    });
  }
}
