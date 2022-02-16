import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

abstract class BaseView<T> {
  void onError(String key);

  void showSnackBar(String errorMessage);

  void showToast({
    required String text,
    double fontSize = 14.0,
    Color textColor = Colors.white,
    Color backgroundColor = Colors.black,
    Toast toastLength = Toast.LENGTH_LONG,
  });

  void showAlertDialog({
    String title = "Alert",
    String description = "",
    String submitText = "Submit",
    String cancelText = "Cancel",
    VoidCallback onTapSubmit,
    VoidCallback onTapCancel,
    Color backgroundColor = Colors.white,
  });
}