import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _taskController = TextEditingController();
  final DatabaseReference _tasksRef = FirebaseDatabase.instance.ref().child('tasks');

  Future<void> _addTask(String task) async {
    if (task.isEmpty) return;
    await _tasksRef.push().set({
      'task': task,
      'completed': false,
    });
    _taskController.clear();
  }

  Future<void> _updateTask(String taskId, bool currentStatus) async {
    await _tasksRef.child(taskId).update({
      'completed': !currentStatus,
    });
  }

  Future<void> _deleteTask(String taskId) async {
    await _tasksRef.child(taskId).remove();
  }

  Future<void> _editTask(String taskId, String newTask) async {
    if (newTask.isEmpty) return;
    await _tasksRef.child(taskId).update({'task': newTask});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Todo App")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _taskController,
                    decoration: const InputDecoration(labelText: "Task"),
                  ),
                ),
                ElevatedButton(
                  child: const Text("Add Task"),
                  onPressed: () => _addTask(_taskController.text),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text("Tasks", style: TextStyle(fontSize: 20)),
            const SizedBox(height: 10),
            Expanded(
              child: StreamBuilder(
                stream: _tasksRef.onValue,
                builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                  if (snapshot.hasData && snapshot.data!.snapshot.value != null) {
                    Map<dynamic, dynamic> tasksMap = snapshot.data!.snapshot.value as Map<dynamic, dynamic>;
                    List<Map<dynamic, dynamic>> tasksList = tasksMap.entries.map((entry) {
                      return {'key': entry.key, ...entry.value};
                    }).toList();

                    return ListView.builder(
                      itemCount: tasksList.length,
                      itemBuilder: (context, index) {
                        final task = tasksList[index];
                        return ListTile(
                          leading: Checkbox(
                            value: task['completed'],
                            onChanged: (bool? value) {
                              _updateTask(task['key'], task['completed']);
                            },
                          ),
                          title: Text(
                            task['task'],
                            style: TextStyle(
                              decoration: task['completed'] ? TextDecoration.lineThrough : TextDecoration.none,
                            ),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.edit, color: Colors.blue),
                                onPressed: () {
                                  _taskController.text = task['task']; 
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: const Text("Edit Task"),
                                        content: TextField(
                                          controller: _taskController,
                                          decoration: const InputDecoration(labelText: "Edit Task"),
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              _editTask(task['key'], _taskController.text);
                                              _taskController.clear();
                                              Navigator.of(context).pop(); 
                                            },
                                            child: const Text("Save"),
                                          ),
                                          TextButton(
                                            onPressed: () => Navigator.of(context).pop(),
                                            child: const Text("Cancel"),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete, color: Colors.red),
                                onPressed: () => _deleteTask(task['key']),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Text("Error: ${snapshot.error}");
                  } else {
                    return const Text("Your tasks will appear here");
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
