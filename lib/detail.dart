import 'dart:async';

import 'package:ex3/Todo.dart';
import 'package:ex3/mop_data.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Detail extends StatefulWidget {
  final int index;

  Detail({Key? key, required this.index}) : super(key: key);
  List<bool> show = [true, true, true, true, true];
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  late List<bool> changed = [false, true, true, true, true];

  List<ToDo> temp = TodoList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[600],
        leading: const Text(""),
        centerTitle: true,
        title: Text(TodoList[widget.index].title),
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return Visibility(
            visible: widget.show[index],
            child: ListTile(
              title: Text(
                TodoList[widget.index].tasks[index].title,
                style: TextStyle(
                  decoration: TodoList[widget.index].tasks[index].status
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
              onTap: () {
                setState(() {
                  TodoList[widget.index].tasks[index].status =
                      !TodoList[widget.index].tasks[index].status;
                });
              },
              onLongPress: () {
                setState(() {
                  widget.show[index] = !widget.show[index];
                });
              },
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => Visibility(
          visible: widget.show[index],
          child: const Divider(
            height: 5,
            color: Colors.black,
          ),
        ),
        itemCount: TodoList[widget.index].tasks.length,
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton.extended(
            heroTag: "btn1",
            backgroundColor: Colors.purple[600],
            onPressed: () {
              setState(() {
                for (var i = 0;
                    i < TodoList[widget.index].tasks.length &&
                        i < changed.length;
                    i++) {
                  TodoList[widget.index].tasks[i].status = changed[i];
                }
              });

              Navigator.pop(context);
            },
            label: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(Icons.cancel),
                Text(" "),
                Text("Cancel"),
              ],
            ),
          ),
          FloatingActionButton.extended(
            heroTag: "btn2",
            backgroundColor: Colors.purple[600],
            onPressed: () {
              setState(() {
                TodoList = temp;
                for (int i = 0; i < widget.show.length; i++) {
                  if (widget.show[i] == false) {
                    TodoList[widget.index].tasks.removeAt(i);
                  }
                }
                print(TodoList[widget.index].tasks.length);
              });

              Navigator.pop(context);
            },
            label: Row(
              children: const [
                Icon(Icons.check_circle),
                Text(" "),
                Text("Update"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
