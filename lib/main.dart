import 'package:daily_tracker/core/router/my_router.dart';
import 'package:daily_tracker/features/cubit/task/task_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => TaskCubit())],
      child: MaterialApp.router(debugShowCheckedModeBanner: false, routerConfig: MyRouter.goRouter),
    );
  }
}
