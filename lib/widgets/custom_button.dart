import 'package:community_app/resources/color_resources.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String? label;
  final Widget? icon;
  final double? iconGap;
  final void Function()? onTap;
  final Color? color;
  final Color? textColor;
  final EdgeInsetsGeometry? padding;
  final double? radius;
  final Color? loaderColor;
  final Widget? trailing;
  final double? textSize;
  final bool showLoading;
  final double? loaderSize;
  final double? height;
  final double? width;

  const CustomButton({
    this.width,
    this.height,
    this.loaderSize,
    this.label,
    this.icon,
    this.iconGap,
    this.onTap,
    this.color,
    this.textColor,
    this.padding = const EdgeInsets.symmetric(horizontal: 20),
    this.radius,
    this.trailing,
    this.textSize,
    this.showLoading = false,
    this.loaderColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 25),
          color: color ?? kBlueColor,
        ),
        height: height ?? 50,
        width: width ?? MediaQuery.of(context).size.width * 0.55,
        child: !showLoading
            ? icon == null
                ? Center(
                    child: Text(
                      label ?? "",
                      textAlign: TextAlign.center,
                      style: theme.textTheme.subtitle2?.copyWith(
                        color: textColor ?? kWhiteColor,
                        fontSize: textSize ?? 15,
                        letterSpacing: 1.5,
                      ),
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        label ?? "",
                        textAlign: TextAlign.center,
                        style: theme.textTheme.subtitle2?.copyWith(
                          color: textColor ?? kWhiteColor,
                          fontSize: textSize ?? 15,
                          letterSpacing: 1.5,
                        ),
                      ),
                      icon ?? const SizedBox.shrink(),
                    ],
                  )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: loaderSize ?? 25,
                    height: loaderSize ?? 25,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        loaderColor ?? kWhiteColor,
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
