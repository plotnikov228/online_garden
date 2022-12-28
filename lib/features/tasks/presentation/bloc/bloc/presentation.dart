import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_garden/features/tasks/domain/entities/task.dart';
import 'package:online_garden/features/tasks/presentation/bloc/bloc/bloc.dart';
import 'package:online_garden/features/tasks/presentation/bloc/bloc/event.dart';
import 'package:online_garden/features/tasks/presentation/bloc/bloc/state.dart';
import 'package:online_garden/features/tasks/presentation/bloc/presentation/task_page.dart';

class TaskBlocProvider extends StatelessWidget {

  const TaskBlocProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => TaskBloc(InitialTaskState([], Task('', '', '', [])))..add(SetupTaskEvent()),
        child: Scaffold(
          body: BlocBuilder<TaskBloc, TaskState>(
          builder: (context, state) {
            if (state is InitialTaskState) {
              return TaskPage(plants: state.plants, task: state.task);
            } else {
              return Container();
            }
          }
      ),
        ));
  }
}
