// /lib/main.dart
import 'package:flutter/material.dart';
import 'components/flower_classifier.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Flower Classifier',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flower Classifier'),
        ),
        body: FlowerClassifier(),
      ),
    );
  }
}
