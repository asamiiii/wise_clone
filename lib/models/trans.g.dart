// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trans.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DetailsDataAdapter extends TypeAdapter<DetailsData> {
  @override
  final int typeId = 1;

  @override
  DetailsData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DetailsData(
      id: fields[0] as int?,
      userName: fields[1] as String?,
      ammount: fields[2] as String?,
      sent: fields[3] as bool?,
      time: fields[4] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, DetailsData obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.userName)
      ..writeByte(2)
      ..write(obj.ammount)
      ..writeByte(3)
      ..write(obj.sent)
      ..writeByte(4)
      ..write(obj.time);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DetailsDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
