import 'package:daily_tracker/features/cubit/task/task_cubit.dart';
import 'package:daily_tracker/features/cubit/task/task_state.dart';
import 'package:daily_tracker/features/tasks/model/task_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskListView extends StatelessWidget {
  final TaskState state;
  const TaskListView({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: state.task!.length,
      itemBuilder: (context, index) {
        TaskModel oneTask = state.task![index];
        //final col = colorsCheckbox[1];
        return Padding(
          padding: const EdgeInsets.all(10),
          child: ListTile(
            title: Text(oneTask.task),
            subtitle: Text('Тэги'),
            leading:
                oneTask.povtor == null
                    ? Checkbox(
                      checkColor: colorsCheckbox[oneTask.priority],
                      value: oneTask.isDone,
                      onChanged: (value) {
                        context.read<TaskCubit>().changeisDone(index);
                      },
                    )
                    : Icon(Icons.repeat_sharp, color: colorsCheckbox[oneTask.priority]),
          ),
        );
      },
    );
  }
}

Map<int, Color> colorsCheckbox = {0: Colors.grey, 1: Colors.blue, 2: Colors.red};

// class MyCheckbox extends StatelessWidget{

//   final Color color;


//   MyCheckbox({required this.color});

//   @override
//   Widget build(BuildContext context) {
//     return Checkbox(value: , onChanged: onChanged)
//   }
// }


