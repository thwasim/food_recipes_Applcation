import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class AddRecipesController with ChangeNotifier {
  File? imagefile;

  takeGallery() async {
    XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;

    final imageTempray = File(image.path);

    imagefile = imageTempray;
    notifyListeners();

    addimage(image);
  }

  takeCamera() async {
    XFile? image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return;

    final imageTempray = File(image.path);
    imagefile = imageTempray;
    notifyListeners();

    addimage(image);
  }

  String img = '';

  addimage(XFile? pickimage) {
    if (pickimage == null) {
      return;
    } else {
      final bytes = File(pickimage.path).readAsBytesSync();
      img = base64Encode(bytes);
    }
  }
}
