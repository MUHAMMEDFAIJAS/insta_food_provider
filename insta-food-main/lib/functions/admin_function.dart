import 'package:firstproject/model/buynow/buynowmodel.dart';
import 'package:firstproject/model/cartmodel/cartmodel.dart';
import 'package:firstproject/model/newmodel/new_food_model.dart';
import 'package:hive/hive.dart';

class DeleteAdmin {
  Future<void> deleteall() async {
    await Hive.box<NewFoodModel>('newadded_db').clear();
    await Hive.box<CartModel>('cart_db').clear();
    await Hive.box<BuynowModel>('buy_db').clear();
  }
}
