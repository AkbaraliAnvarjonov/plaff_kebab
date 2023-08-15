import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plaff_kebab/src/core/extension/extension.dart';
import 'package:plaff_kebab/src/core/utils/utils.dart';
import 'package:plaff_kebab/src/presentation/bloc/banner/banner_bloc.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: AppUtils.kPaddingVer16,
        child: Material(
          color: context.color.cardColor,
          borderRadius: AppUtils.kBorderRadius12,
          child: Padding(
            padding: AppUtils.kPaddingBanner,
            child: BlocBuilder<BannerBloc, BannerState>(
              builder: (context, state) {
                if (state is GetBannerSuccesState) {
                  return CarouselSlider(
                    items: state.bannerList.map((bannerModel) {
                      return Builder(
                        builder: (BuildContext context) {
                          return SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: ClipRRect(
                              borderRadius: AppUtils.kBorderRadius16,
                              child: CachedNetworkImage(
                                imageUrl: bannerModel.image,
                                fit: BoxFit.cover,
                                placeholder: (context, url) => SizedBox(
                                  height: 160.h,
                                  child: Center(
                                    child: CircularProgressIndicator(
                                        color: context.colorScheme.primary),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                    options: CarouselOptions(
                      enableInfiniteScroll: false,
                      onPageChanged: ((index, reason) {}),
                      height: 160.h,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.92,
                      enlargeCenterPage: true,
                      autoPlay: false,
                    ),
                  );
                }
                return SizedBox(
                  height: 160.h,
                  child: Center(
                    child: CircularProgressIndicator(
                        color: context.colorScheme.primary),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
