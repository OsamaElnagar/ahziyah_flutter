// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wishlist_shoes.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WishlistShoesModelAdapter extends TypeAdapter<WishlistShoesModel> {
  @override
  final int typeId = 2;

  @override
  WishlistShoesModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WishlistShoesModel(
      id: (fields[0] as num).toInt(),
      name: fields[1] as String,
      slug: fields[2] as String,
      image: fields[3] as String,
      brand: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, WishlistShoesModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.slug)
      ..writeByte(3)
      ..write(obj.image)
      ..writeByte(4)
      ..write(obj.brand);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WishlistShoesModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
