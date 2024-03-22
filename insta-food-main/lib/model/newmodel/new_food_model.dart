import 'package:hive_flutter/adapters.dart';
part 'new_food_mode.g.dart';

@HiveType(typeId: 2)
class NewFoodModel {
  @HiveField(0)
  final String imagepath;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String price;

  @HiveField(3)
  final String catagory;

  NewFoodModel({
    required this.imagepath,
    required this.name,
    required this.price,
    required this.catagory,
  });
}
