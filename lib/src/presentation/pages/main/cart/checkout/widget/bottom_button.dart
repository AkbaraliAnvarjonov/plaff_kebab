import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plaff_kebab/src/config/router/app_routes.dart';
import 'package:plaff_kebab/src/core/extension/extension.dart';
import 'package:plaff_kebab/src/data/models/on_demand/on_demand_model.dart';
import 'package:plaff_kebab/src/data/models/on_demand/on_demand_order_products.dart';
import 'package:plaff_kebab/src/data/models/on_demand/step_model.dart';
import 'package:plaff_kebab/src/data/models/product/onedemand_order.dart';
import 'package:plaff_kebab/src/data/models/translations_model.dart';
import 'package:plaff_kebab/src/data/source/hive/product.dart';
import 'package:plaff_kebab/src/presentation/bloc/checkout/checkout_bloc.dart';
import 'package:plaff_kebab/src/presentation/bloc/database/database_bloc.dart';
import 'package:plaff_kebab/src/presentation/bloc/database/database_event.dart';
import 'package:plaff_kebab/src/presentation/components/buttons/bottom_button.dart';
import 'package:plaff_kebab/src/presentation/components/material_border/material_border_widget.dart';
import 'package:plaff_kebab/src/presentation/components/snack/snack.dart';

class CheckoutBottomButtonWidget extends StatelessWidget {
  const CheckoutBottomButtonWidget({
    super.key,
    required this.products,
    required this.entranceController,
    required this.floorController,
    required this.flatController,
    required this.locationNameController,
  });
  final List<Products> products;
  final TextEditingController entranceController;
  final TextEditingController floorController;
  final TextEditingController flatController;
  final TextEditingController locationNameController;

  @override
  Widget build(BuildContext context) {
    return MaterialBorderWidget(
      child:
          BlocConsumer<CheckoutBloc, CheckoutState>(listener: (context, state) {
        if (state.status == OnDemandStatus.success) {
          BlocProvider.of<DatabaseBloc>(context).add(DeleteProducts());
          Navigator.popUntil(
            context,
            (route) => route.isFirst,
          );
          showSnackBar(context, "Your order succsesfull");
        }
      }, builder: (context, state) {
        return BottomButton(
          text: context.tr("order"),
          onTap: () {
            List<OrdersProductsOndemand> list = [];
            List<String> numbers = [];
            for (var t in products) {
              numbers = t.quantity.toString().split('.');
              List<ModifiersOnDemand> listModifier = [];
              List<OrdersVariantsOndemand> listOrdersVariants = [];
              for (var element in t.modifiers) {
                listModifier.add(ModifiersOnDemand(
                  modifierId: element.modifierId,
                  modifierName: Translations(
                    uz: element.modifierName.uz,
                    ru: element.modifierName.ru,
                    en: element.modifierName.en,
                  ),
                  modifierQuantity: (element.modifierQuantity *
                          (int.tryParse(numbers.first) ?? 1))
                      .toString(),
                  modifiersPrice: element.modifiersPrice.toString(),
                  parentId: element.parentId,
                ));
              }
              for (var element in t.combos) {
                listOrdersVariants.add(
                  OrdersVariantsOndemand(
                    groupId: element.groupId,
                    variantId: element.variantId,
                    quantity: element.quantity,
                  ),
                );
              }
              list.add(
                OrdersProductsOndemand(
                  description: '',
                  quantity: t.quantity.toDouble(),
                  price: t.price.toString(),
                  productId: t.id,
                  modifiers: listModifier,
                  variants: listOrdersVariants,
                  type: 'simple',
                ),
              );
            }
            BlocProvider.of<CheckoutBloc>(context).add(
              OnDemandEvent(
                onDemandModel: OnDemandModel(
                  apartment: entranceController.text,
                  building: flatController.text,
                  clientId: localSource.userId,
                  coDeliveryPrice: 0,
                  deliveryTime: '',
                  deliveryType: state.deliveryType == DeliveryType.delivery
                      ? "delivery"
                      : "self-pickup",
                  description: '',
                  isCourierCall: state.isCall,
                  extraPhoneNumber: '',
                  floor: floorController.text,
                  paid: false,
                  paymentType: state.paymentType.stringValue,
                  source: 'android',
                  statusId: '',
                  steps: [
                    StepModel(
                      branchId: state.branches[0].id,
                      description: '',
                      products: list,
                    )
                  ],
                  toAddress: locationNameController.text,
                  toLocation: ToLocation(
                    lat: state.point.latitude,
                    long: state.point.longitude,
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
