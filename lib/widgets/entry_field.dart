import 'package:community_app/resources/color_resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EntryField extends StatelessWidget {
  final String? hint;
  final Widget? prefixIcon;
  final Color? color;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? initialValue;
  final bool? readOnly;
  final String? labelText;
  final TextAlign? textAlign;
  final Widget? suffixIcon;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final int? maxLines;
  final bool? isDense;
  final void Function()? onTap;
  final double? height;
  final ValueChanged<String>? onFieldSubmitted;
  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validator;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final EdgeInsets? contentPadding;
  final double? borderRadius;
  final Color? borderColor;
  final bool? isFilled;
  final Color? filledColor;
  final bool? obscureText;

  EntryField({
    this.obscureText = false,
    this.isFilled = false,
    this.labelText,
    this.filledColor,
    this.borderColor,
    this.contentPadding =
        const EdgeInsets.symmetric(horizontal: 20, vertical: 0.0),
    this.borderRadius,
    this.onChanged,
    this.hint,
    this.prefixIcon,
    this.color,
    this.controller,
    this.initialValue,
    this.readOnly,
    this.textAlign,
    this.suffixIcon,
    this.textInputType,
    this.maxLines,
    this.isDense,
    this.onTap,
    this.height,
    this.focusNode,
    this.onFieldSubmitted,
    this.validator,
    this.textInputAction = TextInputAction.next,
    this.maxLength,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Theme.of(context).textTheme.bodyText2?.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
      onChanged: onChanged,
      inputFormatters: inputFormatters,
      maxLength: maxLength,
      onTap: onTap,
      controller: controller,
      focusNode: focusNode,
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
      initialValue: initialValue,
      readOnly: readOnly ?? false,
      maxLines: maxLines ?? 1,
      textAlign: textAlign ?? TextAlign.left,
      keyboardType: textInputType,
      textInputAction: textInputAction,
      obscureText: obscureText ?? false,
      obscuringCharacter: "*",
      decoration: InputDecoration(
        isDense: isDense ?? isDense,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        label: Text(hint ?? ""),
        labelStyle: Theme.of(context).textTheme.bodyText2?.copyWith(
          fontSize: 14,
          color: kBlueColor,
          fontWeight: FontWeight.w400,
        ),
        filled: isFilled ?? false,
        fillColor: filledColor,
        border: OutlineInputBorder(
            borderSide: const BorderSide(color: kBlueColor),
            borderRadius: BorderRadius.circular(10)),
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(10)),
        disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: kLightGreyColor),
            borderRadius: BorderRadius.circular(10)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: kBlueColor),
            borderRadius: BorderRadius.circular(10)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kBlueColor.withOpacity(0.3)),
            borderRadius: BorderRadius.circular(10)),
        counter: const SizedBox.shrink(),
        contentPadding: contentPadding,
      ),
    );
  }
}
