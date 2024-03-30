import 'package:firstproject/service/buy_now_functions.dart';
import 'package:firstproject/model/buynow/buynowmodel.dart';
import 'package:flutter/material.dart';

class Buynowprovider extends ChangeNotifier {
  List<BuynowModel> buymodelList = [];
  BuyFunction buyfun = BuyFunction();


  Future<void> addbuynowprovider(value) async {
    await buyfun.buyNow(value);
    getallbuyprovider();
  }

  Future<void> getallbuyprovider() async {
    buymodelList = await buyfun.getAllBuy();
    notifyListeners();
  }

  Future<void> deleteallbuy(index) async {
    await buyfun.deleteOrder(index);
    notifyListeners();
  }

  double totalpricebuy() {
    double totals = 0;
    for (var item in buymodelList) {
      totals += num.parse(item.price);
    }
    return totals;
  }
}
