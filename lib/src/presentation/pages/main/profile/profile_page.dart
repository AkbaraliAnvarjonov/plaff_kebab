import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plaff_kebab/src/config/router/app_routes.dart';
import 'package:plaff_kebab/src/core/extension/extension.dart';
import 'package:plaff_kebab/src/core/utils/utils.dart';

import 'widgets/logout_dialog.dart';
import 'widgets/profile_item_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            context.tr('profile'),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            AppUtils.kGap12,
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
                localSource.fullName,
                style: context.textStyle.appBarTitle,
              ),
              subtitle: Text(
                localSource.phone,
                style: context.textStyle.regularSubheadline
                    .copyWith(color: context.color.black2),
              ),
            ),
            AppUtils.kGap12,
            ClipRRect(
              borderRadius: AppUtils.kBorderRadius12,
              child: Material(
                color: context.theme.cardColor,
                shape: const RoundedRectangleBorder(
                  borderRadius: AppUtils.kBorderRadius12,
                ),
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
                    Padding(
                      padding: AppUtils.kPaddingHorizontal16,
                      child: Divider(
                        height: 0.5,
                        color: context.color.black.withOpacity(0.1),
                      ),
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
                    Padding(
                      padding: AppUtils.kPaddingHorizontal16,
                      child: Divider(
                        height: 0.5,
                        color: context.color.black.withOpacity(0.1),
                      ),
                    ),
                    ProfileItemWidget(
                      icon: SvgPicture.asset(
                        AppIcons.loc_map_icon,
                      ),
                      text: context.tr('addresses'),
                      onTap: () {},
                    ),
                    Padding(
                      padding: AppUtils.kPaddingHorizontal16,
                      child: Divider(
                        height: 0.5,
                        color: context.color.black.withOpacity(0.1),
                      ),
                    ),
                    ProfileItemWidget(
                      icon: SvgPicture.asset(
                        AppIcons.ui_icon,
                      ),
                      text: context.tr('about_us'),
                      onTap: () {
                        Navigator.pushNamed(context, Routes.about);
                      },
                    ),
                    Padding(
                      padding: AppUtils.kPaddingHorizontal16,
                      child: Divider(
                        height: 0.5,
                        color: context.color.black.withOpacity(0.1),
                      ),
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
