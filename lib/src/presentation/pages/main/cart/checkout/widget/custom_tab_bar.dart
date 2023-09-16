import 'package:flutter/material.dart';
import 'package:plaff_kebab/src/core/extension/extension.dart';
import 'package:plaff_kebab/src/core/utils/utils.dart';

class CustomTabBar extends StatelessWidget {
  final TabController controller;
  final List<String> labels;
  final Function(int)? onTap;
  final EdgeInsets? padding;

  const CustomTabBar({
    Key? key,
    required this.controller,
    required this.labels,
    this.padding,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      margin: padding ??
          const EdgeInsets.only(left: 12, right: 12, bottom: 12, top: 10),
      decoration: BoxDecoration(
        borderRadius: AppUtils.kBorderRadius10,
        color: context.colorScheme.onSurface,
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.light().copyWith(
            surfaceVariant: Colors.transparent,
          ),
        ),
        child: TabBar(
          dividerColor: Colors.transparent,
          controller: controller,
          indicatorSize: TabBarIndicatorSize.tab,
          padding: AppUtils.kPaddingAll4,
          onTap: onTap,
          tabs: List.generate(
            labels.length,
            (index) => Tab(
              text: labels[index],
            ),
          ),
        ),
      ),
    );
  }
}
