import 'package:flutter/material.dart';
import 'package:todo/models/task.dart';
import 'package:todo/models/all_tasks.dart';
import 'package:provider/provider.dart';
import 'package:todo/screens/modal_task_window.dart';

class TaskCard extends StatefulWidget {
  TaskCard({
    super.key,
    required this.taskIndex,
  });

  int taskIndex;

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  @override
  Widget build(BuildContext context) {
    Task task = context.read<AllTasks>().getByIndex(widget.taskIndex);

    return Card(
      child: CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        title: Text(
          task.name,
          style: (task.isDone)
              ? TextStyle(
                  decoration: TextDecoration.lineThrough,
                  color: Colors.grey.shade600,
                )
              : null,
        ),
        value: task.isDone,
        onChanged: (bool? value) {
          context.read<AllTasks>().toggleDoneTask(task);
          setState(() {
            task.isDone = value!;
          });
        },
        secondary: SizedBox(
          width: 96,
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    isDismissible: true,
                    builder: (context) => SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom,
                        ),
                        child: ModalTaskWindow(
                          taskTitle: task.name,
                          taskIndex: widget.taskIndex,
                        ),
                      ),
                    ),
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  context.read<AllTasks>().deleteTask(widget.taskIndex);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
