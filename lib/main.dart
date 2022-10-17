import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/homepage.dart';
import 'models/task.dart';
import 'models/all_tasks.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AllTasks>(
        create: (BuildContext context) => AllTasks(),
        builder: (context, provider) {
          return MaterialApp(
            title: 'Todo list',
            theme: ThemeData(
              colorScheme: const ColorScheme.dark().copyWith(
                primary: Colors.black12,
              ),
            ),
            home: const HomePage(),
          );
        });
  }
}
