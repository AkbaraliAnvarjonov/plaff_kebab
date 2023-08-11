import 'package:flutter/material.dart';
import 'package:plaff_kebab/src/app_options.dart';
import 'package:plaff_kebab/src/config/router/app_routes.dart';
import 'package:plaff_kebab/src/core/extension/extension.dart';
import 'package:plaff_kebab/src/core/utils/utils.dart';
import 'package:plaff_kebab/src/data/source/local_source.dart';
import 'package:plaff_kebab/src/injector_container.dart';

class LanguageWidget extends StatelessWidget {
  const LanguageWidget({
    super.key,
    required this.language,
    required this.asset,
    required this.options,
    required this.lang,
  });
  final String asset;
  final String language;
  final AppOptions options;
  final String lang;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: ListTile(
        shape: const RoundedRectangleBorder(
            borderRadius: AppUtils.kBorderRadius12 //<-- SEE HERE
            ),
        tileColor: context.color.listileColor,
        title: Text(
          language,
          style: ThemeTextStyles.light.regularSubheadline
              .copyWith(fontWeight: FontWeight.w600),
        ),
        leading: CircleAvatar(
          child: Image.asset(asset),
        ),
        onTap: () {
          AppOptions.update(
            context,
            options.copyWith(locale: Locale(lang)),
          );

          Navigator.pushReplacementNamed(
            context,
            Routes.main,
          );
          sl<LocalSource>().setLocale(lang);
          sl<LocalSource>().setLangSelected(value: true);
        },
      ),
    );
  }
}
