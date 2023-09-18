import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plaff_kebab/src/core/extension/extension.dart';
import 'package:plaff_kebab/src/core/extension/list_product_extension.dart';
import 'package:plaff_kebab/src/core/utils/utils.dart';
import 'package:plaff_kebab/src/data/source/hive/product.dart';
import 'package:plaff_kebab/src/presentation/bloc/checkout/checkout_bloc.dart';
import 'package:plaff_kebab/src/presentation/bloc/map/map_bloc.dart';
import 'package:plaff_kebab/src/presentation/components/buttons/bottom_button.dart';
import 'package:plaff_kebab/src/presentation/components/inputs/custom_text_field.dart';
import 'package:plaff_kebab/src/presentation/components/material_border/material_border_widget.dart';
import 'package:plaff_kebab/src/presentation/pages/main/cart/checkout/widget/checkout_bottom_sheet.dart';
import 'package:plaff_kebab/src/presentation/pages/main/cart/checkout/widget/courier_call.dart';
import 'package:plaff_kebab/src/presentation/pages/main/cart/checkout/widget/custom_tab_bar.dart';
import 'package:plaff_kebab/src/presentation/pages/main/cart/checkout/widget/delivery_type_widget.dart';
import 'package:plaff_kebab/src/presentation/pages/main/cart/checkout/widget/price_widget.dart';
import 'package:plaff_kebab/src/presentation/pages/main/cart/checkout/widget/select_payment_type_widget.dart';
import 'package:plaff_kebab/src/presentation/pages/main/home/map/widgets/info_text_field.dart';
import 'package:plaff_kebab/src/presentation/pages/main/home/map/widgets/map_custom_button.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

part 'mixin/checkout_mixin.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({
    super.key,
    required this.products,
  });
  final List<Products> products;

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage>
    with OrdersMixin, TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          context.tr("checkout_order"),
          style: context.textStyle.appBarTitle,
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: CustomTabBar(
            onTap: (tabIndex) {
              BlocProvider.of<CheckoutBloc>(context)
                  .add(ChangeTabEvent(tabIndex: tabIndex));
            },
            controller: tabController,
            labels: [
              'delivery'.tr,
              'self_pick_up'.tr,
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            AppUtils.kGap12,
            MaterialBorderWidget(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(context.tr('delivery_adress'),
                      style: context.textStyle.appBarTitle),
                  AppUtils.kGap16,
                  Text(context.tr('current_adress'),
                      style: context.textStyle.regularSubheadline),
                  AppUtils.kGap4,
                  BlocSelector<MapBloc, MapState, String>(
                    selector: (state) => state.title,
                    builder: (context, state) {
                      locationNameController.text = state;
                      return CustomTextField(
                        controller: locationNameController,
                        haveBorder: false,
                        filled: true,
                        maxLines: 2,
                        minLines: 2,
                        readOnly: true,
                        fillColor: context.color.black5.withOpacity(0.15),
                      );
                    },
                  ),
                  AppUtils.kGap8,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InfoTextField(
                        controller: entranceController,
                        text: "entrance".tr,
                      ),
                      InfoTextField(
                        controller: floorController,
                        text: "floor".tr,
                      ),
                      InfoTextField(
                        controller: flatController,
                        text: "flat".tr,
                      ),
                    ],
                  ),
                  AppUtils.kGap8,
                  CustomTextField(
                    controller: adressNameController,
                    hintText: "adressName".tr,
                    filled: true,
                    maxLines: 2,
                    fillColor: context.color.black5.withOpacity(0.15),
                  ),
                  AppUtils.kGap8,
                  SizedBox(
                    height: 156,
                    child: BlocSelector<MapBloc, MapState, List<MapObject>>(
                      selector: (state) {
                        BlocProvider.of<CheckoutBloc>(context).add(
                          BranchesEvent(
                            point: state.point,
                            orderPrice:
                                widget.products.calculateTotalPrice().toInt(),
                          ),
                        );
                        return state.mapObjects;
                      },
                      builder: (context, state) {
                        return Stack(
                          children: [
                            YandexMap(
                              scrollGesturesEnabled: false,
                              mapObjects: state,
                              rotateGesturesEnabled: false,
                              tiltGesturesEnabled: false,
                              logoAlignment: const MapAlignment(
                                horizontal: HorizontalAlignment.center,
                                vertical: VerticalAlignment.top,
                              ),
                              onMapCreated: (controller) async {
                                yandexMapController = controller;
                                BlocProvider.of<MapBloc>(context).add(
                                  MapLoadedEvent(
                                      yandexMapController: yandexMapController),
                                );

                                await yandexMapController.toggleUserLayer(
                                    visible: false);
                              },
                            ),
                            Positioned(
                              top: 0,
                              left: 0,
                              child: MapCustomButton(
                                padding: AppUtils.kPaddingAll8,
                                icon: AppIcons.diagonal_resize,
                                onTap: () {},
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: MapCustomButton(
                                padding: AppUtils.kPaddingAll8,
                                icon: AppIcons.get_location_icon,
                                onTap: () {
                                  BlocProvider.of<MapBloc>(context)
                                      .add(MapLoadedEvent());
                                },
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  AppUtils.kGap16,
                  Text(
                    context.tr("my_adress"),
                    style: context.textStyle.regularSubheadline,
                  ),
                  AppUtils.kGap4,
                  CustomTextField(
                    suffixIcon: SvgPicture.asset(
                      AppIcons.bottom_arrow,
                      width: 8,
                      height: 14,
                    ),
                    filled: true,
                    fillColor: context.color.black5.withOpacity(0.15),
                    controller: chooseController,
                    hintText: context.tr("choose_adress"),
                    readOnly: true,
                    onTap: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        showDragHandle: false,
                        context: context,
                        builder: (context) => CheckoutBottomSheet(
                          orderPrice: widget.products.calculateTotalPrice(),
                          selectRadioValue: selectedAdress,
                          yandexMapController: yandexMapController,
                          controller: chooseController,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            AppUtils.kGap12,
            const CourierCallWidget(),
            AppUtils.kGap12,
            const DeliveryTimeWidget(),
            AppUtils.kGap12,
            const SelectPaymentTypeWidget(),
            AppUtils.kGap12,
            PriceWidget(
              isCheckout: true,
              generalSum: widget.products.calculateTotalPrice(),
              listOfBasketProducts: widget.products,
              // sum: ctr.getAllPrice,
              // sumDiscount: ctr.generalSumWithDiscount +
              //     (ctr.deliveryType == DeliveryType.delivery
              //         ? ctr.computePriceResponse?.price ?? 0
              //         : 0),
            )
          ],
        ),
      ),
      bottomNavigationBar: MaterialBorderWidget(
        child: BottomButton(
          text: context.tr("order"),
          onTap: () {},
        ),
      ),
    );
  }
}
