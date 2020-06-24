import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:nilskrannig/models/task.dart';
import 'package:nilskrannig/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String _taskName;

    return Container(
      color: Color(0xFF757575),
      child: Container(
        padding: EdgeInsets.all(30.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            topLeft: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 30.0,
              ),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (value) {
                _taskName = value;
              },
            ),
            FlatButton(
              color: Colors.lightBlueAccent,
              textColor: Colors.white,
              onPressed: () {
                Provider.of<TaskData>(context, listen: false).addTask(
                  Task(name: _taskName),
                );
                Navigator.pop(context);
              },
              child: Text(
                'Add',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
