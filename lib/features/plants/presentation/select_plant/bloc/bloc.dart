import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_garden/features/plants/domain/entities/plant_model.dart';
import 'package:online_garden/features/plants/domain/usecases/get_plants.dart';import 'package:online_garden/features/plants/presentation/select_plant/bloc/event.dart';
import 'package:online_garden/features/plants/presentation/select_plant/bloc/state.dart';


class PlantsBloc extends Bloc<PlantsEvent, PlantsState>{
  PlantsBloc(super.initialState){
    final GetPlants getPlants = GetPlants();
    on<SearchPlantsEvent>((event, emit) async {
      emit(LoadingPlantsState());
      try{
        var plants = await getPlants.getPlants(event.text);
        if(plants.isEmpty){
          ScaffoldMessenger.of(event.context).showSnackBar(const SnackBar(content: Text('We have not found plants with similar names :(')));
          emit(InitialPlantsState());
        } else {
          print(plants.length);
          emit(FullPlantsState(plants));
        }

      }catch(_) {
        ScaffoldMessenger.of(event.context).showSnackBar(const SnackBar(content: Text('Error, try again later.')));
        print(_.toString());
        emit(InitialPlantsState());

      }
    });
  }
}