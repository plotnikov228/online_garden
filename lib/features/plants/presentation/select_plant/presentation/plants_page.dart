import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router_flow/go_router_flow.dart';
import 'package:online_garden/features/main/domain/entities/plant_model.dart';
import 'package:online_garden/features/plants/domain/entities/plant_model.dart';
import 'package:online_garden/features/plants/presentation/select_plant/bloc/bloc.dart';
import 'package:online_garden/features/plants/presentation/select_plant/bloc/event.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class PlantsPage extends StatelessWidget {
  final List<Plant> plants;
  final bool? isLoading;

  const PlantsPage({Key? key, required this.plants, this.isLoading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<PlantsBloc>();
    final _controller = TextEditingController();
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back)),
          const SizedBox(
            height: 32,
          ),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 100,
              child: const Text('Enter the name of the plant to find it!',
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w900,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'Open Sans',
                      fontSize: 32)),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Center(
            child: SizedBox(
              height: 100,
              width: MediaQuery.of(context).size.width - 80,
              child: TextFormField(
                onFieldSubmitted: (text) {
                  if (_controller.text != null) {
                    bloc.add(SearchPlantsEvent(text, context));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('All fields must be filled in')));
                  }
                },
                controller: _controller,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(17))),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'Search',
                    labelStyle: TextStyle(color: Colors.grey, fontSize: 12)),
              ),
            ),
          ),
          Visibility(
              visible: plants.isNotEmpty,
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width - 40,
                  height: plants.length == 1 ? 155 : 300,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.green),
                      borderRadius: BorderRadius.circular(10)),
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: plants.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () async {
                          final value = await context.push<Plant>(
                            '/main/select_plant/customization_plant',
                            extra: plants[index]);
                          if(value != null) {
                            print(value);
                            context.pop(value);
                          }
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
                                      plants[index].imageUrl,
                                      fit: BoxFit.fill,
                                    )),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width -
                                    60 -
                                    160,
                                child: Column(
                                  children: [
                                    Text(
                                      plants[index].name,
                                      maxLines: 2,
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.green),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    GradientText(
                                      plants[index].description,
                                      maxLines: 5,
                                      gradientType: GradientType.linear,
                                      gradientDirection: GradientDirection.ttb,
                                      radius: .4,
                                      colors: const [
                                        Colors.black,
                                        Colors.black12,
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )),
                        ),
                      );
                    },
                  ),
                ),
              )),
          const SizedBox(
            height: 50,
          ),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  if (_controller.text.trim() != "") {
                    bloc.add(SearchPlantsEvent(_controller.text, context));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('All fields must be filled in')));
                  }
                },
                child: isLoading == true
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text(
                        'Search',
                        style: TextStyle(color: Colors.white),
                      )),
          )
        ],
      ),
    ));
  }
}
