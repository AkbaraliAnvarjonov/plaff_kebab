part of 'auth_repository.dart';

final class AuthRepositoryImpl extends AuthRepository {
  const AuthRepositoryImpl({
    required this.networkInfo,
    required this.dio,
  }) : super();

  final Dio dio;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, SendMessageResponse>> codeMessage({
    required SendMessageRequest request,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final Response response = await dio.post(
          Constants.authUrl + Urls.sendMessage,
          data: request.toJson(),
        );
        return Right(SendMessageResponse.fromJson(response.data));
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
  Future<Either<Failure, UserData>> verifySmsCode({
    required VerifyRequest request,
    required String smsId,
    required String otp,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final Response response = await dio.post(
          '${Constants.baseUrl}${Urls.customers}/confirm-login',
          data: {
            "code": otp,
            "fcm_token": request.data["fcm_token"],
            "phone": request.data["phone"],
          },
        );
        return Right(UserData.fromJson(response.data));
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
  Future<Either<Failure, UserModel>> phoneNumber(
      {required String phoneNumber}) async {
    if (await networkInfo.isConnected) {
      try {
        final Response response = await dio.post(
          '${Constants.baseUrl}${Urls.customers}/phone',
          data: {"phone": phoneNumber},
        );
        return Right(UserModel.fromJson(response.data));
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
  Future<Either<Failure, String>> codeSend(
      {required String phoneNumber}) async {
    if (await networkInfo.isConnected) {
      try {
        final Response response = await dio.post(
          '${Constants.baseUrl}${Urls.customers}/login',
          data: {"phone": phoneNumber, "tag": "KOMoxhlmwe/"},
        );
        return Right(response.data["message"] as String);
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
