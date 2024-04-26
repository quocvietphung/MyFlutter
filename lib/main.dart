import 'package:flutter/material.dart';
import 'components/flower_classifier.dart';
import 'components/pdf_viewer.dart';

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
        body: Column(
          children: <Widget>[
            FlowerClassifier(),
            PDFViewer(
                url: 'https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf'
            )
          ],
        ),
      ),
    );
  }
}
