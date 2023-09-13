import 'package:flutter/material.dart';
import 'package:plaff_kebab/src/core/extension/extension.dart';
import 'package:plaff_kebab/src/presentation/components/inputs/custom_text_field.dart';

class InfoTextField extends StatelessWidget {
  const InfoTextField({
    super.key,
    required this.controller,
    required this.text,
  });
  final TextEditingController controller;
  final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 3.5,
      child: CustomTextField(
        controller: controller,
        hintText: "entrance".tr,
        filled: true,
        fillColor: context.color.black5.withOpacity(0.15),
        borderColor: context.colorScheme.primary,
      ),
    );
  }
}
