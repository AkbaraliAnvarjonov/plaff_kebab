import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:plaff_kebab/src/core/constants/constants.dart';
import 'package:plaff_kebab/src/core/extension/extension.dart';
import 'package:plaff_kebab/src/core/extension/language_extension.dart';
import 'package:plaff_kebab/src/core/utils/utils.dart';
import 'package:plaff_kebab/src/data/models/category/product_model.dart';

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppUtils.kPaddingVer16,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 150.w,
                height: 24.h,
                child: Text(
                  productModel.title.getLocalizedDescription(),
                  style: context.textStyle.regularSubheadline,
                ),
              ),
              SizedBox(
                width: 239.h,
                height: 38.h,
                child: Text(
                  productModel.description.getLocalizedDescription(),
                  style: context.textStyle.regularFootnote
                      .copyWith(color: context.color.black3),
                ),
              ),
              const Gap(8),
              Text(
                "${productModel.outPrice.moneyFormat} ${context.tr("sum")}",
                style: context.textStyle.regularSubheadline
                    .copyWith(fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const Gap(8),
          CachedNetworkImage(
            imageUrl: Constants.imageUrl + productModel.image,
            width: 88.h,
            height: 88.h,
            fit: BoxFit.cover,
            errorWidget: (context, url, error) => SvgPicture.asset(
              AppIcons.dish,
              height: 30,
              width: 45,
            ),
            placeholder: (context, url) => SvgPicture.asset(
              AppIcons.dish,
              height: 30,
              width: 45,
            ),
          )
        ],
      ),
    );
  }
}
