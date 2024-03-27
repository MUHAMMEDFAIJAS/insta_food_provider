import 'dart:developer';
import 'package:firstproject/service/food_function.dart';
import 'package:firstproject/model/newmodel/new_food_model.dart';
import 'package:flutter/material.dart';

class FoodProvider extends ChangeNotifier {
  List<NewFoodModel> foodmodel = [];
  final DbFunction foodfunction = DbFunction();

  Future<void> newAddedFoodProvider(NewFoodModel value) async {
    await foodfunction.newAddedFood(value);
    await getallproductsprovider();
  }

  Future<void> getallproductsprovider() async {
    foodmodel = await foodfunction.getAllNewFood();
    notifyListeners();
  }

  Future<void> deleteproductsprovider(index) async {
    log('delete');
    await foodfunction.deleteNew(index);
    await getallproductsprovider();
  }

  Future<void> editproductsprovider(int index, NewFoodModel value) async {
    log('dddd');
    await foodfunction.editNewFood(index, value);
    notifyListeners();
    await getallproductsprovider();
  }

  double totalprice1() {
    double totals = 0;
    for (var item in foodmodel) {
      totals += double.parse(item.price);
    }
    return totals;
  }
}
