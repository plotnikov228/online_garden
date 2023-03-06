import 'package:online_garden/components/models/plant_model.dart';
import 'package:online_garden/features/main/domain/entities/plant_model.dart';
import 'package:online_garden/features/main/domain/repositories/repository.dart';

class GetPlants {
  final MainRepository repo;

  GetPlants(this.repo);

  Future<List<PlantComponent>> getPlants () async {
    return await repo.getPlants();
  }
}