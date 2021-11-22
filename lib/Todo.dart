// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'Task.dart';

class ToDo {
  late String title;
  late List<Task> tasks;
  late int percentage;

  ToDo(String ti, Task t) {
    tasks.add(t);
    String title = ti;
  }
  int getPercentage() {
    int total = 0;
    for (int i = 0; i < tasks.length; i++) {
      if (tasks[i].status == true) {
        total++;
      }
    }
    return total ~/ tasks.length * 100;
  }
}
