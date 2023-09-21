import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plaff_kebab/src/core/extension/extension.dart';
import 'package:plaff_kebab/src/presentation/bloc/profile/profile_bloc.dart';
import 'package:plaff_kebab/src/presentation/components/loading_widgets/modal_progress_hud.dart';

class BranchPage extends StatelessWidget {
  const BranchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('branches'.tr)),
      body: BlocBuilder<ProfileBloc, ProfileState>(builder: (contex, state) {
        return ModalProgressHUD(
          inAsyncCall: state.status.isLoading,
          child: GetBuilder<ProfileBranchesController>(
            builder: (controller) {
              if (controller.isLoading.value) return AppUtils.kBox;
              if (controller.branches.isEmpty) {
                return EmptyWidget(text: 'branches_do_not_exist'.tr);
              }
              return ListView.separated(
                padding: AppUtils.kPaddingVertical16,
                itemCount: controller.branches.length,
                itemBuilder: (context, index) => BranchItemWidget(
                  isFirst: index == 0,
                  isLast: index == controller.branches.length - 1,
                  branch: controller.branches[index],
                  onTap: () {
                    Get.toNamed(
                      AppRoutes.profileBranchDetail,
                      arguments: ProfileBranchDetailPageArguments(
                        branch: controller.branches[index],
                      ),
                    );
                  },
                ),
                separatorBuilder: (context, index) {
                  return const ColoredBox(
                    color: AppColors.white,
                    child: Padding(
                      padding: AppUtils.kPaddingHorizontal16,
                      child: Divider(height: 1),
                    ),
                  );
                },
              );
            },
          ),
        );
      }),
    );
    ;
  }
}
