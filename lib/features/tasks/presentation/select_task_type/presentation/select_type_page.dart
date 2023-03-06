import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_garden/components/models/task_types.dart';
import 'package:online_garden/features/tasks/domain/entities/task.dart';
import 'package:online_garden/features/tasks/presentation/select_task_type/bloc/bloc.dart';
import 'package:online_garden/features/tasks/presentation/select_task_type/bloc/event.dart';
import 'package:online_garden/features/tasks/presentation/select_task_type/bloc/state.dart';


class SelectTypePage extends StatelessWidget {
  const SelectTypePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<SelectTaskTypeBloc>();
    final List<TaskTypes> taskTypes = [Watering(), LandTransplantation(), TransplantingToAnotherPot(), FertilizingPlants(), CustomTaskType()];
    return BlocProvider(
        create: (BuildContext context) => SelectTaskTypeBloc(SelectState(taskTypes, null), ModalRoute.of(context)!.settings.arguments as Task),
        child: Scaffold(
          body: BlocBuilder<SelectTaskTypeBloc, SelectTaskTypeState>(
              builder: (context, state) {
                if (state is SelectState) {
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
                            child: Text('Select task type',
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w900,
                                    fontStyle: FontStyle.italic,
                                    fontFamily: 'Open Sans',
                                    fontSize: 32)),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width - 100,
                            height: 300,
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(30)
                            ),
                            child: ListView.builder(itemBuilder: (context, index){
                              return SizedBox(
                                height: 100,
                                width: MediaQuery.of(context).size.width - 100,
                                child: Card(
                                    color: state.selectedIndex == index ? Colors.green : Colors.white,
                                    elevation: 0,
                                    child: Row(
                                      children: [
                                        const ClipRRect(
                                          borderRadius: BorderRadius.all(Radius.circular(4)),
                                          child: SizedBox(
                                              width: 100,
                                              /*child: Image.network(
                                                plants[index].image,
                                                fit: BoxFit.fill,
                                              )*/),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 10, top: 20),
                                          child: Text(
                                            state.taskTypes[index].text, style: TextStyle(color: state.selectedIndex == index ? Colors.white : Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      ],
                                    )),
                              );
                            }),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Center(
                              child: ElevatedButton(onPressed: () {
                                bloc.add(SelectEvent(context));
                              }, child: Text('Add Task', style: TextStyle(color: Colors.white),)),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
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
