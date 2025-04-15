import 'package:daily_tracker/features/tasks/model/task_model.dart';

class TaskState {
  bool isLoading;
  List<TaskModel>? task;
  String? error;

  TaskState({required this.isLoading, required this.task, required this.error});

  TaskState copyWith({required bool isLoading, List<TaskModel>? task, String? error}) {
    return TaskState(isLoading: isLoading, task: task ?? this.task, error: error ?? this.error);
  }
}
