import 'package:flutter/material.dart';
import 'package:todo/models/all_tasks.dart';
import 'package:todo/widgets/task_card.dart';
import 'package:provider/provider.dart';

class TasksList extends StatelessWidget {
  const TasksList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AllTasks>(
        builder: (BuildContext context, notifier, Widget? child) {
      return ListView.builder(
          itemCount: notifier.taskCount,
          itemBuilder: (context, index) {
            return TaskCard(
              taskIndex: index,
            );
          });
    });
  }
}
