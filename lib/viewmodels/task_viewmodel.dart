import 'package:flutter/material.dart';
import '../models/task.dart';
import '../repositories/task_repository.dart';

class TaskViewModel extends ChangeNotifier {
  final TaskRepository _repository = TaskRepository();

  List<Task> get tasks => _repository.getTasks();

  void addTask(Task task) {
    _repository.addTask(task);
    notifyListeners();
  }

  void toggleTaskStatus(Task task) {
    task.isCompleted = !task.isCompleted;
    _repository.updateTask(task);
    notifyListeners();
  }

  void deleteTask(String id) {
    _repository.deleteTask(id);
    notifyListeners();
  }
}
