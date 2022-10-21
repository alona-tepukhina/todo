import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/all_tasks.dart';

class ModalTaskWindow extends StatefulWidget {
  ModalTaskWindow({
    Key? key,
    this.taskIndex,
    this.taskTitle,
  }) : super(key: key);

  int? taskIndex;
  String? taskTitle;

  @override
  State<ModalTaskWindow> createState() => _ModalTaskWindowState();
}

class _ModalTaskWindowState extends State<ModalTaskWindow> {
  //bool isDone;
  late String newTitle;

  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool editOrAdd = (widget.taskTitle != null);

    _controller.text = widget.taskTitle ?? '';

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
              //autofocus: true,
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
                if (editOrAdd) {
                  context
                      .read<AllTasks>()
                      .editTask(widget.taskIndex!, newTitle);
                } else {
                  context.read<AllTasks>().addTask(newTitle);
                }

                Navigator.pop(context);
              },
              child: Text(
                (editOrAdd) ? 'Edit Task' : 'Add task',
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.greenAccent),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
