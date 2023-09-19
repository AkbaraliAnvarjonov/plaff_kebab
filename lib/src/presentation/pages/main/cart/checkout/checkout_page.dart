import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plaff_kebab/src/core/extension/extension.dart';
import 'package:plaff_kebab/src/core/extension/list_product_extension.dart';
import 'package:plaff_kebab/src/core/utils/utils.dart';
import 'package:plaff_kebab/src/data/models/product/onedemand_order.dart';
import 'package:plaff_kebab/src/data/source/hive/product.dart';
import 'package:plaff_kebab/src/presentation/bloc/checkout/checkout_bloc.dart';
import 'package:plaff_kebab/src/presentation/pages/main/cart/checkout/widget/bottom_button.dart';
import 'package:plaff_kebab/src/presentation/pages/main/cart/checkout/widget/courier_call.dart';
import 'package:plaff_kebab/src/presentation/pages/main/cart/checkout/widget/custom_tab_bar.dart';
import 'package:plaff_kebab/src/presentation/pages/main/cart/checkout/widget/delivery_map_widget.dart';
import 'package:plaff_kebab/src/presentation/pages/main/cart/checkout/widget/delivery_type_widget.dart';
import 'package:plaff_kebab/src/presentation/pages/main/cart/checkout/widget/price_widget.dart';
import 'package:plaff_kebab/src/presentation/pages/main/cart/checkout/widget/select_payment_type_widget.dart';
import 'package:plaff_kebab/src/presentation/pages/main/cart/checkout/widget/self_pick_up_widget.dart';

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
          child: BlocSelector<CheckoutBloc, CheckoutState, DeliveryType>(
              selector: (state) => state.deliveryType,
              builder: (context, deliveryTypeState) {
                return Column(
                  children: [
                    AppUtils.kGap12,
                    deliveryTypeState == DeliveryType.delivery
                        ? DeliveryMapWidget(
                            locationNameController: locationNameController,
                            entranceController: entranceController,
                            floorController: floorController,
                            flatController: flatController,
                            adressNameController: adressNameController,
                            chooseController: chooseController,
                            selectedAdress: selectedAdress,
                            products: widget.products,
                          )
                        : SelfPickUpWidget(),
                    AppUtils.kGap12,
                    deliveryTypeState == DeliveryType.delivery
                        ? const CourierCallWidget()
                        : AppUtils.kGap,
                    AppUtils.kGap12,
                    deliveryTypeState == DeliveryType.delivery
                        ? const DeliveryTimeWidget()
                        : AppUtils.kGap,
                    AppUtils.kGap12,
                    const SelectPaymentTypeWidget(),
                    AppUtils.kGap12,
                    PriceWidget(
                      isCheckout: true,
                      generalSum: widget.products.calculateTotalPrice(),
                      listOfBasketProducts: widget.products,
                    )
                  ],
                );
              }),
        ),
        bottomNavigationBar: CheckoutBottomButtonWidget(
          products: widget.products,
          entranceController: entranceController,
          floorController: floorController,
          flatController: flatController,
          locationNameController: locationNameController,
        ));
  }
}
