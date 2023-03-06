import 'package:online_garden/components/models/plant_model.dart';
import 'package:online_garden/features/main/domain/entities/plant_model.dart';
import 'package:online_garden/features/main/domain/repositories/repository.dart';

class UpdatePlants {
  final MainRepository repository;

  UpdatePlants(this.repository);

  Future<void> updatePlants (List<PlantComponent> plantsToUpdate) async {
    return await repository.updatePlants(plantsToUpdate);
  }
}