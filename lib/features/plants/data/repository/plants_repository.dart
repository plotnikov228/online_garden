import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:online_garden/features/main/domain/entities/plant_model.dart';
import 'package:online_garden/features/plants/data/datasources/remote_datasources.dart';
import 'package:online_garden/features/plants/domain/entities/plant_model.dart';
import 'package:online_garden/features/plants/domain/repository/plants_repository.dart';

class PlantsRepositoryImpl extends PlantsRepository {
  @override
  Future<List<Plant>> getPlants(String text) {
    PlantsRemoteDataSources plantsRemoteDataSources = PlantsRemoteDataSources();
    return plantsRemoteDataSources.getPlants(text);
  }
}