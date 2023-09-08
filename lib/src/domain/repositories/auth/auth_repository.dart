import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:plaff_kebab/src/core/constants/constants.dart';
import 'package:plaff_kebab/src/core/either_dart/either.dart';
import 'package:plaff_kebab/src/core/platform/network_info.dart';
import 'package:plaff_kebab/src/data/models/auth/register/user_data_model.dart';
import 'package:plaff_kebab/src/data/models/auth/send_message_request.dart';
import 'package:plaff_kebab/src/data/models/auth/send_message_response.dart';
import 'package:plaff_kebab/src/data/models/auth/user_model.dart';
import 'package:plaff_kebab/src/data/models/auth/verify_request.dart';
import 'package:plaff_kebab/src/domain/network/failure.dart';
import 'package:plaff_kebab/src/domain/network/server_error.dart';

part 'auth_repository_impl.dart';

abstract class AuthRepository {
  const AuthRepository();

  Future<Either<Failure, UserModel>> phoneNumber({
    required String phoneNumber,
  });
  Future<Either<Failure, String>> codeSend({
    required String phoneNumber,
  });

  Future<Either<Failure, SendMessageResponse>> codeMessage({
    required SendMessageRequest request,
  });

  Future<Either<Failure, UserData>> verifySmsCode({
    required VerifyRequest request,
    required String smsId,
    required String otp,
  });
}
