import 'dart:collection';

import 'task.dart';
import 'package:flutter/cupertino.dart';
import 'dart:collection';

class AllTasks extends ChangeNotifier {
  final List<Task> _tasks = [
    Task(name: 'Fly to Venice'),
    Task(name: 'Take vaporetto'),
    Task(name: 'Have a lunch on Burano', isDone: true),
    Task(
        name:
            'Get to the hotel, sleep a couple of hours and take gondola to make awesome photos'),
  ];

  int get taskCount {
    return _tasks.length;
  }

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  void addTask(String newTaskName) {
    final task = Task(name: newTaskName);
    _tasks.add(task);
    notifyListeners();
  }

  void toggleDoneTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(String name) {
    _tasks.removeWhere((element) => element.name == name);
    notifyListeners();
  }

  void editTask(String name, String newName) {
    Task tmpTask = _tasks.firstWhere((element) => element.name == name);
    int tmpInd = _tasks.indexOf(tmpTask);
    tmpTask.name = newName;
    _tasks[tmpInd] = tmpTask;

    notifyListeners();
  }
}
