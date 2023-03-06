import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router_flow/go_router_flow.dart';
import 'package:online_garden/components/models/plant_model.dart';
import 'package:online_garden/features/main/data/models/plant_model.dart';
import 'package:online_garden/features/main/domain/entities/plant_model.dart';
import 'package:online_garden/features/main/domain/entities/task_model.dart';
import 'package:online_garden/features/main/presentation/bloc/bloc/bloc.dart';
import 'package:online_garden/features/main/presentation/bloc/bloc/event.dart';
import 'package:online_garden/features/plants/domain/entities/plant_model.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:skeletons/skeletons.dart';

import '../../../plants/presentation/select_plant/bloc/presentation.dart';
import '../../../tasks/presentation/select_plant/bloc/presentation.dart';

class HomePage extends StatelessWidget {
  final List<TaskModel> tasks;
  final List<PlantComponent> plants;
  final bool isLoading;

  const HomePage(
      {Key? key,
      required this.tasks,
      required this.plants,
      required this.isLoading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _padding = const EdgeInsets.fromLTRB(16, 32, 16, 16);
    var bloc = context.read<MainBloc>();
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: _padding,
            child: const Text(
              'Home',
              style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w900,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'Open Sans',
                  fontSize: 32),
            ),
          ),
          Padding(
            padding: _padding,
            child: const Text('Tasks',
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20)),
          ),
          SizedBox(
            height: 150,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: tasks.length + 1,
                itemBuilder: (context, index) {
                  if (index == tasks.length) {
                    return GestureDetector(
                      onTap: () async {
                        final TaskModel? value =
                            await context.push<TaskModel>('/main/create_task');
                        if (value != null) {
                          tasks.add(value);
                          bloc.add(UpdateTasksEvent(tasks));
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: SizedBox(
                          height: 80,
                          width: 60,
                          child: Card(
                              elevation: 0,
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
                      ),
                    );
                  }

                  return Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: SizedBox(
                      height: 80,
                      width: MediaQuery.of(context).size.width - 40,
                      child: Card(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Skeleton(
                            isLoading: isLoading,
                            skeleton: SkeletonItem(
                              child: SkeletonParagraph(
                                style: SkeletonParagraphStyle(
                                    lines: 3,
                                    spacing: 6,
                                    lineStyle: SkeletonLineStyle(
                                      randomLength: true,
                                      height: 10,
                                      borderRadius: BorderRadius.circular(8),
                                      minLength:
                                          MediaQuery.of(context).size.width / 2,
                                    )),
                              ),
                            ),
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
                    ),
                  );
                }),
          ),
          Padding(
            padding: _padding,
            child: const Text('Your Garden',
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20)),
          ),
          SizedBox(
            height: 150,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: plants.isEmpty
                    ? const NeverScrollableScrollPhysics()
                    : const BouncingScrollPhysics(),
                itemCount: plants.isEmpty ? 1 : plants.length + 1,
                itemBuilder: (context, index) {
                  if (plants.isEmpty) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text('Your garden is empty!',
                              style: TextStyle(fontSize: 20)),
                          const Text('Add new plant',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey)),
                          IconButton(
                              onPressed: () async {
                                final value = await context
                                    .push<PlantComponent>('/main/select_plant');
                                if (value != null) {
                                  bloc.add(UpdatePlantsEvent(plants, value));
                                }
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
                      child: GestureDetector(
                        onTap: () async {

                        },
                        child: SizedBox(
                          height: 150,
                          width: MediaQuery.of(context).size.width - 60,
                          child: Card(
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius:
                                    const BorderRadius.all(Radius.circular(4)),
                                    child: SizedBox(
                                        width: 150,
                                        child: Image.network(
                                          plants[index].image,
                                          fit: BoxFit.fill,
                                        )),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width -
                                        66 -
                                        160,
                                    child: Column(
                                      children: [
                                        const SizedBox(height: 10,),
                                        Text(
                                          plants[index].nickname,
                                          maxLines: 2,
                                          style: const TextStyle(
                                              fontSize: 16, color: Colors.green),
                                        ),

                                      ],
                                    ),
                                  )
                                ],
                              )),
                        ),
                      )
                    );
                  }
                }),
          ),
        ],
      ),
    );
  }
}
