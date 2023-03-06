import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_garden/components/models/plant_model.dart';
import 'package:online_garden/features/plants/presentation/select_plant/bloc/presentation.dart';
import 'package:online_garden/features/tasks/presentation/select_plant/bloc/bloc.dart';
import 'package:online_garden/features/tasks/presentation/select_plant/bloc/event.dart';

class SelectPlantPage extends StatelessWidget {
  final List<PlantComponent> plants;
  final int? selectedIndex;

  const SelectPlantPage(
      {Key? key, required this.plants, required this.selectedIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<SelectPlantBloc>();
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
            const Center(
              child: Text('Select plant',
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w900,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'Open Sans',
                      fontSize: 32)),
            ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width - 40,
                height: 300,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.green),
                    borderRadius: BorderRadius.circular(30)),
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: plants!.length + 1,
                    itemBuilder: (context, index) {
                      if (plants!.isEmpty) {
                        return Center(
                          child: SizedBox(
                            height: 150,
                            child: Column(
                              children: [
                                const Text(
                                  'Your garden is empty',
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700),
                                ),
                                const Text(
                                    'for create a task you need some plants, add they',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 10)),
                                IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: ((context) =>
                                                      const PlantsBlocPage())))
                                          .then((value) {
                                        if (value != null) {
                                          bloc.add(SetupTaskEvent());
                                        }
                                      });
                                    },
                                    icon: Icon(
                                      Icons.add,
                                      color: Colors.green,
                                    ))
                              ],
                            ),
                          ),
                        );
                      } else {
                        return SizedBox(
                          height: 150,
                          width: MediaQuery.of(context).size.width - 100,
                          child: Card(
                              color: selectedIndex == index
                                  ? Colors.green
                                  : Colors.white,
                              elevation: 0,
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(4)),
                                    child: SizedBox(
                                        width: 150,
                                        child: Image.network(
                                          plants![index].image,
                                          fit: BoxFit.fill,
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, top: 20),
                                    child: Column(
                                      children: [
                                        Text(
                                          plants![index].name,
                                          style: TextStyle(
                                              color: selectedIndex == index
                                                  ? Colors.white
                                                  : Colors.grey,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text('${plants![index].description}...',
                                            maxLines: 4,
                                            style: TextStyle(
                                                color: selectedIndex == index
                                                    ? Colors.white
                                                    : Colors.black))
                                      ],
                                    ),
                                  )
                                ],
                              )),
                        );
                      }
                    }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: ElevatedButton(
                    onPressed: () {
                      if (selectedIndex == null)
                        null;
                      else {
                        bloc.add(SelectEvent(context));
                      }
                    },
                    child: const Text(
                      'Next step',
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
