import 'package:daily_tracker/features/mian_screen/UI/main_screen.dart';
import 'package:daily_tracker/features/tasks/UI/new_task_screen.dart';
import 'package:go_router/go_router.dart';

abstract class MyRouter {
  static final GoRouter goRouter = GoRouter(
    initialLocation: MainScreen.path,
    routes: [
      GoRoute(path: MainScreen.path, builder: (context, state) => MainScreen()),
      GoRoute(path: NewTaskScreen.path, builder: (context, state) => NewTaskScreen()),
    ],
  );
}
