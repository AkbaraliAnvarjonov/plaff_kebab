import 'package:plaff_kebab/src/config/router/app_routes.dart';

mixin CacheMixin {
  Future<void> setUserInfo({
    required String name,
    required String id,
    required String phoneNumber,
    required String accessToken,
    required String refreshToken,
  }) async {
    await localSource.setUser(
      name: name,
      userId: id,
      phone: phoneNumber,
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
  }
}
