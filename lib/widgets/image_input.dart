import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart' as imagePicker;
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as sysPaths;

class ImagePicker extends StatefulWidget {
  final Function onSelectImage;

  ImagePicker(this.onSelectImage);

  @override
  _ImagePickerState createState() => _ImagePickerState();
}

class _ImagePickerState extends State<ImagePicker> {
  File storedImage;

  Future<void> takePicture() async {
    final picker = imagePicker.ImagePicker();
    final imageFile = await picker.getImage(
      source: imagePicker.ImageSource.camera,
      maxWidth: 600,
    );
    if (imageFile == null) {
      return;
    }
    setState(() {
      storedImage = File(imageFile.path);
    });
    final appDir = await sysPaths.getApplicationDocumentsDirectory();
    final fileName = path.basename(imageFile.path);
    final savedImage =
        await File(imageFile.path).copy("${appDir.path}/$fileName");
    widget.onSelectImage(savedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          child: storedImage != null
              ? Image.file(
                  storedImage,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : Text(
                  "Нет фото",
                  textAlign: TextAlign.center,
                ),
          alignment: Alignment.center,
        ),
        SizedBox(width: 10),
        Expanded(
          // ignore: deprecated_member_use
          child: FlatButton.icon(
            icon: Icon(Icons.camera),
            label: Text("Сделайте фото"),
            textColor: Theme.of(context).primaryColor,
            onPressed: takePicture,
          ),
        ),
      ],
    );
  }
}
