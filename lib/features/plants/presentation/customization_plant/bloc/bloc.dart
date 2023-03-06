import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_garden/features/plants/presentation/customization_plant/bloc/event.dart';
import 'package:online_garden/features/plants/presentation/customization_plant/bloc/state.dart';

class CustomizationPlantBloc extends Bloc<CustomizationPlantEvent, CustomizationPlantState >{
  CustomizationPlantBloc(super.initialState){
    on<AddPlantEvent>((event, emit) {
    });
  }
}