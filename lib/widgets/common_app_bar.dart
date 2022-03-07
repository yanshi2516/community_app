import 'package:community_app/resources/color_resources.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
AppBar CommonAppBar({
  required String title,
  List<Widget> actions = const [],
  bool showLeading = false,
  Color? backgroundColor,
  Color? titleColor,
  Widget? titleWidget,
  Widget leadingIcon = const Icon(Icons.keyboard_backspace, color: kWhiteColor),
  void Function()? onLeadingIconTap,
}) {
  return AppBar(
    automaticallyImplyLeading: showLeading,
    leading: showLeading
        ? IconButton(onPressed: onLeadingIconTap, icon: leadingIcon)
        : const SizedBox.shrink(),
    backgroundColor: backgroundColor ?? kBlueColor,
    titleSpacing: 0.0,
    title: titleWidget ??
        Text(
          title,
          style: TextStyle(
            color: titleColor ?? kWhiteColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
    actions: actions,
  );
}
