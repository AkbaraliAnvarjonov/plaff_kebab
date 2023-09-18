import 'package:chuck_interceptor/chuck.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plaff_kebab/src/data/models/screen_args/product_page_args.dart';
import 'package:plaff_kebab/src/data/source/hive/product.dart';
import 'package:plaff_kebab/src/data/source/local_source.dart';
import 'package:plaff_kebab/src/injector_container.dart';
import 'package:plaff_kebab/src/presentation/bloc/auth/auth_bloc.dart';
import 'package:plaff_kebab/src/presentation/bloc/auth/confirm/confirm_code_bloc.dart';
import 'package:plaff_kebab/src/presentation/bloc/auth/register/register_bloc.dart';
import 'package:plaff_kebab/src/presentation/bloc/home/home_bloc.dart';
import 'package:plaff_kebab/src/presentation/bloc/splash/splash_bloc.dart';
import 'package:plaff_kebab/src/presentation/pages/auth/auth_page.dart';
import 'package:plaff_kebab/src/presentation/pages/auth/confirm/confirm_code_page.dart';
import 'package:plaff_kebab/src/presentation/pages/auth/register/register_page.dart';
import 'package:plaff_kebab/src/presentation/pages/error/error_page.dart';
import 'package:plaff_kebab/src/presentation/pages/internet_connection/internet_connection_page.dart';
import 'package:plaff_kebab/src/presentation/pages/language/language_page.dart';
import 'package:plaff_kebab/src/presentation/pages/main/cart/checkout/checkout_page.dart';
import 'package:plaff_kebab/src/presentation/pages/main/favorites/bookmark_page.dart';
import 'package:plaff_kebab/src/presentation/pages/main/home/map/map_page.dart';
import 'package:plaff_kebab/src/presentation/pages/main/main_page.dart';
import 'package:plaff_kebab/src/presentation/pages/main/home/product/product_page.dart';
import 'package:plaff_kebab/src/presentation/pages/main/profile/settings/settings_page.dart';
import 'package:plaff_kebab/src/presentation/pages/splash/splash_page.dart';

part 'name_routes.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

final localSource = sl<LocalSource>();

final Chuck chuck = Chuck(navigatorKey: rootNavigatorKey);

sealed class AppRoutes {
  AppRoutes._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    if (kDebugMode) {
      print('route : ${settings.name}');
    }
    switch (settings.name) {
      case Routes.initial:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => sl<SplashBloc>(),
            child: const SplashPage(),
          ),
        );
      case Routes.main:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => sl<HomeBloc>()),
            ],
            child: const MainPage(),
          ),
        );
      case Routes.settings:
        return MaterialPageRoute(builder: (_) => const SettingsPage());
      case Routes.internetConnection:
        return MaterialPageRoute(
          builder: (_) => const InternetConnectionPage(),
        );
      case Routes.auth:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => sl<AuthBloc>(),
            child: const AuthPage(),
          ),
        );
      case Routes.confirmCode:
        final AuthSuccessState state = settings.arguments as AuthSuccessState;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => sl<ConfirmCodeBloc>(),
            child: ConfirmCodePage(
              state: state,
            ),
          ),
        );
      case Routes.register:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => sl<RegisterBloc>(),
            child: RegisterPage(
              phoneNumber: settings.arguments as String,
            ),
          ),
        );
      case Routes.language:
        return MaterialPageRoute(builder: (_) => const LanguagePage());
      case Routes.map:
        return MaterialPageRoute(builder: (_) => const MapPage());
      case Routes.favourites:
        return MaterialPageRoute(builder: (_) => const FavoritesPage());
      case Routes.checkout:
        return MaterialPageRoute(
          builder: (_) => CheckoutPage(
            products: settings.arguments as List<Products>,
          ),
        );
      case Routes.product:
        return MaterialPageRoute(
          builder: (_) {
            ProductArgs productArgs = settings.arguments as ProductArgs;
            return ProductPage(
              description: productArgs.description,
              image: productArgs.image,
              title: productArgs.title,
            );
          },
        );

      default:
        return MaterialPageRoute(builder: (_) => ErrorPage(settings: settings));
    }
  }

  static Route<dynamic>? onUnknownRoute(RouteSettings settings) {
    if (kDebugMode) {
      print('Navigate to: $settings');
    }
    return MaterialPageRoute(
      builder: (_) => ErrorPage(
        settings: settings,
      ),
    );
  }
}

class FadePageRoute<T> extends PageRouteBuilder<T> {
  FadePageRoute({required this.builder})
      : super(
          pageBuilder: (
            context,
            animation,
            secondaryAnimation,
          ) =>
              builder(context),
          transitionsBuilder: (
            context,
            animation,
            secondaryAnimation,
            child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
  final WidgetBuilder builder;

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 1000);
}
