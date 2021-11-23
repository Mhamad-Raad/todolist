// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'Task.dart';
import 'detail.dart';

class ToDo {
  late String title;
  late List<Task> tasks;

  ToDo(String ti, List<Task> t) {
    tasks = t;
    title = ti;
  }

  getPercentage() {
    int total = 0;
    for (int i = 0; i < tasks.length; i++) {
      if (tasks[i].status == true) {
        total++;
      }
    }

    return (total / tasks.length * 100).toInt();
  }
}
