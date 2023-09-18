import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plaff_kebab/src/core/extension/extension.dart';
import 'package:plaff_kebab/src/core/utils/utils.dart';
import 'package:plaff_kebab/src/data/models/adress/adress_model.dart';
import 'package:plaff_kebab/src/presentation/bloc/map/map_bloc.dart';
import 'package:plaff_kebab/src/presentation/bloc/user_adresses/user_adresses_bloc.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

// ignore: must_be_immutable
class CheckoutBottomSheet extends StatelessWidget {
  CheckoutBottomSheet({
    super.key,
    required this.yandexMapController,
    required this.controller,
    required this.selectRadioValue,
    required this.orderPrice,
  });
  final YandexMapController yandexMapController;
  final double orderPrice;
  final TextEditingController controller;
  int selectRadioValue;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<UserAdressesBloc, UserAdressesState,
        List<CustomerAddress>>(
      selector: (UserAdressesState state) => state.customerAddresses,
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: AppUtils.kPaddingBottom8Hor16top16,
              child: Text(
                context.tr("my_adresses"),
                style: context.textStyle.appBarTitle,
              ),
            ),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: state.length,
              itemBuilder: (context, index) => ListTile(
                onTap: () {
                  selectRadioValue = index;
                  controller.text = state[index].name;
                  yandexMapController.moveCamera(
                    CameraUpdate.newCameraPosition(
                      CameraPosition(
                        target: Point(
                          latitude: state[index].location.lat,
                          longitude: state[index].location.long,
                        ),
                        zoom: 20,
                      ),
                    ),
                    animation: const MapAnimation(),
                  );
                  BlocProvider.of<MapBloc>(context).add(
                    MapLocationChanged(
                      value: Point(
                          latitude: state[index].location.lat,
                          longitude: state[index].location.long),
                    ),
                  );

                  Navigator.pop(context);
                },
                leading: SizedBox(
                  width: 20,
                  child: Radio(
                    value: index,
                    groupValue: selectRadioValue,
                    onChanged: (value) {
                      selectRadioValue = value!;
                    },
                  ),
                ),
                title: Text(
                  state[index].name,
                  style: context.textStyle.regularSubheadline
                      .copyWith(color: context.color.black3),
                ),
                subtitle: Text(
                  state[index].address,
                  style: context.textStyle.subHead14Weight400,
                ),
              ),
              separatorBuilder: (BuildContext context, int index) => Padding(
                padding: AppUtils.kPaddingHorizontal16,
                child: Divider(
                  color: context.color.black5.withOpacity(0.1),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: AppUtils.kPaddingAll16,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      context.color.black5.withOpacity(0.3),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    context.tr("add_location"),
                    style: context.textStyle.appBarTitle,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
