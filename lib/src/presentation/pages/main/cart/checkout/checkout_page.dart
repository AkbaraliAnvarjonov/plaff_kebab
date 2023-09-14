import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plaff_kebab/src/core/extension/extension.dart';
import 'package:plaff_kebab/src/core/utils/utils.dart';
import 'package:plaff_kebab/src/injector_container.dart';
import 'package:plaff_kebab/src/presentation/bloc/map/map_bloc.dart';
import 'package:plaff_kebab/src/presentation/components/inputs/custom_text_field.dart';
import 'package:plaff_kebab/src/presentation/components/material_border/material_border_widget.dart';
import 'package:plaff_kebab/src/presentation/pages/main/home/map/widgets/info_text_field.dart';

part 'mixin/checkout_mixin.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage>
    with SingleTickerProviderStateMixin, OrdersMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<MapBloc>(
      create: (_) => sl<MapBloc>(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            context.tr("checkout_order"),
            style: context.textStyle.appBarTitle,
          ),
        ),
        body: CustomScrollView(
          controller: scrollController,
          slivers: [
            SliverToBoxAdapter(
              child: MaterialBorderWidget(
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
                      selector: (state) {
                        locationNameController.text = state.title;
                        return state.title;
                      },
                      builder: (context, state) => CustomTextField(
                        controller: locationNameController,
                        haveBorder: false,
                        filled: true,
                        maxLines: 2,
                        minLines: 2,
                        readOnly: true,
                        fillColor: context.color.black5.withOpacity(0.15),
                      ),
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
                  ])),
            )
          ],
        ),
      ),
    );
  }
}
