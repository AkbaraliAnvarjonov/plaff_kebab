import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:plaff_kebab/src/core/constants/constants.dart';
import 'package:plaff_kebab/src/core/either_dart/either.dart';
import 'package:plaff_kebab/src/core/platform/network_info.dart';
import 'package:plaff_kebab/src/data/models/product/combo/combo_model.dart';
import 'package:plaff_kebab/src/data/models/product/modifier/modifier.dart';
import 'package:plaff_kebab/src/data/models/product/product_model.dart';
import 'package:plaff_kebab/src/data/models/product/search_product/search_product.dart';
import 'package:plaff_kebab/src/domain/network/failure.dart';
import 'package:plaff_kebab/src/domain/network/server_error.dart';
import 'package:plaff_kebab/src/domain/repositories/product/product_repository.dart';

final class ProductRepositoryImpl extends ProductRepository {
  const ProductRepositoryImpl({
    required this.networkInfo,
    required this.dio,
  }) : super();
  final Dio dio;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, ProductIdModel>> getProductwithId(
      {required String id}) async {
    if (await networkInfo.isConnected) {
      try {
        final Response response = await dio.get(
          Constants.baseUrl + Urls.getProductWithId + id,
        );

        return Right(ProductIdModel.fromJson(response.data));
      } on DioException catch (error, stacktrace) {
        log('Exception occurred: $error stacktrace: $stacktrace');
        return Left(
          ServerError.withDioError(error: error).failure,
        );
      } on Exception catch (error, stacktrace) {
        log('Exception occurred: $error stacktrace: $stacktrace');
        return Left(
          ServerError.withError(
            message: error.toString(),
          ).failure,
        );
      }
    } else {
      return const Left(ServerFailure(message: 'No Internet Connection'));
    }
  }

  @override
  Future<Either<Failure, List<SearchProduct>>> getSearchProduct(
      {required String search}) async {
    if (await networkInfo.isConnected) {
      try {
        final Response response = await dio.get(
            Constants.baseUrl + Urls.searchProduct,
            queryParameters: {"page": 1, "limit": 50, "search": search});
        return response.data["products"] == null
            ? const Right([])
            : Right(response.data["products"]
                .map<SearchProduct>(
                    (categoryJson) => SearchProduct.fromJson(categoryJson))
                .toList());
      } on DioException catch (error, stacktrace) {
        log('Exception occurred: $error stacktrace: $stacktrace');
        return Left(
          ServerError.withDioError(error: error).failure,
        );
      } on Exception catch (error, stacktrace) {
        log('Exception occurred: $error stacktrace: $stacktrace');
        return Left(
          ServerError.withError(
            message: error.toString(),
          ).failure,
        );
      }
    } else {
      return const Left(ServerFailure(message: 'No Internet Connection'));
    }
  }

  @override
  Future<Either<Failure, List<Modifier>>> getModifiers(
      {required String id}) async {
    if (await networkInfo.isConnected) {
      try {
        final Response response = await dio.get(
            Constants.baseUrl + Urls.modifier,
            queryParameters: {"page": 1, "limit": 50, "product_id": id});
        return response.data["product_modifiers"]["group_modifiers"] == null
            ? const Right([])
            : Right(response.data["product_modifiers"]["group_modifiers"]
                .map<Modifier>((json) => Modifier.fromJson(json))
                .toList());
      } on DioException catch (error, stacktrace) {
        log('Exception occurred: $error stacktrace: $stacktrace');
        return Left(
          ServerError.withDioError(error: error).failure,
        );
      } on Exception catch (error, stacktrace) {
        log('Exception occurred: $error stacktrace: $stacktrace');
        return Left(
          ServerError.withError(
            message: error.toString(),
          ).failure,
        );
      }
    } else {
      return const Left(ServerFailure(message: 'No Internet Connection'));
    }
  }

  @override
  Future<Either<Failure, List<Combo>>> getCombo({required String id}) async {
    if (await networkInfo.isConnected) {
      try {
        final Response response =
            await dio.get(Constants.baseUrl + Urls.combo + id);
        return response.data["groups"] == null
            ? const Right([])
            : Right(response.data["groups"]
                .map<Combo>((json) => Combo.fromJson(json))
                .toList());
      } on DioException catch (error, stacktrace) {
        log('Exception occurred: $error stacktrace: $stacktrace');
        return Left(
          ServerError.withDioError(error: error).failure,
        );
      } on Exception catch (error, stacktrace) {
        log('Exception occurred: $error stacktrace: $stacktrace');
        return Left(
          ServerError.withError(
            message: error.toString(),
          ).failure,
        );
      }
    } else {
      return const Left(ServerFailure(message: 'No Internet Connection'));
    }
  }
}
