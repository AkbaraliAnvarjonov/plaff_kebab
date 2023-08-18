import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plaff_kebab/src/core/constants/constants.dart';
import 'package:plaff_kebab/src/core/extension/extension.dart';
import 'package:plaff_kebab/src/core/utils/utils.dart';

class SliverAppBarWidget extends StatelessWidget {
  const SliverAppBarWidget({
    super.key,
    required this.image,
  });
  final String image;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      actions: [
        Padding(
          padding: AppUtils.kPaddingAll8,
          child: CircleAvatar(
            backgroundColor: context.color.cardColor.withOpacity(0.8),
            radius: 18,
            child: IconButton(
              icon:
                  SvgPicture.asset(AppIcons.share_icon, width: 24, height: 24),
              onPressed: () {},
            ),
          ),
        ),
      ],
      leading: Padding(
        padding: AppUtils.kPaddingAll8,
        child: CircleAvatar(
          backgroundColor: context.color.cardColor.withOpacity(0.8),
          radius: 18,
          child: IconButton(
            icon: SvgPicture.asset(AppIcons.back_row, width: 24, height: 24),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      expandedHeight: 206,
      flexibleSpace: CachedNetworkImage(
        imageUrl: Constants.imageUrl + image,
        errorWidget: (context, url, error) => SizedBox(
          child: SvgPicture.asset(
            AppIcons.dish,
            height: 30,
            width: 45,
          ),
        ),
        placeholder: (context, url) => SizedBox(
          child: SvgPicture.asset(
            AppIcons.dish,
            height: 30,
            width: 45,
          ),
        ),
        fit: BoxFit.cover,
        width: double.infinity,
        height: 240,
      ),
    );
  }
}
