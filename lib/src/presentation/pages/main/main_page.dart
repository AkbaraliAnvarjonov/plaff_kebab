import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plaff_kebab/src/core/constants/constants.dart';
import 'package:plaff_kebab/src/core/extension/extension.dart';
import 'package:plaff_kebab/src/core/utils/utils.dart';
import 'package:plaff_kebab/src/presentation/bloc/home/home_bloc.dart';
import 'package:plaff_kebab/src/presentation/bloc/main/main_bloc.dart';
import 'package:plaff_kebab/src/presentation/components/fade_indexed_stack/animated_fade_indexed_stack.dart';
import 'package:plaff_kebab/src/config/router/app_routes.dart';

import 'my_orders/bookmark_page.dart';
import 'home/home_page.dart';
import 'cart/cart_page.dart';
import 'profile/profile_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocSelector<MainBloc, MainState, BottomMenu>(
        selector: (state) => state.bottomMenu,
        builder: (_, bottomMenu) => WillPopScope(
          onWillPop: () async {
            if (bottomMenu.index != 0) {
              context
                  .read<MainBloc>()
                  .add(MainEventChanged(BottomMenu.values[0]));
              return false;
            }
            return true;
          },
          child: AnnotatedRegion<SystemUiOverlayStyle>(
            value: const SystemUiOverlayStyle(
              systemNavigationBarColor: Colors.black,
              statusBarColor: Colors.white,
              statusBarBrightness: Brightness.light,
              statusBarIconBrightness: Brightness.dark,
            ),
            child: Scaffold(
              body: FadeIndexedStack(
                index: bottomMenu.index,
                children: const [
                  HomePage(),
                  OrdersPage(),
                  FavoritesPage(),
                  ProfilePage()
                ],
              ),
              bottomNavigationBar: BottomNavigationBar(
                elevation: 10,
                selectedItemColor: context.colorScheme.primary,
                unselectedItemColor: context.color.black5,
                key: Constants.bottomNavigatorKey,
                onTap: (i) {
                  if (bottomMenu.index == 0 && i == 0) {
                    context.read<HomeBloc>().add(
                          const HomeScroll(isScrollingTop: true),
                        );
                    return;
                  }
                  if ((i == 2 || i == 3) && !localSource.hasProfile) {
                    Navigator.pushNamed(context, Routes.auth);
                    return;
                  }
                  context
                      .read<MainBloc>()
                      .add(MainEventChanged(BottomMenu.values[i]));
                },
                currentIndex: bottomMenu.index,
                items: [
                  _navigationBarItem(
                    context: context,
                    label: context.tr('home'),
                    icon: AppIcons.home_icon,
                    activeIcon: AppIcons.home_icon,
                  ),
                  _navigationBarItem(
                    context: context,
                    label: context.tr('basket'),
                    icon: AppIcons.basket_icon,
                    activeIcon: AppIcons.basket_icon,
                  ),
                  _navigationBarItem(
                    context: context,
                    label: context.tr('orders'),
                    icon: AppIcons.order_icon,
                    activeIcon: AppIcons.order_icon,
                  ),
                  _navigationBarItem(
                    context: context,
                    label: context.tr('profile'),
                    icon: AppIcons.profile_icon,
                    activeIcon: AppIcons.profile_icon,
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  BottomNavigationBarItem _navigationBarItem(
          {required String label,
          required String icon,
          required String activeIcon,
          required BuildContext context}) =>
      BottomNavigationBarItem(
        icon: Padding(
          padding: AppUtils.kPaddingBottom2,
          child: SvgPicture.asset(icon),
        ),
        activeIcon: Padding(
          padding: AppUtils.kPaddingBottom2,
          child: SvgPicture.asset(
            activeIcon,
            colorFilter:
                ColorFilter.mode(context.colorScheme.primary, BlendMode.srcIn),
          ),
        ),
        label: label,
        tooltip: label,
      );
}
