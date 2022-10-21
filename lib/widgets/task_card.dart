import 'package:flutter/material.dart';
import 'package:todo/models/task.dart';
import 'package:todo/models/all_tasks.dart';
import 'package:provider/provider.dart';
import 'package:todo/screens/modal_task_window.dart';

class TaskCard extends StatefulWidget {
  TaskCard({
    super.key,
    required this.task,
    required this.taskIndex,
  });

  Task task;
  int taskIndex;

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        title: Text(
          widget.task.name,
          style: (widget.task.isDone)
              ? TextStyle(
                  decoration: TextDecoration.lineThrough,
                  color: Colors.grey.shade600,
                )
              : null,
        ),
        value: widget.task.isDone,
        onChanged: (bool? value) {
          context.read<AllTasks>().toggleDoneTask(widget.task);
          setState(() {
            widget.task.isDone = value!;
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
                          taskTitle: widget.task.name,
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
