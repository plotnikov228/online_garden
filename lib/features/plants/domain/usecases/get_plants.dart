import 'package:online_garden/features/plants/data/repository/plants_repository.dart';
import 'package:online_garden/features/plants/domain/entities/plant_model.dart';

class GetPlants {
  PlantsRepositoryImpl repo = PlantsRepositoryImpl();
  Future<List<Plant>> getPlants(String text) async {
    return await repo.getPlants(text);
  }
}