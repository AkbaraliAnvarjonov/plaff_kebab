import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:plaff_kebab/src/core/extension/extension.dart';
import 'package:plaff_kebab/src/core/utils/utils.dart';
import 'package:plaff_kebab/src/presentation/bloc/main/home/home_bloc.dart';
import 'package:plaff_kebab/src/presentation/components/cards/cards.dart';
import 'package:carousel_slider/carousel_slider.dart';

part 'mixin/home_mixin.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with TickerProviderStateMixin, HomeMixin {
  @override
  Widget build(BuildContext context) => BlocListener<HomeBloc, HomeState>(
        listenWhen: (previous, current) =>
            previous.isScrollingTop != current.isScrollingTop,
        listener: listener,
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark,
          ),
          child: Scaffold(
            backgroundColor: context.colorScheme.onSurface,
            body: CustomScrollView(
              controller: scrollController,
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              slivers: [
                SliverSafeArea(
                  sliver: SliverToBoxAdapter(
                    child: Material(
                      color: context.color.cardColor,
                      child: Column(
                        children: [
                          Padding(
                            padding: AppUtils.kPaddingHorizontal16,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 8, bottom: 12),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    AppIcons.location_icon,
                                    width: 20,
                                    height: 20,
                                  ),
                                  const Gap(6),
                                  Text(
                                    "Массив Бешягач 19/30",
                                    style: context.textStyle.regularSubheadline,
                                  ),
                                  const Gap(6),
                                  SvgPicture.asset(
                                    AppIcons.bottom_arrow,
                                    width: 20,
                                    height: 20,
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: AppUtils.kPaddingHorizontal16,
                            child: SearchBar(
                              shape: MaterialStateProperty.resolveWith<
                                  OutlinedBorder?>(
                                (Set<MaterialState> states) =>
                                    const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                ),
                              ),
                              elevation:
                                  MaterialStateProperty.resolveWith<double?>(
                                      (Set<MaterialState> states) => 0.5),
                              surfaceTintColor:
                                  MaterialStateProperty.resolveWith<Color?>(
                                      (Set<MaterialState> states) =>
                                          context.colorScheme.onSurface),
                              leading: Padding(
                                  padding: AppUtils.kPaddingSearch,
                                  child: SvgPicture.asset(
                                    AppIcons.search_icon,
                                    width: 20,
                                    height: 20,
                                  )),
                              overlayColor:
                                  MaterialStateProperty.resolveWith<Color?>(
                                      (Set<MaterialState> states) =>
                                          context.colorScheme.onSurface),
                              backgroundColor:
                                  MaterialStateProperty.resolveWith<Color?>(
                                      (Set<MaterialState> states) =>
                                          context.colorScheme.onSurface),
                              hintText: context.tr("search"),
                              hintStyle:
                                  MaterialStateProperty.resolveWith<TextStyle?>(
                                      (Set<MaterialState> states) => context
                                          .textStyle.regularSubheadline
                                          .copyWith(
                                              color: context.color.black5)),
                              textStyle:
                                  MaterialStateProperty.resolveWith<TextStyle?>(
                                      (Set<MaterialState> states) =>
                                          context.textStyle.regularSubheadline),
                            ),
                          ),
                          SizedBox(
                            height: 72,
                            child: ListView.separated(
                              itemCount: 8,
                              padding: AppUtils.kPaddingAll16,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => Cards(
                                color: context.colorScheme.onSurface,
                                child: const Padding(
                                  padding: AppUtils.kPaddingHor16Ver10,
                                  child: Text("text"),
                                ),
                              ),
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                                      const Gap(8),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SliverGap(16),
                SliverToBoxAdapter(
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
                const SliverGap(12),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: 5,
                    (context, index) => Material(
                      color: context.color.cardColor,
                      borderRadius: AppUtils.kBorderRadius12,
                      child: Padding(
                        padding: AppUtils.kPaddingAll16,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Title",
                              style: context.textStyle.bodyTitle3
                                  .copyWith(fontWeight: FontWeight.w600),
                            ),
                            ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: 5,
                              itemBuilder: (context, index) => Padding(
                                padding: AppUtils.kPaddingVer16,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 150.w,
                                          height: 24.h,
                                          child: Text(
                                            "Choyxona palov jala",
                                            style: context
                                                .textStyle.regularSubheadline,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 239.h,
                                          height: 38.h,
                                          child: Text(
                                            "Своим именем чайханский плов обязан старой ташкентской традиции «ош»...xbsxbskxbxzbmczkshjcvb",
                                            style: context
                                                .textStyle.regularFootnote
                                                .copyWith(
                                                    color:
                                                        context.color.black3),
                                          ),
                                        ),
                                        const Gap(8),
                                        Text(
                                          "41 000 sum blyad",
                                          style: context
                                              .textStyle.regularSubheadline
                                              .copyWith(
                                                  fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                    const Gap(8),
                                    Image.network(
                                      "https://picsum.photos/200/300",
                                      width: 88.h,
                                      height: 88.h,
                                      fit: BoxFit.cover,
                                    )
                                  ],
                                ),
                              ),
                              separatorBuilder: (context, index) => Divider(
                                height: 1,
                                color: context.color.black.withOpacity(0.1),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
