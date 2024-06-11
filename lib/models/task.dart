import 'package:intl/intl.dart';

class Task {
  String title;
  String description;
  DateTime date;
  String time;
  String category;
  int priority;

  Task({
    required this.title,
    required this.description,
    required this.date,
    required this.time,
    required this.category,
    required this.priority,
  });

  String get formattedDate => DateFormat('yyyy-MM-dd').format(date);
}
