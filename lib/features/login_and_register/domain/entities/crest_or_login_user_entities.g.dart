// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crest_or_login_user_entities.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CreatOrLoginUserEntitesAdapter
    extends TypeAdapter<CreatOrLoginUserEntites> {
  @override
  final int typeId = 0;

  @override
  CreatOrLoginUserEntites read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CreatOrLoginUserEntites(
      id1: fields[0] as num?,
      token1: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CreatOrLoginUserEntites obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id1)
      ..writeByte(1)
      ..write(obj.token1);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreatOrLoginUserEntitesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
