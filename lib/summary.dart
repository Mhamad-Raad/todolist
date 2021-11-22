import 'package:ex3/mop_data.dart';
import 'package:flutter/material.dart';

import 'detail.dart';

class Summary extends StatefulWidget {
  const Summary({Key? key}) : super(key: key);

  @override
  _SummaryState createState() => _SummaryState();
}

class _SummaryState extends State<Summary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My To Do List",
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        backgroundColor: Colors.purple[600],
      ),
      body: ListView.separated(
          itemCount: TodoList.length,
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(height: 2),
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Detail(index: index),
                  ),
                ),
              },
              title: Text(TodoList[index].title),
              subtitle:
                  Text("The list has ${TodoList[index].tasks.length} task(s)"),
              trailing: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.purple[600],
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    "${TodoList[index].getPercentage()}",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
