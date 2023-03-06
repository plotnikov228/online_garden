import 'package:online_garden/components/models/task_model.dart';
import 'package:online_garden/features/main/domain/entities/task_model.dart';
import 'package:online_garden/features/main/domain/repositories/repository.dart';

class GetTasks {
  final MainRepository repo;

  GetTasks(this.repo);
  Future<List<TaskModel>> getTasks () {
    return repo.getTasks();
  }
}