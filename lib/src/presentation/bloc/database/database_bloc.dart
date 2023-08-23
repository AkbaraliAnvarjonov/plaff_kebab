import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plaff_kebab/src/data/models/product/combo/combo_model.dart';
import 'package:plaff_kebab/src/data/models/product/modifier/modifier.dart';
import 'package:plaff_kebab/src/data/models/translations_model.dart';
import 'package:plaff_kebab/src/data/source/hive/product.dart';
import 'package:plaff_kebab/src/data/source/local_source.dart';
import 'package:plaff_kebab/src/presentation/bloc/database/database_event.dart';
import 'package:plaff_kebab/src/presentation/bloc/database/database_state.dart';

class DatabaseBloc extends Bloc<DatabaseEvent, DatabaseState> {
  DatabaseBloc(this.localSource) : super(const DatabaseState()) {
    on<AddProduct>(_addProduct);
    on<GetProduct>(_getProduct);
    on<UpdateProduct>(_updateProduct);
    on<DeleteProducts>(_deleteProducts);
  }

  final LocalSource localSource;

  _deleteProducts(DeleteProducts event, Emitter<DatabaseState> emit) {
    emit(state.copyWith(status: DatabaseStatus.loading));
    localSource.removeAll();
    emit(state.copyWith(
        status: DatabaseStatus.success, products: state.products));
    add(GetProduct());
  }

  _addProduct(AddProduct event, Emitter<DatabaseState> emit) {
    emit(state.copyWith(status: DatabaseStatus.loading));

    final modifiers = _createModifiers(event.modifier, event.product.parentId);
    final combos = _createCombos(event.combo);

    final product = Products(
      id: event.product.id,
      image: event.product.image,
      name: _createNameTitle(event.product.title),
      price: event.product.outPrice.toDouble(),
      quantity: int.parse(event.product.count),
      modifiers: modifiers,
      uniqueId: event.product.id,
      combos: combos,
      type: '',
    );

    try {
      localSource.insertProduct(product);
      emit(state.copyWith(status: DatabaseStatus.success));
    } catch (e) {
      emit(state.copyWith(status: DatabaseStatus.error));
    }

    add(GetProduct());
  }

  _getProduct(GetProduct event, Emitter<DatabaseState> emit) async {
    emit(state.copyWith(status: DatabaseStatus.loading));
    final result = await localSource.products();
    emit(state.copyWith(products: result, status: DatabaseStatus.success));
  }

  _updateProduct(UpdateProduct event, Emitter<DatabaseState> emit) {
    emit(state.copyWith(status: DatabaseStatus.loading));
    localSource.updateQuantity(
        product: event.product,
        isMinus: event.isMinus ?? false,
        isDelete: event.isDelete ?? false);
    if (event.isDelete != null) {
      add(GetProduct());
    } else {
      emit(state.copyWith(status: DatabaseStatus.success));
    }
  }
}

List<Modifiers> _createModifiers(
    List<Modifier> modifierGroups, String parentId) {
  final modifiers = <Modifiers>[];

  for (var group in modifierGroups) {
    for (var variant in group.variants) {
      if (int.parse(variant.count) > 0) {
        modifiers.add(Modifiers(
          modifierName: _createNameTitle(variant.title),
          modifierId: variant.id,
          modifierQuantity: int.parse(variant.count),
          modifiersPrice: variant.outPrice,
          parentId: parentId,
        ));
      }
    }
  }
  return modifiers;
}

List<ComboHive> _createCombos(List<Combo> comboGroups) {
  final combos = <ComboHive>[];

  for (var group in comboGroups) {
    for (var variant in group.variants) {
      combos.add(ComboHive(
        groupId: variant.id,
        variantId: variant.id,
        variantName: _createNameTitle(variant.title),
        quantity: int.parse(variant.count),
      ));
    }
  }

  return combos;
}

NameTitle _createNameTitle(Translations title) {
  return NameTitle(
    uz: title.uz,
    ru: title.ru,
    en: title.en,
  );
}
