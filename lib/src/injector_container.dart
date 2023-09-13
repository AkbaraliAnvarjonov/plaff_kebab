import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_retry_plus/dio_retry_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:plaff_kebab/src/config/router/app_routes.dart';
import 'package:plaff_kebab/src/data/source/local_source.dart';
import 'package:plaff_kebab/src/domain/repositories/adress/adress_repository.dart';
import 'package:plaff_kebab/src/domain/repositories/adress/adress_repository_impl.dart';
import 'package:plaff_kebab/src/domain/repositories/auth/auth_repository.dart';
import 'package:plaff_kebab/src/domain/repositories/banner/banner_repository.dart';
import 'package:plaff_kebab/src/domain/repositories/banner/banner_repository_impl.dart';
import 'package:plaff_kebab/src/domain/repositories/category/category_repository.dart';
import 'package:plaff_kebab/src/domain/repositories/category/category_repository_impl.dart';
import 'package:plaff_kebab/src/domain/repositories/product/product_repository.dart';
import 'package:plaff_kebab/src/domain/repositories/product/product_repository_impl.dart';
import 'package:plaff_kebab/src/domain/repositories/register/register_repository.dart';
import 'package:plaff_kebab/src/presentation/bloc/auth/auth_bloc.dart';
import 'package:plaff_kebab/src/presentation/bloc/auth/register/register_bloc.dart';
import 'package:plaff_kebab/src/presentation/bloc/banner/banner_bloc.dart';
import 'package:plaff_kebab/src/presentation/bloc/database/database_bloc.dart';
import 'package:plaff_kebab/src/presentation/bloc/home/home_bloc.dart';
import 'package:plaff_kebab/src/presentation/bloc/map/map_bloc.dart';
import 'package:plaff_kebab/src/presentation/bloc/user_adresses/user_adresses_bloc.dart';
import 'package:plaff_kebab/src/presentation/bloc/main/main_bloc.dart';
import 'package:plaff_kebab/src/presentation/bloc/product/product_bloc.dart';
import 'package:plaff_kebab/src/presentation/bloc/splash/splash_bloc.dart';

import 'core/constants/app_keys.dart';
import 'core/constants/constants.dart';
import 'core/platform/network_info.dart';
import 'data/source/hive/product.dart';
import 'presentation/bloc/auth/confirm/confirm_code_bloc.dart';

final sl = GetIt.instance;
late Box<dynamic> _box;
late Box<Products> _boxProduct;

Future<void> init() async {
  /// External
  await initHive();

  sl.registerLazySingleton(
    () => Dio()
      ..options = BaseOptions(
        contentType: 'application/json',
        sendTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        connectTimeout: const Duration(seconds: 30),
        headers: {
          "accept": "application/json",
          "Shipper": Constants.shipperId,
          "Platform": Constants.platformId,
        },
      )
      ..interceptors.addAll(
        [
          LogInterceptor(
            requestBody: kDebugMode,
            responseBody: kDebugMode,
            logPrint: (object) =>
                kDebugMode ? log('Dio Log: ${object.toString()}') : null,
          ),
          if (kDebugMode) chuck.getDioInterceptor(),
        ],
      ),
  );
  sl<Dio>().interceptors.add(
        RetryInterceptor(
          dio: sl<Dio>(),
          toNoInternetPageNavigator: () async => Navigator.pushNamed(
            rootNavigatorKey.currentContext!,
            Routes.internetConnection,
          ),
          accessTokenGetter: () => localSource.accessToken,
          refreshTokenFunction: () async {
            await localSource.userClear();
            await Navigator.pushNamedAndRemoveUntil(
              rootNavigatorKey.currentContext!,
              Routes.initial,
              (route) => false,
            );
          },
        ),
      );

  sl
    ..registerLazySingleton(InternetConnectionChecker.new)
    ..registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()))
    ..registerSingleton<LocalSource>(LocalSource(_box, _boxProduct));

  /// main
  mainFeature();
  homeFeature();

  /// auth
  authFeature();
  registerFeature();

  //adress
  adressFeature();
  mapFeature();

  //banenr
  bannerFeature();

  //product
  productFeature();

  //database
  databaseFeature();
}

void mainFeature() {
  /// splash
  sl
    ..registerFactory(SplashBloc.new)
    ..registerLazySingleton(MainBloc.new);
}

void homeFeature() {
  sl
    ..registerFactory<HomeBloc>(() => HomeBloc(sl(), sl()))
    ..registerLazySingleton<CategoryRepository>(
      () => CategoryRepositoryImpl(
        dio: sl(),
        networkInfo: sl(),
      ),
    );
}

void registerFeature() {
  sl
    ..registerFactory<RegisterBloc>(() => RegisterBloc(sl(), sl()))
    ..registerLazySingleton<RegisterUserRepository>(
      () => RegisterUserRepositoryImpl(
        dio: sl(),
        networkInfo: sl(),
      ),
    );
}

void mapFeature() {
  sl.registerFactory<MapBloc>(() => MapBloc(sl()));
}

void databaseFeature() {
  sl.registerFactory<DatabaseBloc>(() => DatabaseBloc(sl()));
}

void authFeature() {
  sl
    ..registerFactory<AuthBloc>(() => AuthBloc(sl()))
    ..registerFactory<ConfirmCodeBloc>(() => ConfirmCodeBloc(sl()))
    ..registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(
        dio: sl(),
        networkInfo: sl(),
      ),
    );
}

void adressFeature() {
  sl
    ..registerFactory<UserAdressesBloc>(() => UserAdressesBloc(sl()))
    ..registerLazySingleton<AdressRepository>(
      () => AdressRepositoryImpl(
        dio: sl(),
        networkInfo: sl(),
      ),
    );
}

void productFeature() {
  sl
    ..registerFactory<ProductBloc>(() => ProductBloc(sl()))
    ..registerLazySingleton<ProductRepository>(
      () => ProductRepositoryImpl(
        dio: sl(),
        networkInfo: sl(),
      ),
    );
}

void bannerFeature() {
  sl
    ..registerFactory<BannerBloc>(() => BannerBloc(sl()))
    ..registerLazySingleton<BannerRepository>(
      () => BannerRepositoryImpl(
        dio: sl(),
        networkInfo: sl(),
      ),
    );
}

Future<void> initHive() async {
  const boxName = 'plaff_kebab';
  final Directory directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(ProductAdapter());
  Hive.registerAdapter(ModifierAdapter());
  Hive.registerAdapter(ComboAdapter());
  Hive.registerAdapter(NameTitleAdapter());
  _box = await Hive.openBox<dynamic>(boxName);
  _boxProduct = await Hive.openBox<Products>(AppKeys.localSource);
}
