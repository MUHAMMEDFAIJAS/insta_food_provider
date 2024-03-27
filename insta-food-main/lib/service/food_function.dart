import 'dart:developer';

import 'package:hive_flutter/adapters.dart';

import '../model/newmodel/new_food_model.dart';

class DbFunction {
  Future<void> newAddedFood(NewFoodModel value) async {
    final foodDB = await Hive.openBox<NewFoodModel>('newadded_db');
    await foodDB.add(value);
  }

  Future<List<NewFoodModel>> getAllNewFood() async {
    final foodDB = await Hive.openBox<NewFoodModel>('newadded_db');
    return foodDB.values.toList();
  }

  Future<void> editNewFood(int index, NewFoodModel value) async {
    log('message');
    final foodDB = await Hive.openBox<NewFoodModel>('newadded_db');

    foodDB.putAt(index, value);

    getAllNewFood();
  }

  Future<void> deleteNew(index) async {
    log('deletefunction');
    final newaddedDb = await Hive.openBox<NewFoodModel>('newadded_db');
    newaddedDb.deleteAt(index);
    getAllNewFood();
  }
}
