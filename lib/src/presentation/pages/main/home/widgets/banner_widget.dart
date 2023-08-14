import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:plaff_kebab/src/core/extension/extension.dart';
import 'package:plaff_kebab/src/core/utils/utils.dart';

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
            child: CarouselSlider(
              items: [
                "https://picsum.photos/200/300",
                "https://picsum.photos/200/300",
              ].map((imageUrl) {
                return Builder(
                  builder: (BuildContext context) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: ClipRRect(
                        borderRadius: AppUtils.kBorderRadius16,
                        child: Image.network(
                          imageUrl,
                          fit: BoxFit.fill,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
              options: CarouselOptions(
                enableInfiniteScroll: false,
                onPageChanged: ((index, reason) {}),
                height: 160,
                aspectRatio: 16 / 9,
                viewportFraction: 0.92,
                enlargeCenterPage: true,
                autoPlay: false,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
