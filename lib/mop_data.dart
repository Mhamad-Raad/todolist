import 'package:ex3/Task.dart';

import 'Todo.dart';

// ignore: non_constant_identifier_names
List<ToDo> TodoList = [
  ToDo("MAP project", [
    Task("Deliverable #1: project proposal and design", false),
    Task("Deliverable #2:prototype 1", true),
    Task("Deliverable #3:prototype 2", true),
    Task("Deliverable #4:Backend", true),
    Task("Deliverable #5:release version", true),
  ]),
  ToDo("Preparing for online learning", [
    Task("open browser", true),
    Task("search for your questions", false),
    Task("copy paste answers", false),
    Task("get high mark", false)
  ]),
  ToDo("Things to do this weekend", [
    Task("play video games", true),
    Task("study midterm", false),
    Task("play more video games", true),
    Task("stay all night sleep all day", true)
  ]),
];
