import 'package:online_garden/features/main/domain/entities/task_model.dart';
import 'package:online_garden/features/main/domain/repositroties/repository.dart';

class GetTasks {
  final MainRepository repo;

  GetTasks(this.repo);
  Future<List<TaskModel>> getTasks () {
    return repo.getTasks();
  }
}