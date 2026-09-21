import 'package:flutter/material.dart';

void main() {
  runApp(const ZuhriApp());
}

class ZuhriApp extends StatelessWidget {
  const ZuhriApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zuhri Formalism Core',
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('ZF-Core App'),
        ),
        body: const Center(
          child: Text(
            'Zuhri Formalism Core Terhubung',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
