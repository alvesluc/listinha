import 'package:flutter/material.dart';

class EditTaskBoardPage extends StatefulWidget {
  const EditTaskBoardPage({super.key});

  @override
  State<EditTaskBoardPage> createState() => _EditTaskBoardPage();
}

class _EditTaskBoardPage extends State<EditTaskBoardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Listinha')),
    );
  }
}
