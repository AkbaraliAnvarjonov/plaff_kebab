import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:plaff_kebab/src/config/router/app_routes.dart';
import 'package:plaff_kebab/src/core/extension/extension.dart';
import 'package:plaff_kebab/src/core/utils/utils.dart';
import 'package:plaff_kebab/src/data/models/adress/adress_model.dart';
import 'package:plaff_kebab/src/presentation/bloc/user_adresses/user_adresses_bloc.dart';
import 'package:plaff_kebab/src/presentation/pages/main/home/widgets/modal_bottom_sheet.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
    required this.onChanged,
  });
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      bottom: PreferredSize(
        preferredSize: const Size(double.infinity, 50),
        child: Padding(
          padding: AppUtils.kPaddingSearchWidget,
          child: SearchBar(
            onChanged: onChanged,
            shape: MaterialStateProperty.resolveWith<OutlinedBorder?>(
              (Set<MaterialState> states) => const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
            ),
            elevation: MaterialStateProperty.resolveWith<double?>(
                (Set<MaterialState> states) => 0.5),
            surfaceTintColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) => context.colorScheme.onSurface),
            leading: Padding(
                padding: AppUtils.kPaddingSearch,
                child: SvgPicture.asset(
                  AppIcons.search_icon,
                  width: 20,
                  height: 20,
                )),
            overlayColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) => context.colorScheme.onSurface),
            backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) => context.colorScheme.onSurface),
            hintText: context.tr("search"),
            hintStyle: MaterialStateProperty.resolveWith<TextStyle?>(
                (Set<MaterialState> states) => context
                    .textStyle.regularSubheadline
                    .copyWith(color: context.color.black5)),
            textStyle: MaterialStateProperty.resolveWith<TextStyle?>(
                (Set<MaterialState> states) =>
                    context.textStyle.regularSubheadline),
          ),
        ),
      ),
      title: Column(
        children: [
          BlocSelector<UserAdressesBloc, UserAdressesState,
              List<CustomerAddress>>(
            selector: (state) => state.customerAddresses,
            builder: (context, state) => InkWell(
              onTap: () {
                state.isEmpty
                    ? Navigator.pushNamed(context, Routes.map)
                    : showModalBottomSheet(
                        isScrollControlled: true,
                        showDragHandle: false,
                        context: context,
                        builder: (context) => BottomSheetWidget(state: state));
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 12),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      AppIcons.location_icon,
                      width: 20,
                      height: 20,
                    ),
                    const Gap(6),
                    Text(
                      state.isEmpty
                          ? context.tr("add_location")
                          : state[0].name,
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
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 104);
}
