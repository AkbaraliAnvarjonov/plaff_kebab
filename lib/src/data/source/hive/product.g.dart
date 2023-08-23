// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductAdapter extends TypeAdapter<Products> {
  @override
  final int typeId = 0;

  @override
  Products read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Products(
      id: fields[0] as String,
      image: fields[4] as String,
      name: fields[1] as NameTitle,
      price: fields[2] as double,
      quantity: fields[3] as double,
      modifiers: (fields[5] as List).cast<Modifiers>(),
      uniqueId: fields[6] as String,
      discounts: fields[9] as double,
      combos: (fields[7] as List).cast<ComboHive>(),
      type: fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Products obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.quantity)
      ..writeByte(4)
      ..write(obj.image)
      ..writeByte(5)
      ..write(obj.modifiers)
      ..writeByte(6)
      ..write(obj.uniqueId)
      ..writeByte(7)
      ..write(obj.combos)
      ..writeByte(8)
      ..write(obj.type)
      ..writeByte(9)
      ..write(obj.discounts);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ModifierAdapter extends TypeAdapter<Modifiers> {
  @override
  final int typeId = 1;

  @override
  Modifiers read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Modifiers(
      modifierName: fields[1] as NameTitle,
      modifierId: fields[0] as String,
      modifierQuantity: fields[2] as int,
      modifiersPrice: fields[3] as int,
      parentId: fields[4] as String,
      addModifierPrice: fields[5] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, Modifiers obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.modifierId)
      ..writeByte(1)
      ..write(obj.modifierName)
      ..writeByte(2)
      ..write(obj.modifierQuantity)
      ..writeByte(3)
      ..write(obj.modifiersPrice)
      ..writeByte(4)
      ..write(obj.parentId)
      ..writeByte(5)
      ..write(obj.addModifierPrice);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ModifierAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ComboAdapter extends TypeAdapter<ComboHive> {
  @override
  final int typeId = 2;

  @override
  ComboHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ComboHive(
      groupId: fields[0] as String,
      variantId: fields[1] as String,
      variantName: fields[2] as NameTitle,
      quantity: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, ComboHive obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.groupId)
      ..writeByte(1)
      ..write(obj.variantId)
      ..writeByte(2)
      ..write(obj.variantName)
      ..writeByte(3)
      ..write(obj.quantity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ComboAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class NameTitleAdapter extends TypeAdapter<NameTitle> {
  @override
  final int typeId = 3;

  @override
  NameTitle read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NameTitle(
      uz: fields[0] as String,
      ru: fields[1] as String,
      en: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, NameTitle obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.uz)
      ..writeByte(1)
      ..write(obj.ru)
      ..writeByte(2)
      ..write(obj.en);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NameTitleAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
