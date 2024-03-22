// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buynowmodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BuynowModelAdapter extends TypeAdapter<BuynowModel> {
  @override
  final int typeId = 4;

  @override
  BuynowModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BuynowModel(
      name: fields[0] as String,
      price: fields[1] as String,
      imagepath: fields[2] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, BuynowModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.price)
      ..writeByte(2)
      ..write(obj.imagepath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BuynowModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
