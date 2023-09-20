import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
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
                if (state.status.isSuccess) {
                  return Column(
                    children: [
                      CarouselSlider(
                        items: state.bannerList.map((bannerModel) {
                          return SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding: AppUtils.kPaddingHorizontal4,
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
                            ),
                          );
                        }).toList(),
                        options: CarouselOptions(
                          scrollPhysics: const ClampingScrollPhysics(),
                          enableInfiniteScroll: false,
                          onPageChanged: ((index, reason) {
                            BlocProvider.of<BannerBloc>(context)
                                .add(BannerIndex(index: index));
                          }),
                          enlargeStrategy: CenterPageEnlargeStrategy.height,
                          height: 160.h,
                          aspectRatio: 16 / 9,
                          viewportFraction: 0.94,
                          enlargeCenterPage: true,
                          autoPlay: false,
                        ),
                      ),
                      const Gap(4),
                      SizedBox(
                        height: 12,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: state.bannerList.length,
                          itemBuilder: (context, index) =>
                              BlocSelector<BannerBloc, BannerState, int>(
                                  selector: (state) => state.index,
                                  builder: (context, state) {
                                    return AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      margin: AppUtils.kPaddingAll4,
                                      height: 4,
                                      width: state == index ? 16 : 8,
                                      decoration: BoxDecoration(
                                          color: state == index
                                              ? context.theme.primaryColor
                                              : context.colorScheme.onSurface,
                                          borderRadius:
                                              BorderRadius.circular(55)),
                                    );
                                  }),
                        ),
                      ),
                    ],
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
