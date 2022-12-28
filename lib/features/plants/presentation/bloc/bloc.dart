import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_garden/features/plants/presentation/bloc/event.dart';
import 'package:online_garden/features/plants/presentation/bloc/state.dart';

class PlantsBloc extends Bloc<PlantsEvent, PlantsState>{
  PlantsBloc(super.initialState){
    on<SetupPlantsEvent>((event, emit){
      
    });
  }
}