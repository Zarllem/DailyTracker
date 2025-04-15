import 'dart:convert';
import 'dart:io';

import 'package:daily_tracker/features/cubit/task/task_state.dart';
import 'package:daily_tracker/features/tasks/model/task_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskState(isLoading: false, task: null, error: null));

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;

    return File("$path/tasks.json");
  }

  Future<void> writeLocal(TaskModel task) async {
    final file = await _localFile;
    List tasksList = file.existsSync() ? await json.decode(file.readAsStringSync()) : null;
    tasksList.add(json.encode(task.toJson()));
    String jsonData = json.encode(tasksList);

    await file.writeAsString(jsonData);
  }

  Future<List<TaskModel>?> _readLocal() async {
    List<TaskModel> tasks = [];
    final file = await _localFile;
    if (file.existsSync()) {
      String jsonData = await file.readAsString();
      List list = json.decode(jsonData);
      for (dynamic t in list) {
        tasks.add(TaskModel.fromJson(json.decode(t)));
      }
      return tasks;
    } else {
      return null;
    }
  }

  void readTasks() async {
    emit(state.copyWith(isLoading: true));
    try {
      final tasks = await _readLocal();
      emit(state.copyWith(isLoading: false, task: tasks));
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  void changeisDone(int index) async {
    state.task![index].copyWith(isDone: !state.task![index].isDone!);
  }
}
