import 'package:hive/hive.dart';
part 'buynowmodel.g.dart';

@HiveType(typeId: 4)
class BuynowModel {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String price;

  @HiveField(2)
  final dynamic imagepath;

  BuynowModel({
    required this.name,
    required this.price,
    required this.imagepath,
  });
}
