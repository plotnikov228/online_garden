import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:online_garden/features/main/domain/entities/plant_model.dart';
import 'package:online_garden/features/plants/data/models/plant_model.dart';
import 'package:online_garden/features/plants/domain/entities/plant_model.dart';

class PlantsRemoteDataSources {

  Future<List<Plant>> getPlants (String text) async {
    final docs = await FirebaseFirestore.instance.collection('Plants').get();
    final plants = <Plant>[];
    for(var doc in docs.docs){
      final data = doc.data();
      if((data['name'] as String).toLowerCase().contains(text.toLowerCase())){
        plants.add(PlantApi.fromJson(data));
      }
    }
    return plants;
  }

}