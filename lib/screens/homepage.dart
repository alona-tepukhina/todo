import 'package:flutter/material.dart';
import 'package:todo/widgets/task_list.dart';
import 'package:todo/screens/modal_task_window.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
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
                      child: ModalTaskWindow(),
                    ),
                  ));
        },
        child: const Icon(
          Icons.add,
          size: 24,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 24.0, left: 4, right: 4),
          child: Column(
            children: const [
              Text(
                'Tasks',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: TasksList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
