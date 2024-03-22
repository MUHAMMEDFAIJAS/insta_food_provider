import 'package:firstproject/model/buynow/buynowmodel.dart';
import 'package:hive/hive.dart';

class Buyfunction {
  Future<void> buynow(BuynowModel value) async {
    final buynowDb = await Hive.openBox<BuynowModel>('buy_db');
    await buynowDb.add(value);
  }

  Future<List<BuynowModel>> getallbuy() async {
    final buynowDb = await Hive.openBox<BuynowModel>('buy_db');
    return buynowDb.values.toList();
  }

  Future<void> deletorder(int index) async {
    final buynowDb = await Hive.openBox<BuynowModel>('buy_db');
    await buynowDb.deleteAt(index);
    getallbuy();
  }
}
