import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/task_viewmodel.dart';
import 'add_task_screen.dart';

class TaskListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Tugas MVVM'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Consumer<TaskViewModel>(
        builder: (context, taskVM, child) {
          final tasks = taskVM.tasks;
          if (tasks.isEmpty) {
            return Center(
              child: Text(
                'Wah, belum ada tugas nih!\nYuk, tambahkan dulu.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.grey[600]),
              ),
            );
          }
          return ListView.separated(
            padding: const EdgeInsets.all(12),
            itemCount: tasks.length,
            separatorBuilder: (_, __) => Divider(height: 1),
            itemBuilder: (context, index) {
              final task = tasks[index];
              return Dismissible(
                key: Key(task.id),
                direction: DismissDirection.endToStart,
                background: Container(
                  color: Colors.redAccent,
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Icon(
                    Icons.delete_forever,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                confirmDismiss: (_) async {
                  return await showDialog(
                    context: context,
                    builder:
                        (_) => AlertDialog(
                          title: Text('Konfirmasi Hapus'),
                          content: Text(
                            'Yakin ingin hapus tugas "${task.title}"?',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context, false),
                              child: Text('Batal'),
                            ),
                            TextButton(
                              onPressed: () => Navigator.pop(context, true),
                              child: Text('Hapus'),
                            ),
                          ],
                        ),
                  );
                },
                onDismissed: (_) {
                  taskVM.deleteTask(task.id);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Tugas "${task.title}" dihapus')),
                  );
                },
                child: ListTile(
                  leading: Checkbox(
                    value: task.isCompleted,
                    onChanged: (_) => taskVM.toggleTaskStatus(task),
                    activeColor: Colors.teal,
                  ),
                  title: Text(
                    task.title,
                    style: TextStyle(
                      fontSize: 18,
                      decoration:
                          task.isCompleted ? TextDecoration.lineThrough : null,
                      color: task.isCompleted ? Colors.grey : Colors.black87,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => AddTaskScreen()),
          );
        },
        label: Text('Tambah Tugas', style: TextStyle(color: Colors.white)),
        icon: Icon(Icons.add, color: Colors.white),
        backgroundColor: Colors.teal,
      ),
    );
  }
}
