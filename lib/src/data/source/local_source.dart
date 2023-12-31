import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:plaff_kebab/src/core/constants/app_keys.dart';
import 'package:plaff_kebab/src/core/constants/constants.dart';
import 'package:plaff_kebab/src/core/utils/utils.dart';
import 'package:plaff_kebab/src/data/source/hive/product.dart';

final class LocalSource {
  LocalSource(this.box, this._hiveDb);

  final Box<dynamic> box;
  final Box<Products> _hiveDb;

  Future<void> updateQuantity({
    required isMinus,
    required isDelete,
    required Products product,
  }) async {
    if (isMinus) {
      if (product.quantity > 1) {
        product.quantity = product.quantity - 1;
        await updateProduct(product);
      } else if (isDelete) {
        await removeProduct(product.id);
      }
    } else {
      product.quantity = product.quantity + 1;
      await updateProduct(product);
    }
  }

  Future<List<Products>> products() async {
    return (_hiveDb.values).toList();
  }

  Future<void> insertProduct(Products product) async {
    String uniqueId = product.uniqueId;
    await _hiveDb.put(uniqueId, product);
  }

  Future<void> removeProduct(String id) async {
    await _hiveDb.delete(id);
  }

  Future<void> updateProduct(Products product) async {
    String uniqueId = product.uniqueId;
    await _hiveDb.put(uniqueId, product);
  }

  Future<void> removeAll() async {
    await _hiveDb.clear();
  }

  void setHasProfile({
    required bool value,
  }) {
    box.put(AppKeys.hasProfile, value);
  }

  bool get hasProfile =>
      box.get(AppKeys.hasProfile, defaultValue: false) as bool;

  Future<void> setUser({
    required String name,
    required String accessToken,
    required String refreshToken,
    required String userId,
    required String phone,
  }) async {
    await box.put(AppKeys.hasProfile, true);
    await box.put(AppKeys.phone, phone);
    await box.put(AppKeys.fullName, name);
    await box.put(AppKeys.accessToken, accessToken);
    await box.put(AppKeys.refreshToken, refreshToken);
    await box.put(AppKeys.userId, userId);
  }

  String get accessToken =>
      box.get(AppKeys.accessToken, defaultValue: '') as String;

  String get fullName => box.get(AppKeys.fullName, defaultValue: '') as String;

  String get phone => box.get(AppKeys.phone, defaultValue: '') as String;

  String get userId => box.get(AppKeys.userId, defaultValue: '') as String;

  String get locale => box.get(
        AppKeys.languageCode,
        defaultValue: defaultLocale,
      ) as String;

  bool get lanSelected =>
      box.get(AppKeys.langSelected, defaultValue: false) is bool
          ? box.get(AppKeys.langSelected, defaultValue: false) as bool
          : false;

  Future<void> setThemeMode(ThemeMode mode) async {
    await box.put(AppKeys.themeMode, mode.name);
  }

  Future<void> setYandexKey(String value) async {
    await box.put(AppKeys.yandex, value);
  }

  String getYandexKey() {
    return box.get(AppKeys.yandex, defaultValue: Constants.yandexApiKey);
  }

  Future<void> setLocale(String lang) async {
    await box.put(AppKeys.languageCode, lang);
  }

  Future<void> setKey(String key, String value) async {
    await box.put(key, value);
  }

  Future<void> setLangSelected({
    required bool value,
  }) async {
    await box.put(AppKeys.langSelected, value);
  }

  String getKey(String key) => box.get(key, defaultValue: '') as String;

  ThemeMode get themeMode => switch (box.get(AppKeys.themeMode)) {
        'system' => ThemeMode.system,
        'light' => ThemeMode.light,
        'dark' => ThemeMode.dark,
        _ => ThemeMode.light,
      };

  Future<void> clear() async {
    await box.clear();
  }

  Future<void> userClear() async {
    await box.delete(AppKeys.hasProfile);
    await box.delete(AppKeys.phone);
    await box.delete(AppKeys.email);
    await box.delete(AppKeys.fullName);
    await box.delete(AppKeys.accessToken);
    await box.delete(AppKeys.refreshToken);
    await box.delete(AppKeys.userId);
    await box.delete(AppKeys.imageUrl);
  }
}
