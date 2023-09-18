import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:plaff_kebab/src/config/router/app_routes.dart';
import 'package:plaff_kebab/src/core/constants/constants.dart';
import 'package:plaff_kebab/src/core/either_dart/either.dart';
import 'package:plaff_kebab/src/core/platform/network_info.dart';
import 'package:plaff_kebab/src/data/models/on_demand/on_demand_model.dart';
import 'package:plaff_kebab/src/domain/network/failure.dart';
import 'package:plaff_kebab/src/domain/network/server_error.dart';
import 'package:plaff_kebab/src/domain/repositories/one_demand/on_demand_repository.dart';

class OnDemandRepositoryImpl implements OnDemandRepository {
  const OnDemandRepositoryImpl({
    required this.networkInfo,
    required this.dio,
  }) : super();
  final Dio dio;
  final NetworkInfo networkInfo;
  @override
  Future<Either<Failure, String>> onDemandOrder(
      OnDemandModel onDemandModel) async {
    if (await networkInfo.isConnected) {
      try {
        await dio.post(
          Constants.baseUrl + Urls.onDemandOrder,
          data: onDemandModel.toJson(),
          options: Options(
            headers: {
              "Authorization": localSource.accessToken,
            },
          ),
        );
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
