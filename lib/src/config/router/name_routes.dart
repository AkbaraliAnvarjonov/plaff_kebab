part of 'app_routes.dart';

sealed class Routes {
  Routes._();

  static const String initial = '/';
  static const String main = '/main';
  static const String internetConnection = '/internet_connection';
  static const String settings = '/settings';
  static const String auth = '/auth';
  static const String confirmCode = '/confirm_code';
  static const String register = '/register';
  static const String language = '/language';
  static const String product = '/product';
  static const String map = '/map';
  static const String favourites = '/favourites';
  static const String checkout = '/checkout';
  static const String about = '/about';
}
