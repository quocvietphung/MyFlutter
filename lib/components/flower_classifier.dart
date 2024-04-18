// /lib/views/components/flower_classifier.dart
import 'package:flutter/material.dart';
import 'dart:io';
import '../services/api_service.dart';
import 'image_picker_button.dart';

class FlowerClassifier extends StatefulWidget {
  @override
  _FlowerClassifierState createState() => _FlowerClassifierState();
}

class _FlowerClassifierState extends State<FlowerClassifier> {
  String _result = '';
  File? _image;

  void _classifyImage(File imageFile) async {
    setState(() {
      _image = imageFile;
    });
    String result = await ApiService().classifyImage(imageFile);
    setState(() {
      _result = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (_image != null) Image.file(_image!),
        ImagePickerButton(onImagePicked: _classifyImage),
        if (_result.isNotEmpty) Text('Result: $_result'),
      ],
    );
  }
}
