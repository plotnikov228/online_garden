import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:online_garden/features/plants/data/repository/plants_repository.dart';

class GetPlants {
  PlantsRepositoryImpl repo = PlantsRepositoryImpl();
  Future getPlants() async {
    return await repo.getPlants();
  }
}