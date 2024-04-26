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

  // Function to handle picking an image from gallery
  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path); // Update the UI with the new image
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
            onPressed: _pickImage,
            child: Text('Pick from Gallery'),
          ),
        ],
      ),
    );
  }
}