import 'package:firstproject/service/cart_functions.dart';
import 'package:firstproject/model/cartmodel/cartmodel.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  List<CartModel> cartmodelList = [];
  CartFuntion cartfun = CartFuntion();

  Future<void> addcartprovider(value) async {
    await cartfun.addToCart(value);
    getallcartsprovider();
  }

  Future<void> getallcartsprovider() async {
    cartmodelList = await cartfun.getAllCart();
    notifyListeners();
  }

  Future<void> deletecartprovider(index) async {
    await cartfun.deletCartProduct(index);
    notifyListeners();
  }

  double totalcartprice() {
    double totals = 0;
    for (var item in cartmodelList) {
      totals += num.parse(item.price);
    }

    return totals;
  }
}
