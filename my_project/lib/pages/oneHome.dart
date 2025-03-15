import 'package:flutter/material.dart';

class OneHome extends StatelessWidget {
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
      ),
      body: Column(children: [
        Text('список дел'),
        ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/todo');
            },
            child: Text('Перейти далее'))
      ]),
    );
  }
}
