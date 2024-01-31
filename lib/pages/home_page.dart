import 'package:flutter/material.dart';
import 'package:web_task/pages/drag_drop.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: DragAndDrop());
  }
}
