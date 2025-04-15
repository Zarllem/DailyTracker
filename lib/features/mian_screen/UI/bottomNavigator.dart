import 'dart:developer';

import 'package:daily_tracker/features/tasks/UI/new_task_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Bottomnavigator extends StatelessWidget {
  const Bottomnavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              log('шторка слева');
            },
            icon: Icon(Icons.density_medium_sharp),
          ),
          IconButton.filled(
            onPressed: () {
              context.go(NewTaskScreen.path);
            },
            icon: Icon(Icons.add_outlined),
          ),
        ],
      ),
    );
  }
}
