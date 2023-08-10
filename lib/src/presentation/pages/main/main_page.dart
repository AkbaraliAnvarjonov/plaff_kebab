import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plaff_kebab/src/config/router/app_routes.dart';
import 'package:plaff_kebab/src/core/constants/constants.dart';
import 'package:plaff_kebab/src/core/extension/extension.dart';
import 'package:plaff_kebab/src/core/utils/utils.dart';
import 'package:plaff_kebab/src/presentation/bloc/main/home/home_bloc.dart';
import 'package:plaff_kebab/src/presentation/bloc/main/main_bloc.dart';
import 'package:plaff_kebab/src/presentation/components/fade_indexed_stack/animated_fade_indexed_stack.dart';

import 'favorites/bookmark_page.dart';
import 'home/home_page.dart';
import 'orders/orders_page.dart';
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
              key: Constants.bottomNavigatorKey,
              onTap: (i) {
                if (bottomMenu.index == 0 && i == 0) {
                  context.read<HomeBloc>().add(
                        const HomeScroll(isScrollingTop: true),
                      );
                  return;
                }
                if (i == 3 && !localSource.hasProfile) {
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
                  label: context.tr('search'),
                  icon: AppIcons.search,
                  activeIcon: AppIcons.search,
                ),
                _navigationBarItem(
                  label: context.tr('orders'),
                  icon: AppIcons.history,
                  activeIcon: AppIcons.history,
                ),
                _navigationBarItem(
                  label: context.tr('favorites'),
                  icon: AppIcons.favorite,
                  activeIcon: AppIcons.favorite_1,
                ),
                _navigationBarItem(
                  label: context.tr('profile'),
                  icon: AppIcons.profile,
                  activeIcon: AppIcons.active_profile,
                ),
              ],
            ),
          ),
        ),
      );

  BottomNavigationBarItem _navigationBarItem({
    required String label,
    required IconData icon,
    required IconData activeIcon,
  }) =>
      BottomNavigationBarItem(
        icon: Padding(
          padding: AppUtils.kPaddingBottom2,
          child: Icon(icon),
        ),
        activeIcon: Padding(
          padding: AppUtils.kPaddingBottom2,
          child: Icon(activeIcon),
        ),
        label: label,
        tooltip: label,
      );
}