part of 'register_repository.dart';

class RegisterUserRepositoryImpl implements RegisterUserRepository {
  RegisterUserRepositoryImpl({
    required this.dio,
    required this.networkInfo,
  });

  final Dio dio;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, String>> registerUser({
    required Map<String, dynamic> request,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final Response response = await dio.post(
          "${Constants.baseUrl}${Urls.customers}/register",
          data: request,
        );
        return Right(response.data["message"]);
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
