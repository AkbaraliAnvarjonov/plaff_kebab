import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:plaff_kebab/src/core/constants/constants.dart';
import 'package:plaff_kebab/src/core/either_dart/either.dart';
import 'package:plaff_kebab/src/core/platform/network_info.dart';
import 'package:plaff_kebab/src/domain/network/failure.dart';
import 'package:plaff_kebab/src/domain/network/server_error.dart';

part 'register_repository_impl.dart';

abstract class RegisterUserRepository {
  Future<Either<Failure, String>> registerUser({
    required Map<String, dynamic> request,
  });
}
