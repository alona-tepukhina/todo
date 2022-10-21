import 'package:flutter/material.dart';
import 'package:todo/models/all_tasks.dart';
import 'package:provider/provider.dart';
import 'package:todo/screens/edit_task_window.dart';

class TaskCard extends StatefulWidget {
  TaskCard({
    super.key,
    required this.taskIndex,
    required this.taskTitle,
    this.isChecked = false,
  });

  int taskIndex;
  final String taskTitle;
  bool isChecked;

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
          widget.taskTitle,
          style: (widget.isChecked)
              ? TextStyle(
                  decoration: TextDecoration.lineThrough,
                  color: Colors.grey.shade600,
                )
              : null,
        ),
        value: widget.isChecked,
        onChanged: (bool? value) {
          setState(() {
            widget.isChecked = value!;
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
                        child: EditTaskWindow(
                          taskTitle: widget.taskTitle,
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
