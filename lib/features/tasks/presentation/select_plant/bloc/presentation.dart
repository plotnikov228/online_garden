import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_garden/features/tasks/presentation/select_plant/bloc/bloc.dart';
import 'package:online_garden/features/tasks/presentation/select_plant/bloc/event.dart';
import 'package:online_garden/features/tasks/presentation/select_plant/bloc/state.dart';
import 'package:online_garden/features/tasks/presentation/select_plant/presentation/select_plant_page.dart';


class TaskBlocProvider extends StatelessWidget {

  const TaskBlocProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => SelectPlantBloc(LoadingTaskState())..add(SetupTaskEvent()),
        child: Scaffold(
          body: BlocBuilder<SelectPlantBloc, SelectPlantState>(
          builder: (context, state) {
            if (state is SelectPlantTaskState) {
              return SelectPlantPage(plants: state.plants!, selectedIndex: state.selectedIndex,);
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }
      ),
        ));
  }
}
