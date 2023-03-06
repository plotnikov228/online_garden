import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_garden/features/plants/domain/entities/plant_model.dart';
import 'package:online_garden/features/plants/presentation/customization_plant/bloc/bloc.dart';
import 'package:online_garden/features/plants/presentation/customization_plant/bloc/state.dart';
import 'package:online_garden/features/plants/presentation/customization_plant/presentation/customization_plant_page.dart';

class CustomizationPlantBlocProvider extends StatelessWidget {
  final Plant plant;
  const CustomizationPlantBlocProvider({Key? key, required this.plant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CustomizationPlantBloc(InitialCustomizationPlantState(plant)),
      child: BlocBuilder<CustomizationPlantBloc, CustomizationPlantState>(
        builder: (context, state) {
          return CustomizationPlantPage(plant: plant);
        },
      ),
    );
  }
}
