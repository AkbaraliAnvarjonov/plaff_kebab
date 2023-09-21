part of 'profile_repository.dart';

class ProfileRepsitoryImpl implements ProfileRepsotory {
  ProfileRepsitoryImpl({
    required this.dio,
    required this.networkInfo,
  });

  final Dio dio;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, List<Branch>>> getBranches() async {
    if (await networkInfo.isConnected) {
      try {
        final Response response = await dio.get(
          Constants.baseUrl + Urls.branches,
          queryParameters: {
            "page ": 1,
            "limit ": 100,
          },
          options: Options(
            headers: {
              "Authorization": localSource.accessToken,
              "Shipper": Constants.shipperId,
            },
          ),
        );
        return Right(response.data['branches']
            .map<Branch>((json) => Branch.fromJson(json))
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
