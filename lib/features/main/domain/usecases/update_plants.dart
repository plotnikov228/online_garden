import 'package:online_garden/features/main/domain/entities/plant_model.dart';
import 'package:online_garden/features/main/domain/repositroties/repository.dart';

class UpdatePlants {
  final MainRepository repository;

  UpdatePlants(this.repository);

  Future<void> updatePlants (List<PlantModel> plantsToUpdate) async {
    return await repository.updatePlants(plantsToUpdate);
  }
}