import 'package:flutter/material.dart';

class WordListPage extends StatelessWidget {
  const WordListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
        title: const Text("data"),
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios)),
      )),
    );
  }
}
