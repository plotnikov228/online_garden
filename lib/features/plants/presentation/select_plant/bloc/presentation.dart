import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_garden/features/plants/presentation/select_plant/bloc/bloc.dart';
import 'package:online_garden/features/plants/presentation/select_plant/bloc/state.dart';
import 'package:online_garden/features/plants/presentation/select_plant/presentation/plants_page.dart';

class PlantsBlocPage extends StatelessWidget {
  const PlantsBlocPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(create: (context) => PlantsBloc(InitialPlantsState()),
      child: BlocBuilder<PlantsBloc, PlantsState>(
        builder: (context, state) {
          if(state is LoadingPlantsState){
            return const PlantsPage(plants: [], isLoading: true,);
          }
          if (state is FullPlantsState) {
            return PlantsPage(plants: state.plants);
          } else {
            return const PlantsPage(plants: [],);
          }
        }
      ),
      ),
    );
  }
}
