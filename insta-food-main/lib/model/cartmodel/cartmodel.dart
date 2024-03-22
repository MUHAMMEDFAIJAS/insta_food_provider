import 'package:hive/hive.dart';
part 'cartmodel.g.dart';

@HiveType(typeId: 1)
class CartModel {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String price;

  @HiveField(2)
  final dynamic imagepath;

  CartModel({
    required this.name,
    required this.price,
    required this.imagepath,
  });
}
