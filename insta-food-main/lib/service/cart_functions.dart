import 'package:firstproject/model/cartmodel/cartmodel.dart';
import 'package:hive/hive.dart';

class CartFuntion {
  Future<void> addToCart(CartModel value) async {
    final cartDB = await Hive.openBox<CartModel>('cart_db');
    await cartDB.add(value);
  }

  Future<List<CartModel>> getAllCart() async {
    final cartDB = await Hive.openBox<CartModel>('cart_db');
    return cartDB.values.toList();
  }

  Future<void> deletCartProduct(int index) async {
    final cartDB = await Hive.openBox<CartModel>('cart_db');
    await cartDB.deleteAt(index);
    getAllCart();
  }
}
