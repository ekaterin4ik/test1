import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? _userToDo;
  List<String> todoList = [];
  List<String> deletedTasks = [];

  @override
  void initState() {
    super.initState();
    todoList.addAll(['вода', 'молоко']);
  }

  void _menuOpen() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Корзина'),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              itemCount: deletedTasks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(deletedTasks[index]),
                );
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Закрыть'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 209, 65, 113),
        title: Text(
          'Список дел',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(icon: Icon(Icons.menu_outlined), onPressed: _menuOpen)
        ],
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            key: Key(todoList[index]),
            child: Card(
              child: ListTile(
                title: Text(todoList[index]),
                trailing: IconButton(
                  icon: Icon(Icons.delete_sweep, color: Colors.pink),
                  onPressed: () {
                    setState(() {
                      deletedTasks.add(todoList[index]);
                      todoList.removeAt(index);
                    });
                  },
                ),
              ),
            ),
            onDismissed: (direction) {
              setState(() {
                deletedTasks.add(todoList[index]);
                todoList.removeAt(index);
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Добавить элемент'),
                content: TextField(
                  onChanged: (String value) {
                    _userToDo = value;
                  },
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      if (_userToDo != null && _userToDo!.isNotEmpty) {
                        setState(() {
                          todoList.add(_userToDo!);
                        });
                      }
                      Navigator.of(context).pop();
                    },
                    child: Text('Добавить'),
                  )
                ],
              );
            },
          );
        },
        child: Icon(
          Icons.add_box,
          color: Colors.white,
        ),
      ),
    );
  }
}
