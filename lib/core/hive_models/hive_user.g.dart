// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveUserObjectAdapter extends TypeAdapter<HiveUserObject> {
  @override
  final int typeId = 1;

  @override
  HiveUserObject read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveUserObject(
      userId: fields[0] as int?,
      firstName: fields[1] as String?,
      surname: fields[2] as String?,
      userName: fields[3] as String?,
      email: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, HiveUserObject obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.userId)
      ..writeByte(1)
      ..write(obj.firstName)
      ..writeByte(2)
      ..write(obj.surname)
      ..writeByte(3)
      ..write(obj.userName)
      ..writeByte(4)
      ..write(obj.email);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveUserObjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
