import 'dart:developer';

import 'package:daily_tracker/features/cubit/task/task_cubit.dart';
import 'package:daily_tracker/features/mian_screen/UI/main_screen.dart';
import 'package:daily_tracker/features/tasks/model/task_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class NewTaskScreen extends StatelessWidget {
  const NewTaskScreen({super.key});
  static const path = '/newTaskScreen';

  @override
  Widget build(BuildContext context) {
    TextEditingController task = TextEditingController();
    TextEditingController startDate = TextEditingController();
    TextEditingController povtor = TextEditingController();
    TextEditingController endDate = TextEditingController();
    TextEditingController tag = TextEditingController();
    DateTime sDate = DateTime(0);
    DateTime eDate = DateTime(0);
    int priority = 0;
    List<String> tags = [];
    Duration? povtors;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              task.dispose();
              startDate.dispose();
              povtor.dispose();
              endDate.dispose();
              tag.dispose();
              context.go(MainScreen.path);
            },
            icon: Icon(Icons.arrow_back_ios_sharp),
          ),
          actions: [
            IconButton(
              onPressed: () {
                log('сохранить');
                context.read<TaskCubit>().writeLocal(
                  TaskModel(task: task.text, startDate: sDate, povtor: povtors, endDate: eDate, priority: priority, tags: tags, isDone: false),
                );
              },
              icon: Icon(Icons.save),
            ),
          ],
        ),

        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          children: [
            TextField(controller: task, decoration: const InputDecoration(hintText: 'Моя задача...')),
            TextFormField(
              controller: startDate,
              decoration: InputDecoration(hintText: 'Дата начала'),
              onTap: () {
                showDatePicker(context: context, firstDate: DateTime.now(), lastDate: DateTime(2030)).then((onValue) {
                  if (onValue != null) {
                    startDate.text = onValue.toString();
                    sDate = onValue;
                  }
                });
              },
            ),
            TextFormField(
              controller: povtor,
              decoration: InputDecoration(hintText: 'повторы?'),
              onTap: () {
                final left = MediaQuery.of(context).size.width * 0.35;
                final top = MediaQuery.of(context).size.height * 0.3;
                showMenu(
                  context: context,
                  position: RelativeRect.fromLTRB(left, top, left, top),
                  items: [
                    PopupMenuItem(value: -1, child: Text('не повторять')),
                    PopupMenuItem(value: 0, child: Text('ежечасно')),
                    PopupMenuItem(value: 1, child: const Text('ежедневно')),
                    PopupMenuItem(value: 2, child: Text('еженедельно')),
                  ],
                  elevation: 5,
                ).then((onValue) {
                  if (onValue != null) {
                    if (onValue == -1) {
                      povtor.text = 'не повторять';
                    } else {
                      povtors = povtorD[onValue];
                      povtor.text = povtorS[onValue];
                    }
                  }
                });
              },
            ),
            TextFormField(
              controller: endDate,
              decoration: InputDecoration(hintText: 'Дата окончания'),
              onTap: () {
                showDatePicker(context: context, firstDate: DateTime.now(), lastDate: DateTime(2030)).then((onValue) {
                  if (onValue != null) {
                    endDate.text = onValue.toString();
                    eDate = onValue;
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

List<Duration> povtorD = [Duration(hours: 1), Duration(days: 1), Duration(days: 7)];
List<String> povtorS = ['ежечасно', 'ежедневно', 'еженедельно'];
