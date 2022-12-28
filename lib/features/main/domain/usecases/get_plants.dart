import 'package:online_garden/features/main/domain/entities/plant_model.dart';
import 'package:online_garden/features/main/domain/repositroties/repository.dart';

class GetPlants {
  final MainRepository repo;

  GetPlants(this.repo);

  Future<List<PlantModel>> getPlants () async {
    return repo.getPlants();
  }
}