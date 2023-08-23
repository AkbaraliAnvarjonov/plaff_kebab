import 'package:hive/hive.dart';

part 'product.g.dart';

@HiveType(typeId: 0, adapterName: 'ProductAdapter')
class Products extends HiveObject {
  @HiveField(0)
  String id;
  @HiveField(1)
  NameTitle name;
  @HiveField(2)
  double price;
  @HiveField(3)
  int quantity;
  @HiveField(4)
  String image;
  @HiveField(5)
  List<Modifiers> modifiers;
  @HiveField(6)
  String uniqueId;
  @HiveField(7)
  List<ComboHive> combos;
  @HiveField(8)
  String? type;
  @HiveField(9)
  double discounts;

  Products({
    required this.id,
    required this.image,
    required this.name,
    required this.price,
    required this.quantity,
    required this.modifiers,
    required this.uniqueId,
    this.discounts = 0,
    required this.combos,
    required this.type,
  });

  double getAllPrice() {
    double modifiersPrices = 0;
    for (int i = 0; i < (modifiers).length; i++) {
      modifiersPrices += ((modifiers[i].addModifierPrice ?? true)
              ? 0
              : (modifiers[i].modifiersPrice)) *
          (modifiers[i].modifierQuantity);
    }
    return modifiersPrices + ((price + discounts) * quantity);
  }
}

@HiveType(typeId: 1, adapterName: 'ModifierAdapter')
class Modifiers extends HiveObject {
  @HiveField(0)
  String modifierId;
  @HiveField(1)
  NameTitle modifierName;
  @HiveField(2)
  int modifierQuantity;
  @HiveField(3)
  int modifiersPrice;
  @HiveField(4)
  String parentId;
  @HiveField(5)
  bool? addModifierPrice;

  Modifiers({
    required this.modifierName,
    required this.modifierId,
    required this.modifierQuantity,
    required this.modifiersPrice,
    required this.parentId,
    this.addModifierPrice = true,
  });

  @override
  String toString() {
    return 'Modifiers{modifierId: $modifierId, modifierName: $modifierName, modifierQuantity: $modifierQuantity, modifiersPrice: $modifiersPrice, parentId: $parentId, addModifierPrice: $addModifierPrice}';
  }
}

@HiveType(typeId: 2, adapterName: 'ComboAdapter')
class ComboHive extends HiveObject {
  @HiveField(0)
  String groupId;
  @HiveField(1)
  String variantId;
  @HiveField(2)
  NameTitle variantName;
  @HiveField(3)
  int quantity;

  ComboHive({
    required this.groupId,
    required this.variantId,
    required this.variantName,
    required this.quantity,
  });
}

@HiveType(typeId: 3, adapterName: 'NameTitleAdapter')
class NameTitle extends HiveObject {
  @HiveField(0)
  String uz;
  @HiveField(1)
  String ru;
  @HiveField(2)
  String en;

  NameTitle({
    required this.uz,
    required this.ru,
    required this.en,
  });
}
