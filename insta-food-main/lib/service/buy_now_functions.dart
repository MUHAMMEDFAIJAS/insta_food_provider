import 'package:firstproject/model/buynow/buynowmodel.dart';
import 'package:hive/hive.dart';

class BuyFunction {
  Future<void> buyNow(BuynowModel value) async {
    final buyNowDB = await Hive.openBox<BuynowModel>('buy_db');
    await buyNowDB.add(value);
  }

  Future<List<BuynowModel>> getAllBuy() async {
    final buyNowDB = await Hive.openBox<BuynowModel>('buy_db');
    return buyNowDB.values.toList();
  }

  Future<void> deleteOrder(int index) async {
    final buyNowDB = await Hive.openBox<BuynowModel>('buy_db');
    await buyNowDB.deleteAt(index);
    getAllBuy();
  }
}
