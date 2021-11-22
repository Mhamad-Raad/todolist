import 'package:ex3/mop_data.dart';
import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  final int index;
  const Detail({Key? key, required this.index}) : super(key: key);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
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
          return ListTile(
            title: Text(TodoList[widget.index].tasks[index].title),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(
          height: 5,
          color: Colors.black,
        ),
        itemCount: TodoList[widget.index].tasks.length,
      ),
    );
  }
}
