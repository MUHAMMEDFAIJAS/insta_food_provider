import 'dart:developer';


import 'package:hive_flutter/adapters.dart';

import '../model/newmodel/new_food_model.dart';

class DbFunction {
  Future<void> newAddedFood(NewFoodModel value) async {
    final newaddedDB = await Hive.openBox<NewFoodModel>('newadded_db');
    await newaddedDB.add(value);
  }

  Future<List<NewFoodModel>> getAllNewFood() async {
    final newaddedDb = await Hive.openBox<NewFoodModel>('newadded_db');
    return newaddedDb.values.toList();
  }

  Future<void> editNewFood(int index, NewFoodModel value) async {
    log('message');
    final newaddedDb = await Hive.openBox<NewFoodModel>('newadded_db');

    newaddedDb.putAt(index, value);

    getAllNewFood();
  }

  Future<void> deleteNew(index) async {
    log('deletefunction');
    final newaddedDb = await Hive.openBox<NewFoodModel>('newadded_db');
    newaddedDb.deleteAt(index);
    getAllNewFood();
  }
}
