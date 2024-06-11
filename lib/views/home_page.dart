import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management_app/controllers/task_controller.dart';
import 'package:task_management_app/views/task_form.dart';

class HomePage extends StatelessWidget {
  final TaskController taskController = Get.put(TaskController() , permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Management App'),
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: taskController.tasks.length,
          itemBuilder: (context, index) {
            final task = taskController.tasks[index];
            return ListTile(
              title: Text(task.title),
              subtitle: Text(task.description),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  taskController.deleteTask(index);
                },
              ),
              onTap: () {
                Get.to(TaskForm(task: task, index: index));
              },
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Get.to(TaskForm());
        },
      ),
    );
  }
}
