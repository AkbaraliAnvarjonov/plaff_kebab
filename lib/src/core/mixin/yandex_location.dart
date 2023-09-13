import 'package:dio/dio.dart';
import 'package:plaff_kebab/src/config/router/app_routes.dart';
import 'package:plaff_kebab/src/core/constants/constants.dart';
import 'package:plaff_kebab/src/data/models/geocoding/geocoding.dart';

mixin YandexLocation {
  Dio dio = Dio();

  Future<String> getLocationName({required String geoCodeText}) async {
    try {
      late Response response;
      Map<String, String> queryParams = {
        'apikey': localSource.getYandexKey(),
        'geocode': geoCodeText,
        'lang': 'uz_UZ',
        'format': 'json',
        'kind': "house",
        'rspn': '1',
        'results': '1',
      };
      response = await dio.get(
        Constants.yandexUrl,
        queryParameters: queryParams,
      );

      if (response.statusCode == 200) {
        if (localSource.getYandexKey() != Constants.yandexApiKey) {
          await localSource.setYandexKey(Constants.yandexApiKey);
        }
        Geocoding geocoding = Geocoding.fromJson(response.data);
        return geocoding.response.geoObjectCollection.featureMember[0].geoObject
            .metaDataProperty.geocoderMetaData.text;
      } else if (response.statusCode == 403) {
        if (localSource.getYandexKey() == Constants.yandexApiKey) {
          await localSource.setYandexKey(Constants.yandexApiKey1);
        } else if (localSource.getYandexKey() == Constants.yandexApiKey1) {
          await localSource.setYandexKey(Constants.yandexApiKey2);
        } else if (localSource.getYandexKey() == Constants.yandexApiKey2) {
          await localSource.setYandexKey(Constants.yandexApiKey3);
        } else {
          await localSource.setYandexKey(Constants.yandexApiKey);
          return "No data";
        }
        return getLocationName(geoCodeText: geoCodeText);
      } else {
        return "No data";
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
