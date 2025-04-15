import 'dart:developer';

import 'package:daily_tracker/features/cubit/task/task_cubit.dart';
import 'package:daily_tracker/features/cubit/task/task_state.dart';
import 'package:daily_tracker/features/mian_screen/UI/bottomNavigator.dart';
import 'package:daily_tracker/features/mian_screen/task_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  static const path = '/mainScreen';

  @override
  Widget build(BuildContext context) {
    context.read<TaskCubit>().readTasks();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Row(mainAxisAlignment: MainAxisAlignment.start, children: [SizedBox(width: 10), Text('Мои задачи')]),
          actions: [
            IconButton(
              onPressed: () {
                log('обновить');
                context.read<TaskCubit>().readTasks();
              },
              tooltip: 'Обновить список задач',
              icon: Icon(Icons.replay_outlined),
            ),
            IconButton(
              onPressed: () {
                log('настройки');
              },
              tooltip: 'Настройки',
              icon: Icon(Icons.settings),
            ),
          ],
        ),
        body: BlocBuilder<TaskCubit, TaskState>(
          builder: (context, state) {
            if (state.isLoading) {
              return CircularProgressIndicator();
            } else if (state.task != null && state.error == null) {
              return TaskListView(state: state);
            } else if (state.error != null) {
              return Center(child: Text(state.error!));
            } else {
              return SizedBox.expand(child: Center(child: Text('Нет задач')));
            }
          },
        ),
        bottomNavigationBar: Bottomnavigator(),
      ),
    );
  }
}
