import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/all_tasks.dart';

class AddTaskWindow extends StatelessWidget {
  AddTaskWindow({Key? key}) : super(key: key);

  late String taskTitle;
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
              controller: _controller,
              autofocus: true,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                hintText: 'Task text',
              ),
              onChanged: (value) {
                if (value != '') {
                  taskTitle = value;
                }
              },
            ),
            ElevatedButton(
              onPressed: () {
                // Provider.of<AllTasks>(context, listen: false)
                //     .addTask(taskTitle);
                context.read<AllTasks>().addTask(taskTitle);
                Navigator.pop(context);
              },
              child: const Text(
                'Add Task',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
