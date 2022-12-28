class TaskType {
  final String name;
  static final List<TaskType> taskTypes = [TaskType('every day'), TaskType('every week'), TaskType('on concrete days')];

  TaskType(this.name);
}
