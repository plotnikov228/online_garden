import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_garden/features/main/data/repositories/main_repository.dart';
import 'package:online_garden/features/main/domain/entities/task_model.dart';
import 'package:online_garden/features/main/domain/usecases/get_plants.dart';
import 'package:online_garden/features/main/domain/usecases/get_tasks.dart';
import 'package:online_garden/features/main/domain/usecases/update_tasks.dart';
import 'package:online_garden/features/main/presentation/bloc/bloc/event.dart';
import 'package:online_garden/features/main/presentation/bloc/bloc/state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc(super.initialState) {
    MainRepositoryImpl repositoryImpl = MainRepositoryImpl();

    on<GoToAnotherPageEvent>((event, emit) async {
      var tasks = GetTasks(repositoryImpl).getTasks();
      var plants = GetPlants(repositoryImpl).getPlants();
      switch (event.index) {
        case 1:
          emit(MenuState());
          break;

        case 0:
          emit(HomeState(await tasks, await plants));
          break;
      }
    });

    on<SetupHomePage>((event, emit) async {
      var tasks = await GetTasks(repositoryImpl).getTasks();
      var plants = await GetPlants(repositoryImpl).getPlants();

      List<TaskModel> taskForSetup = [
        TaskModel(name: 'Water all the plants for this week', isComplete: false),
        TaskModel(name:'Water all the plants for this day', isComplete: false)
      ];

      if (tasks.isEmpty) {
        await UpdateTasks(repositoryImpl).updateTasks(taskForSetup);
      }
      tasks = await GetTasks(repositoryImpl).getTasks();
      emit(HomeState(tasks, plants));
    });

    on<UpdateTasksEvent>((event, emit) async {
      await UpdateTasks(repositoryImpl).updateTasks(event.tasks);
      var tasks = await GetTasks(repositoryImpl).getTasks();
      var plants = await GetPlants(repositoryImpl).getPlants();
      emit(HomeState(tasks, plants));
    });
  }
}
