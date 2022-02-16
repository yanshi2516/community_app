import 'package:community_app/resources/color_resources.dart';
import 'package:community_app/resources/string_resources.dart';
import 'package:connectivity/connectivity.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppUtils {
  static void showSnackBar(String message, ScaffoldState? state) {
    final snackBar = SnackBar(
      content: Text(message),
    );
    ScaffoldMessenger.of(state!.context).showSnackBar(snackBar);
  }

  static void showToast({
    required String text,
    double fontSize = 14.0,
    Color textColor = Colors.white,
    Color backgroundColor = Colors.black,
    Toast toastLength = Toast.LENGTH_LONG,
  }) {
    Fluttertoast.showToast(
      msg: text,
      fontSize: fontSize,
      backgroundColor: backgroundColor,
      toastLength: toastLength,
      textColor: textColor,
    );
  }

  static void showAlertDialog({
    required BuildContext context,
    String title = "Alert",
    String description = "",
    String submitText = "Submit",
    String cancelText = "Cancel",
    VoidCallback? onTapSubmit,
    VoidCallback? onTapCancel,
    Color backgroundColor = Colors.white,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.85),
      builder: (context) {
        return AlertDialog(
          backgroundColor: backgroundColor,
          insetPadding: const EdgeInsets.symmetric(horizontal: 16),
          title: Text(title),
          titleTextStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          content: Text(description),
          actions: [
            MaterialButton(
              onPressed: onTapCancel,
              child: Text(cancelText),
            ),
            MaterialButton(
              onPressed: onTapSubmit,
              child: Text(submitText),
            ),
          ],
          buttonPadding: const EdgeInsets.symmetric(horizontal: 8),
        );
      },
    );
  }

  static Future<bool> hasInternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  static String? validateEmailId(String emailId) {
    if (emailId.trim().isEmpty) {
      return strEmailIsRequired;
    }

    if (!EmailValidator.validate(emailId)) {
      return strEmailIsInvalid;
    }

    return null;
  }

  static String? validateMobileNo(String mobileNo) {
    RegExp regExp = RegExp(r"^[0][1-9]\d{9}$|^[1-9]\d{9}$");

    if (mobileNo.trim().isEmpty) {
      return strMobileNumberIsRequired;
    }

    if (!regExp.hasMatch(mobileNo)) {
      return strMobileNumberIsInvalid;
    }

    return null;
  }

  static String? validateName(String name) {
    if (name.trim().isEmpty) {
      return strNameIsRequired;
    }

    return null;
  }

  static String? validatePassword(String password) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    if (password.trim().isEmpty) {
      return strPasswordIsRequired;
    } else if (!regExp.hasMatch(password)) {
      return strPasswordIsInvalid;
    }
    return null;
  }

  static Widget getNoResultsFoundTextWidget(
    String message, {
    double fontSize = 14.0,
    Color fontColor = Colors.black,
  }) {
    return Text(
      message,
      style: TextStyle(
        fontSize: fontSize,
        color: fontColor,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  static String formatDurationInHours(int totalSeconds) {
    final duration = Duration(seconds: totalSeconds);
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  static Widget getCommonTextWidget(ThemeData theme, String title) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            endIndent: 8,
            indent: 8,
            color: kGreyColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Text(
            title,
            style: theme.textTheme.subtitle1?.copyWith(
              color: kGreyColor,
              fontSize: 16,
            ),
          ),
        ),
        const Expanded(
          child: Divider(
            color: kGreyColor,
            indent: 8,
            endIndent: 8,
          ),
        ),
      ],
    );
  }
}
