// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Classes.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ItemClassAdapter extends TypeAdapter<ItemClass> {
  @override
  final int typeId = 1;

  @override
  ItemClass read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ItemClass(
      userId: fields[1] as int,
      name: fields[2] as String,
      discription: fields[3] as String,
    )..id = fields[0] as int;
  }

  @override
  void write(BinaryWriter writer, ItemClass obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.userId)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.discription);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemClassAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
