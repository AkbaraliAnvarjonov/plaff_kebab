import 'package:flutter/material.dart';

sealed class Constants {
  Constants._();

  /// test
  static const baseUrl = 'https://test.customer.api.delever.uz/';
  static const authUrl = 'https://api.auth.u-code.io';

  /// id

  static const String shipperId = 'd4b1658f-3271-4973-8591-98a82939a664';
  static const String platformId = '6bd7c2e3-d35e-47df-93ce-ed54ed53f95f';
  static const String imageUrl = 'https://test.cdn.delever.uz/delever/';
  static const String projectId = 'a4dc1f1c-d20f-4c1a-abf5-b819076604bc';
  static const String environmentId = 'dcd76a3d-c71b-4998-9e5c-ab1e783264d0';
  static const String resourceId = 'a97e8954-5d8e-4469-a241-9a9af2ea2978';
  static const String apiKey = 'P-JV2nVIRUtgyPO5xRNeYll2mT4F5QG4bS';

  static const String clientTypeId = '24fd6d7e-c0e7-4029-88cc-2595e9c643d5';
  static const String companyId = '696c77b5-0ebd-4277-a278-a7343421a32a';
  static const String expiresAt = '2025-06-23T06:00:10.049Z';
  static const String roledId = '425486de-89dc-48a7-9fa8-47f7b4eeffcb';

  // yandex

  static const yandexApiKey = 'd9b0f53f-48f0-4fe4-a270-b9f953109f85';
  static const yandexApiKey1 = 'fd8dd043-5ad9-472e-89ef-46290ec8442c';
  static const yandexApiKey2 = '404852a9-99e2-460d-a85c-8ffd8a1c773a';
  static const yandexApiKey3 = '402a7d79-b669-44ff-ad64-160e14581e9a';

  static const yandexUrl = 'https://geocode-maps.yandex.ru/1.x/';

  static GlobalKey<FormState> bottomNavigatorKey = GlobalKey<FormState>();
}

sealed class Urls {
  Urls._();

  static const String register = '/v2/register';
  static const String sendMessage = '/v2/send-message';
  static const String verifyEmail = '/v2/verify-email';
  static const String getCategoryWithProducts = 'v2/category-with-products';
  static const String getProductWithId = 'v2/product/';
  static const String searchProduct = 'v2/product';
  static const String modifier = 'v2/modifier';
  static const String combo = 'v2/combo/';
  static const String getBanners = 'v1/banner';
  static const String customers = 'v1/customers';
  static const String customerAddress = 'v1/customer_address';
  static const String computePrice = 'v1/fares/compute-price';
  static const String nearestBranch = 'v1/nearest-branch';
  static const String onDemandOrder = 'v2/ondemand-order';
}

// Sentinel value for the system text scale factor option.
const double systemTextScaleFactorOption = -1;

// The splash page animation duration.
const Duration splashPageAnimationDuration = Duration(milliseconds: 1000);

// The animation display duration.
const Duration animationDuration = Duration(milliseconds: 250);
