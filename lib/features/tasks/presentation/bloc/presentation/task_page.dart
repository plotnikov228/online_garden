import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_garden/features/main/domain/entities/plant_model.dart';
import 'package:online_garden/features/tasks/domain/entities/task.dart';
import 'package:online_garden/features/tasks/domain/entities/task_type.dart';
import 'package:online_garden/features/tasks/presentation/bloc/bloc/bloc.dart';
import 'package:online_garden/features/tasks/presentation/bloc/bloc/event.dart';

class TaskPage extends StatelessWidget {
  final List<PlantModel> plants;
  final Task task;
  const TaskPage({Key? key, required this.plants, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<TaskBloc>();
    List<String> days = ['Monday', 'Tuesday', 'Wednesday','Thursday' ,
    'Friday', 'Saturday', 'Sunday'];
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back)),
            const Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text('Create Task',
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w900,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'Open Sans',
                      fontSize: 32)),
            ),
            SizedBox(
              height: 100,
              child: Row(
                children: [
                  const Text('Watering'),
                  DropdownButton<String>(items: plants.map<DropdownMenuItem<String>>((PlantModel value) {
                    return DropdownMenuItem<String>(
                      value: value.name,
                      child: Text(value.name),
                    );
                  }).toList() , onChanged: (value) {
                    task.plant = value.toString();
                  }),
                  DropdownButton<String>(
                    hint: Text(task.type),
                    items: TaskType.taskTypes.map<DropdownMenuItem<String>>((TaskType value) {
                    return DropdownMenuItem<String>(
                      value: value.name,
                      child: Text(value.name),
                    );
                  }).toList() ,
                      onChanged: (value) {
                    task.type = value.toString();
                    bloc.add(RefreshTaskEvent(task));
                  },

                  ),
                ],
              ),
            ),
      Visibility(
        visible: task.type == 'on concrete days',
        child: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: SizedBox(
          height: 100,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: days.length,
              itemBuilder: (context, index){
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(days[index]),
                    IconButton(onPressed: () {
                      task.days.contains(days[index]) ? task.days.remove(days[index]) : task.days.add(days[index]);
                      bloc.add(RefreshTaskEvent(task));
                    }, icon: Icon(task.days.contains(days[index]) ? Icons.remove : Icons.add)
                    ),
                  ]

                ),
              ),
            );
          }),
        ),),
      ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: ElevatedButton(onPressed: () {
                  bloc.add(CreateTaskEvent(task, context));
                }, child: Text('Add Task', style: TextStyle(color: Colors.white),)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
