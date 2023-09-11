import 'dart:developer';

import 'package:dio/dio.dart';
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
}
