import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ImagePickerButton extends StatefulWidget {
  final Function(File) onImagePicked;

  const ImagePickerButton({Key? key, required this.onImagePicked}) : super(key: key);

  @override
  _ImagePickerButtonState createState() => _ImagePickerButtonState();
}

class _ImagePickerButtonState extends State<ImagePickerButton> {
  final ImagePicker _picker = ImagePicker();
  File? _imageFile;

  // Function to handle both gallery and camera sources
  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);  /
      });
      widget.onImagePicked(_imageFile!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          if (_imageFile != null)
            Image.file(_imageFile!, width: 200, height: 200),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => _pickImage(ImageSource.gallery),
            child: Text('Pick from Gallery'),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () => _pickImage(ImageSource.camera),
            child: Text('Take a Photo'),
          ),
        ],
      ),
    );
  }
}