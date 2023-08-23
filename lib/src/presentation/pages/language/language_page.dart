import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:plaff_kebab/src/app_options.dart';
import 'package:plaff_kebab/src/core/extension/extension.dart';
import 'package:plaff_kebab/src/core/utils/utils.dart';
import 'package:plaff_kebab/src/presentation/pages/language/widgets/language_widget.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    final options = AppOptions.of(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: context.color.cardColor,
        body: SafeArea(
            child: CustomScrollView(
          physics: const NeverScrollableScrollPhysics(),
          slivers: [
            const SliverGap(108),
            SliverPadding(
                padding: AppUtils.kPaddingHorizontal16,
                sliver: SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        AppImages.appLogo,
                        height: 132,
                        width: 148,
                      ),
                      const Gap(48),
                      Text("${context.tr("language")}:",
                          style: context.textStyle.subheadline),
                      LanguageWidget(
                        options: options,
                        language: "O'zbekcha",
                        asset: AppImages.uzbFlag,
                        lang: 'uz',
                      ),
                      LanguageWidget(
                        language: "English",
                        asset: AppImages.engFlag,
                        lang: 'en',
                        options: options,
                      ),
                      LanguageWidget(
                        language: "Русский",
                        asset: AppImages.rusFlag,
                        options: options,
                        lang: 'ru',
                      ),
                    ],
                  ),
                ))
          ],
        )),
      ),
    );
  }
}
