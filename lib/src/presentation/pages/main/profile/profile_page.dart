import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:plaff_kebab/src/config/router/app_routes.dart';
import 'package:plaff_kebab/src/core/extension/extension.dart';
import 'package:plaff_kebab/src/presentation/components/material_border/material_border_widget.dart';

import 'widgets/logout_dialog.dart';
import 'widgets/profile_item_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            context.tr('profile'),
            style: context.textStyle.appBarTitle,
          ),
          centerTitle: true,
        ),
        body: CustomScrollView(
          slivers: [
            const SliverGap(16),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  ListTile(
                      onTap: () {},
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      tileColor: context.color.cardColor,
                      trailing: SvgPicture.asset(
                        AppIcons.pen_icon,
                        width: 20,
                        height: 20,
                      ),
                      title: Text(
                        "Name",
                        style: context.textStyle.appBarTitle,
                      ),
                      subtitle: Text(
                        "+998900265088",
                        style: context.textStyle.regularSubheadline
                            .copyWith(color: context.color.black2),
                      ))
                ],
              ),
            ),
            const SliverGap(12),
            SliverToBoxAdapter(
              child: MaterialBorderWidget(
                child: Column(
                  children: [
                    ProfileItemWidget(
                      icon: SvgPicture.asset(
                        AppIcons.location_icon,
                        colorFilter: ColorFilter.mode(
                            context.color.iconColor, BlendMode.srcIn),
                      ),
                      text: context.tr('branches'),
                      onTap: () {},
                    ),
                    Divider(
                      height: 1,
                      color: context.color.black.withOpacity(0.1),
                    ),
                    ProfileItemWidget(
                      icon: SvgPicture.asset(
                        AppIcons.settings_icon,
                      ),
                      text: context.tr('settings'),
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          Routes.settings,
                        );
                      },
                    ),
                    Divider(
                      height: 1,
                      color: context.color.black.withOpacity(0.1),
                    ),
                    ProfileItemWidget(
                      icon: SvgPicture.asset(
                        AppIcons.loc_map_icon,
                      ),
                      text: context.tr('addresses'),
                      onTap: () {},
                    ),
                    ProfileItemWidget(
                      icon: SvgPicture.asset(
                        AppIcons.ui_icon,
                      ),
                      text: context.tr('about_us'),
                      onTap: () {},
                    ),
                    ProfileItemWidget(
                      icon: const Icon(
                        AppIcons.logout,
                        size: 20,
                      ),
                      text: context.tr('logout'),
                      onTap: () {
                        showDialog<void>(
                          context: context,
                          builder: (_) => const LogOutDialog(),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
}
