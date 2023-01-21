import 'package:flutter/material.dart';
import 'package:recipes_app/category_screen.dart';
import 'package:recipes_app/recipe.dart';

import 'models/category.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => HomePage(),
        '/recipe': (context) => Recipe(),
      },
      initialRoute: '/',
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'Recipes',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: CategoryScreen());
  }
}
