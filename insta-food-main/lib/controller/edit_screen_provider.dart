import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Editprovider extends ChangeNotifier {
  TextEditingController nameContrl = TextEditingController();
  TextEditingController priceContrl = TextEditingController();
  File? selectImage;

  Future<void> pickImgGallery() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) {
      return;
    }

    selectImage = File(returnImage.path);
    notifyListeners();
  }
}
