import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router_flow/go_router_flow.dart';
import 'package:online_garden/features/plants/domain/entities/plant_model.dart';
import 'package:online_garden/features/plants/presentation/customization_plant/bloc/bloc.dart';

class CustomizationPlantPage extends StatelessWidget {
  final Plant plant;
  const CustomizationPlantPage({Key? key, required this.plant}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final bloc = context.read<CustomizationPlantBloc>();
    final _controller = TextEditingController();
    return Scaffold(
      body: SafeArea(
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
            child: Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width - 100,
                  child: const Text('The only thing left to do is to choose a name for the plant',
                      style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w900,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Open Sans',
                          fontSize: 32)),
                ),
                SizedBox(
                  height: 100,
                  width: MediaQuery.of(context).size.width - 100,
                  child: const Text('You can skip this step, just click on the "Add plant" button',
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Open Sans',
                          fontSize: 16)),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Center(
            child: SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width - 80,
              child: TextFormField(
                onFieldSubmitted: (text) {
                  if (_controller.text != null) {
                    plant.nickname = _controller.text;
                  }
                  context.pop(plant);
                },
                controller: _controller,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(17))),
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'Name',
                    hintText: 'Enter a name',
                    labelStyle: TextStyle(color: Colors.grey, fontSize: 12)),
              ),
            ),
          ),
          SizedBox(height: 50,),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  if (_controller.text.trim() != "") {
                    plant.nickname = _controller.text.trim();
                  }
                  context.pop(plant);
                },
                child: const Text(
                  'Add plant',
                  style: TextStyle(color: Colors.white),
                )),
          ),

        ]))),
    );
  }
}
