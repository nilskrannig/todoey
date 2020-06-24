import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:nilskrannig/widgets/task_tile.dart';
import 'package:nilskrannig/models/task_data.dart';

class TasksList extends StatefulWidget {
  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            var task = taskData.tasks[index];

            return TaskTile(
              taskTitle: task.name,
              isChecked: task.isDone,
              checkboxCallback: (checkboxState) {
                taskData.toggleTask(index);
              },
              onLongPress: () {
                taskData.removeTask(index);
              },
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
