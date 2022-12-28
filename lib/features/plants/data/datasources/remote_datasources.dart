import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:online_garden/features/main/domain/entities/plant_model.dart';
import 'package:online_garden/features/plants/data/models/plant_model.dart';

class PlantsRemoteDataSources {

  Future getPlants () async {
    return await FirebaseFirestore.instance.collection('Plants').get();
  }

}