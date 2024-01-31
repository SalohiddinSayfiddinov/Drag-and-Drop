import 'package:flutter/material.dart';
import 'package:web_task/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.grey.withOpacity(0.1),
      ), 
      home: const HomePage(),
    );
  }
}

// Flutter_boardview --
// flow_board: ^0.0.1 --
// drag_and_drop: ^1.0.0 --
