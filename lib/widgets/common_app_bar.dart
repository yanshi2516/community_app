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
  Widget leadingIcon = const Icon(Icons.keyboard_arrow_left, color: kTealColor),
  void Function()? onLeadingIconTap,
}) {
  return AppBar(
    automaticallyImplyLeading: showLeading,
    leading: showLeading
        ? IconButton(
            iconSize: 32,
            icon: leadingIcon,
            onPressed: onLeadingIconTap,
            color: kWhiteColor,
          )
        : const SizedBox.shrink(),
    leadingWidth: 80,
    centerTitle: true,
    backgroundColor: backgroundColor ?? kBlueColor,
    title: titleWidget ??
        Text(
          title,
          style: TextStyle(
            color: titleColor ?? kWhiteColor,
            fontSize: 16,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.5,
          ),
        ),
    elevation: 5.0,
    shadowColor: kBlueColor,
    actions: actions,
    bottom: PreferredSize(
      child: Container(),
      preferredSize: const Size(double.maxFinite, 30),
    ),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(15),
        bottomLeft: Radius.circular(15),
      ),
    ),
  );
}
