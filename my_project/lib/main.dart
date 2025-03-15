import 'package:flutter/material.dart';
import 'package:my_project/pages/home.dart';
import 'package:my_project/pages/oneHome.dart'; // Обрати внимание на имя файла

void main() => runApp(MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.pink,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => OneHome(),
        '/todo': (context) => Home(),
      },
    ));
