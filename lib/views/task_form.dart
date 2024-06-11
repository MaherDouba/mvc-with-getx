import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:task_management_app/controllers/task_controller.dart';
import 'package:task_management_app/models/task.dart';

class TaskForm extends StatelessWidget {
  final Task? task;
  final int? index;
  final TaskController taskController = Get.find();

  final _formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController priorityController = TextEditingController();

  TaskForm({this.task, this.index}) {
    if (task != null) {
      titleController.text = task!.title;
      descriptionController.text = task!.description;
      dateController.text = DateFormat('yyyy-MM-dd').format(task!.date);
      timeController.text = task!.time;
      categoryController.text = task!.category;
      priorityController.text = task!.priority.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(task == null ? 'Add Task' : 'Edit Task'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
              ),
              TextFormField(
                controller: dateController,
                decoration: InputDecoration(labelText: 'Date (yyyy-MM-dd)'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a date';
                  }
                  try {
                    DateFormat('yyyy-MM-dd').parseStrict(value);
                  } catch (e) {
                    return 'Invalid date format';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: timeController,
                decoration: InputDecoration(labelText: 'Time'),
              ),
              TextFormField(
                controller: categoryController,
                decoration: InputDecoration(labelText: 'Category'),
              ),
              TextFormField(
                controller: priorityController,
                decoration: InputDecoration(labelText: 'Priority'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final task = Task(
                      title: titleController.text,
                      description: descriptionController.text,
                      date: DateFormat('yyyy-MM-dd').parseStrict(dateController.text),
                      time: timeController.text,
                      category: categoryController.text,
                      priority: int.parse(priorityController.text),
                    );
                    if (index == null) {
                      taskController.addTask(task);
                    } else {
                      taskController.updateTask(index!, task);
                    }
                    Get.back();
                  }
                },
                child: Text(task == null ? 'Add Task' : 'Update Task'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
