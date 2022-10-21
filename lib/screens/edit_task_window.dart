import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/all_tasks.dart';

class EditTaskWindow extends StatefulWidget {
  EditTaskWindow({
    Key? key,
    required this.taskIndex,
    required this.taskTitle,
  }) : super(key: key);

  int taskIndex;
  String taskTitle;

  @override
  State<EditTaskWindow> createState() => _EditTaskWindowState();
}

class _EditTaskWindowState extends State<EditTaskWindow> {
  //bool isDone;
  late String newTitle;

  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.text = widget.taskTitle;

    return Container(
      color: Colors.black54,
      child: Container(
        padding:
            const EdgeInsets.only(left: 24, top: 28, right: 24, bottom: 24),
        decoration: BoxDecoration(
          color: Colors.grey.shade800,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              maxLines: 2,
              controller: _controller,
              autofocus: true,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                hintText: 'Task text',
              ),
              onChanged: (value) {
                if (value != '') {
                  newTitle = value;
                }
              },
            ),
            ElevatedButton(
              onPressed: () {
                context.read<AllTasks>().editTask(widget.taskIndex, newTitle);
                Navigator.pop(context);
              },
              child: const Text(
                'Edit Task',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.greenAccent),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
