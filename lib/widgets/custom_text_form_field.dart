// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/consts/colors.dart';
import 'package:task/consts/text_styles.dart';
import 'package:task/resources/assets_svg_generated.dart';

class CustomTextFormField extends StatelessWidget {
  final TextInputType inputType;
  final bool obscureText;
  TextEditingController? controller;
  final String obscuringCharacter;
  final String hint;
  final String? label;
  final InputDecoration? decoration;
  final Function(String?)? onSave;
  final Function(String?)? onChange;
  final Function(String?)? nextFocus;
  final Function()? onTapShowHidePassword;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  TextInputAction? textInputAction;
  int maxLines;
  int? length;
  bool enabled;
  Widget? suffixIcon;
  Widget? prefixIcon;
  var onTap;
  List<TextInputFormatter>? inputFormatters;

  CustomTextFormField(
      {Key? key,
      required this.hint,
      required this.inputType,
      this.onSave,
      this.label,
      this.onChange,
      this.nextFocus,
      this.validator,
      this.controller,
      this.obscureText = false,
      this.decoration,
      this.focusNode,
      this.maxLines = 1,
      this.length,
      this.obscuringCharacter = "*",
      this.enabled = false,
      this.inputFormatters,
      this.onTapShowHidePassword,
      this.textInputAction,
      this.suffixIcon,
      this.onTap,
      this.prefixIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onSaved: onSave,
      onChanged: onChange,
      validator: validator,
      cursorColor: ColorCode.grey,
      showCursor: true,
      textAlign: TextAlign.start,
      keyboardType: inputType,
      maxLines: maxLines,
      maxLength: length,
      focusNode: focusNode,
      onTap: onTap,
      readOnly: enabled,
      inputFormatters: inputFormatters ?? [],
      textAlignVertical: TextAlignVertical.center,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: obscureText,
      obscuringCharacter: obscuringCharacter,
      textInputAction: textInputAction,
      onFieldSubmitted: nextFocus,
      style: TextStyles.textMedium.copyWith(
        color: ColorCode.black,
        fontWeight: FontWeight.normal,
        fontSize: 16.sp,
      ),
      decoration: decoration ??
          InputDecoration(
            counter: const SizedBox(),
            hintText: hint,
            hintStyle: TextStyles.textMedium.copyWith(
              color: ColorCode.black.withOpacity(.5),
              fontWeight: FontWeight.normal,
              fontSize: 12.sp,
            ),
            labelText: label,
            labelStyle: TextStyles.textMedium.copyWith(
              color: ColorCode.grey.withOpacity(.6),
              fontWeight: FontWeight.normal,
              fontSize: 16.sp,
            ),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(color: ColorCode.primary, width: 1),
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(color: ColorCode.primary, width: 1),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(color: ColorCode.primary, width: 1),
            ),
            errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(color: Colors.red, width: 1),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(color: Colors.red, width: 1),
            ),
            disabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(color: ColorCode.primary, width: 1),
            ),
            fillColor: Colors.white,
            filled: true,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 14).r,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
          ),
    );
  }
}
