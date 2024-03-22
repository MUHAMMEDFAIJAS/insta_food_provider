import 'package:firstproject/functions/buy_now_functions.dart';
import 'package:firstproject/model/buynow/buynowmodel.dart';
import 'package:flutter/material.dart';

class Buynowprovider extends ChangeNotifier {
  List<BuynowModel> buymodelList = [];
  Buyfunction buyfun = Buyfunction();

  Future<void> addbuynowprovider(value) async {
    await buyfun.buynow(value);
    getallbuyprovider();
  }

  Future<void> getallbuyprovider() async {
    buymodelList = await buyfun.getallbuy();
    notifyListeners();
  }

  Future<void> deleteallbuy(index) async {
    await buyfun.deletorder(index);
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
