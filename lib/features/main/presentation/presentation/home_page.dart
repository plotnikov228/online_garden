import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_garden/features/main/domain/entities/plant_model.dart';
import 'package:online_garden/features/main/domain/entities/task_model.dart';
import 'package:online_garden/features/main/presentation/bloc/bloc/bloc.dart';
import 'package:online_garden/features/main/presentation/bloc/bloc/event.dart';
import 'package:online_garden/features/plants/presentation/presentation/plants_page.dart';
import 'package:online_garden/features/tasks/presentation/bloc/bloc/presentation.dart';

import '../../../plants/presentation/bloc/presentation.dart';

class HomePage extends StatelessWidget {
  final List<TaskModel> tasks;
  final List<PlantModel> plants;

  const HomePage({Key? key, required this.tasks, required this.plants})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<MainBloc>();
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'Home',
              style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w900,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'Open Sans',
                  fontSize: 32),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 32),
              child: Text('Tasks',
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20)),
            ),
            SizedBox(
              height: 150,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: tasks.length + 1,
                  itemBuilder: (context, index) {
                    if (index == tasks.length) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) =>
                                      const TaskBlocProvider()))).then((value) {
                            /*if(value != null){
                                      tasks.add(value);
                                      bloc.add(UpdateTasksEvent(tasks));
                                    }*/
                          });
                        },
                        child: SizedBox(
                          height: 80,
                          width: 60,
                          child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.add,
                                  size: 30,
                                ),
                              )),
                        ),
                      );
                    }

                    return Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: SizedBox(
                        height: 80,
                        width: 280,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Stack(children: [
                              Text(
                                tasks[index].name,
                                maxLines: 3,
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              Align(
                                  alignment: Alignment.bottomRight,
                                  child: Checkbox(
                                    value: tasks[index].isComplete,
                                    onChanged: (value) {},
                                    shape: const CircleBorder(),
                                  ))
                            ]),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 32),
              child: Text('Your Garden',
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20)),
            ),
            SizedBox(
              height: 150,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: plants.isEmpty ? 1 : plants.length + 1,
                  itemBuilder: (context, index) {
                    if (plants.isEmpty) {
                      return SizedBox(
                        width: MediaQuery.of(context).size.width - 32,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text('Your garden is empty!',
                                style: TextStyle(fontSize: 20)),
                            const Text('Add new plant',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.grey)),
                            IconButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: ((context) =>
                                          const PlantsBlocPage())));
                                },
                                icon: const Icon(
                                  Icons.add,
                                  color: Colors.lightGreen,
                                ))
                          ],
                        ),
                      );
                    } else {
                      if (index == plants.length) {
                        return GestureDetector(
                          onTap: () {},
                          child: SizedBox(
                            height: 80,
                            width: 60,
                            child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.add,
                                    size: 30,
                                  ),
                                )),
                          ),
                        );
                      }

                      return Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: SizedBox(
                          height: 80,
                          width: 280,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(children: [
                                /*Image.file()*/
                              ]),
                            ),
                          ),
                        ),
                      );
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
