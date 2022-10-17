import 'package:flutter/material.dart';
import 'package:todo/models/all_tasks.dart';
import 'package:provider/provider.dart';

class TaskCard extends StatefulWidget {
  TaskCard({
    super.key,
    required this.taskTitle,
    this.isChecked = false,
    //required this.checkBoxCallback,
  });

  final String taskTitle;
  bool isChecked;
  //final Function checkBoxCallback;

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
        secondary: IconButton(
          //icon: const Icon(Icons.edit),
          icon: const Icon(Icons.delete),
          onPressed: () {
            Provider.of<AllTasks>(context, listen: false)
                .deleteTask(widget.taskTitle);
          },
        ),
      ),
    );
  }
}
