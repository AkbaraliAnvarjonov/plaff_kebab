import 'package:flutter/material.dart';
import 'package:plaff_kebab/src/core/extension/extension.dart';
import 'package:plaff_kebab/src/core/utils/utils.dart';
import 'package:plaff_kebab/src/data/models/adress/branch_model.dart';

class BranchItemWidget extends StatelessWidget {
  final Function()? onTap;
  final Branch? branch;
  final Branch? selectedBranch;

  const BranchItemWidget({
    super.key,
    this.onTap,
    this.branch,
    this.selectedBranch,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: AppUtils.kBorderRadius12,
      onTap: onTap,
      child: Ink(
        padding: AppUtils.kPaddingAll12,
        child: Row(
          children: [
            const Padding(
              padding: AppUtils.kPaddingVer16,
              child: Material(
                color: Colors.transparent,
                child: Image(
                  image: AssetImage(AppImages.favourite),
                  height: 24,
                  width: 24,
                ),
              ),
            ),
            AppUtils.kGap12,
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 2),
                    child: Text(
                      branch?.name ?? 'Xadra',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: context.textStyle.regularHeadline,
                    ),
                  ),
                  Text(
                    branch?.address ?? "30 Navoiy shoh ko'chasi,",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: context.textStyle.regularHeadline,
                  ),
                ],
              ),
            ),
            AppUtils.kGap12,
            (branch?.id == selectedBranch?.id)
                ? Icon(
                    Icons.radio_button_checked_rounded,
                    size: 24,
                    color: context.colorScheme.primary,
                  )
                : Icon(
                    Icons.radio_button_unchecked,
                    size: 24,
                    color: context.colorScheme.surface,
                  ),
          ],
        ),
      ),
    );
  }
}
