import 'package:task/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class CustomTextFieldContainer extends StatelessWidget {
  final CustomTextFormField? textFieldWidget;

  const CustomTextFieldContainer(this.textFieldWidget, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: EdgeInsets.zero,
      child: textFieldWidget,
    );
  }
}
