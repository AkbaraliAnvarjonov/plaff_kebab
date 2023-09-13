import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:plaff_kebab/src/config/router/app_routes.dart';
import 'package:plaff_kebab/src/core/constants/constants.dart';
import 'package:plaff_kebab/src/core/either_dart/either.dart';
import 'package:plaff_kebab/src/core/platform/network_info.dart';
import 'package:plaff_kebab/src/data/models/adress/adress_model.dart';
import 'package:plaff_kebab/src/domain/network/failure.dart';
import 'package:plaff_kebab/src/domain/network/server_error.dart';
import 'package:plaff_kebab/src/domain/repositories/adress/adress_repository.dart';

final class AdressRepositoryImpl extends AdressRepository {
  const AdressRepositoryImpl({
    required this.networkInfo,
    required this.dio,
  }) : super();
  final Dio dio;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, List<CustomerAddress>>> getAdresses() async {
    if (await networkInfo.isConnected) {
      try {
        final Response response =
            await dio.get(Constants.baseUrl + Urls.customerAddress,
                queryParameters: {
                  "customer_id ": localSource.userId,
                },
                options: Options(headers: {
                  "Authorization": localSource.accessToken,
                }));
        return Right(response.data["customer_addresses"]
            .map<CustomerAddress>((json) => CustomerAddress.fromJson(json))
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
  Future<Either<Failure, Position>> getCurrentLocation() async {
    if (await networkInfo.isConnected) {
      try {
        bool serviceEnabled;
        LocationPermission permission;

        serviceEnabled = await Geolocator.isLocationServiceEnabled();
        if (!serviceEnabled) {
          return Future.error('Location services are disabled.');
        }

        permission = await Geolocator.checkPermission();
        if (permission == LocationPermission.denied) {
          permission = await Geolocator.requestPermission();
          if (permission == LocationPermission.denied) {
            return Future.error('Location permissions are denied');
          }
        }

        if (permission == LocationPermission.deniedForever) {
          return Future.error(
              'Location permissions are permanently denied, we cannot request permissions.');
        }

        return Right(await Geolocator.getCurrentPosition());
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
  Future<Either<Failure, Position>> getLocationTitle() async {
    if (await networkInfo.isConnected) {
      try {
        final Response response =
            await dio.get(Constants.baseUrl + Urls.customerAddress,
                queryParameters: {
                  "customer_id ": localSource.userId,
                },
                options: Options(headers: {
                  "Authorization": localSource.accessToken,
                }));
        return Right(response.data["customer_addresses"]
            .map<CustomerAddress>((json) => CustomerAddress.fromJson(json))
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
  Future<Either<Failure, String>> postAdress(CustomerAddress address) async {
    if (await networkInfo.isConnected) {
      try {
        await dio.post(Constants.baseUrl + Urls.customerAddress,
            data: address.toJson(),
            options: Options(headers: {
              "Authorization": localSource.accessToken,
            }));
        return const Right("Succes");
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
