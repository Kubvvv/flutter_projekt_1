import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Projekt 1 - Todo List'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Map<String, dynamic>> _tasks = [];
  final TextEditingController _controller = TextEditingController();
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    // Add a listener to track changes in the text field
    _controller.addListener(() {
      setState(() {
        _isButtonEnabled = _controller.text.trim().isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    // Dispose the controller when not in use to avoid memory leaks
    _controller.dispose();
    super.dispose();
  }

  // Add a new task
  void _addTask() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _tasks.add({'title': _controller.text, 'done': false});
        _controller.clear();
      });
    }
  }

  // Toggle task status between 'todo' and 'done'
  void _toggleTaskStatus(int index) {
    setState(() {
      _tasks[index]['done'] = !_tasks[index]['done'];
    });
  }

  // Remove a task
  void _removeTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          // Input field to add new tasks
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Enter a task',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: _isButtonEnabled ? _addTask : null,
            child: const Text('Add Task'),
          ),
          Expanded(
            child: ListView(
              children: [
                // To-Do Tasks Section
                if (_tasks.any((task) => !task['done']))
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'To-Do Tasks',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ..._tasks
                    .where((task) => !task['done'])
                    .map((task) => ListTile(
                          title: Text(
                            task['title'],
                            style: const TextStyle(
                              decoration: TextDecoration.none,
                            ),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.check,
                                    color: Colors.green),
                                onPressed: () {
                                  setState(() {
                                    task['done'] = true;
                                  });
                                },
                              ),
                              IconButton(
                                icon:
                                    const Icon(Icons.delete, color: Colors.red),
                                onPressed: () {
                                  setState(() {
                                    _tasks.remove(task);
                                  });
                                },
                              ),
                            ],
                          ),
                        ))
                    .toList(),

                // Done Tasks Section
                if (_tasks.any((task) => task['done']))
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Done Tasks',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ..._tasks
                    .where((task) => task['done'])
                    .map((task) => ListTile(
                          title: Text(
                            task['title'],
                            style: const TextStyle(
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.undo,
                                    color: Colors.orange),
                                onPressed: () {
                                  setState(() {
                                    task['done'] = false;
                                  });
                                },
                              ),
                              IconButton(
                                icon:
                                    const Icon(Icons.delete, color: Colors.red),
                                onPressed: () {
                                  setState(() {
                                    _tasks.remove(task);
                                  });
                                },
                              ),
                            ],
                          ),
                        ))
                    .toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
