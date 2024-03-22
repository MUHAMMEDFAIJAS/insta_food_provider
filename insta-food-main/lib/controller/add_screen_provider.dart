import 'dart:io';

import 'package:firstproject/controller/food_model_provider.dart';
import 'package:firstproject/model/newmodel/new_food_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddproductProvider extends ChangeNotifier {
  File? image;
  String dropdownvalue = 'biriyani';
  var items = [
    'biriyani',
    'burger',
    'juice',
  ];
  

  final nameController = TextEditingController();
  final priceController = TextEditingController();

  Future<void> getImageFromGallery() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      image = File(pickedImage.path);
      notifyListeners();
    }
  }

  Future<void> addbuttonpressed(context) async {
    final provider = Provider.of<FoodProvider>(context, listen: false);
    final newname = nameController.text.trim();
    final newprice = priceController.text.trim();

    if (newname.isEmpty || newprice.isEmpty) {
      return;
    }
    final product = NewFoodModel(
      name: newname,
      price: newprice,
      imagepath: image!.path,
      catagory: dropdownvalue,
    );

    provider.newAddedFoodProvider(product);

    Navigator.pop(context);
  }

  clearaddproducts() {
    nameController.clear();
    priceController.clear();
    image = null;
  }
}
