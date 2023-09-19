import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:plaff_kebab/src/config/router/app_routes.dart';
import 'package:plaff_kebab/src/core/constants/constants.dart';
import 'package:plaff_kebab/src/core/either_dart/either.dart';
import 'package:plaff_kebab/src/core/platform/network_info.dart';
import 'package:plaff_kebab/src/data/models/product/history_order/history_order.dart';
import 'package:plaff_kebab/src/domain/network/failure.dart';
import 'package:plaff_kebab/src/domain/network/server_error.dart';
import 'package:plaff_kebab/src/domain/repositories/order/order_repository.dart';

class OrderRepositoryImpl implements OrderRepository {
  const OrderRepositoryImpl({
    required this.networkInfo,
    required this.dio,
  }) : super();
  final Dio dio;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, List<Orders>>> getProductwithId() async {
    if (await networkInfo.isConnected) {
      try {
        final result = await dio.get(
          Constants.baseUrl + Urls.order,
          options: Options(
            headers: {
              "Authorization": localSource.accessToken,
            },
          ),
        );
        return Right(result.data['orders']
            .map<Orders>((json) => Orders.fromJson(json))
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
