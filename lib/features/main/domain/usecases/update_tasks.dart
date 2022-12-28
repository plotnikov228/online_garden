import 'package:online_garden/features/main/domain/entities/task_model.dart';
import 'package:online_garden/features/main/domain/repositroties/repository.dart';

class UpdateTasks {
  final MainRepository repository;

  UpdateTasks(this.repository);

  Future<void> updateTasks (List<TaskModel> tasksToUpdate) async {
    return await repository.updateTasks(tasksToUpdate);
  }
}