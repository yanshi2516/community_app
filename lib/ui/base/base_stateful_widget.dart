import 'package:community_app/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rxdart/rxdart.dart';

import 'base_view.dart';

abstract class BaseStatefulWidgetState<T extends StatefulWidget>
    extends State<T> implements BaseView {
  final subscriptions = CompositeSubscription();
  final GlobalKey<ScaffoldState> rootScaffoldKey = GlobalKey<ScaffoldState>();
  late ThemeData theme;
  bool haveSafeArea = true;
  Color? scaffoldBackgroundColor;

  @override
  @protected
  @mustCallSuper
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    theme = Theme.of(context);
  }

  @override
  @protected
  @mustCallSuper
  Widget build(BuildContext context) {
    return haveSafeArea
        ? Container(
            color: scaffoldBackgroundColor ?? theme.scaffoldBackgroundColor,
            child: SafeArea(
              top: false,
              child: Scaffold(
                backgroundColor:
                    scaffoldBackgroundColor ?? theme.scaffoldBackgroundColor,
                key: rootScaffoldKey,
                appBar: buildAppBar(context),
                drawer: buildDrawer(context),
                floatingActionButton: buildFloatingActionButton(context),
                body: buildBody(),
                bottomNavigationBar: buildBottomNavigationBar(context),
              ),
            ),
          )
        : Scaffold(
            backgroundColor:
                scaffoldBackgroundColor ?? theme.scaffoldBackgroundColor,
            key: rootScaffoldKey,
            appBar: buildAppBar(context),
            drawer: buildDrawer(context),
            floatingActionButton: buildFloatingActionButton(context),
            body: buildBody(),
            bottomNavigationBar: buildBottomNavigationBar(context),
          );
  }

  Widget buildBody() {
    return const SizedBox.shrink();
  }

  @protected
  Widget buildBottomNavigationBar(BuildContext context) {
    return const SizedBox.shrink();
  }

  @protected
  Widget buildFloatingActionButton(BuildContext context) {
    return const SizedBox.shrink();
  }

  @protected
  Widget buildDrawer(BuildContext context) {
    return widget;
  }

  @protected
  PreferredSizeWidget buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.zero,
      child: Container(),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void onError(String errorMessageKey) {}

  @override
  void showSnackBar(String errorMessage) {
    AppUtils.showSnackBar(errorMessage, rootScaffoldKey.currentState);
  }

  @override
  void showToast({
    required String text,
    double fontSize = 14.0,
    Color textColor = Colors.white,
    Color backgroundColor = Colors.black,
    Toast toastLength = Toast.LENGTH_LONG,
  }) {
    AppUtils.showToast(
      text: text,
      fontSize: fontSize,
      textColor: textColor,
      toastLength: toastLength,
      backgroundColor: backgroundColor,
    );
  }

  @override
  void showAlertDialog({
    String title = "Alert",
    String description = "",
    String submitText = "Submit",
    String cancelText = "Cancel",
    VoidCallback? onTapSubmit,
    VoidCallback? onTapCancel,
    Color backgroundColor = Colors.white,
  }) {
    AppUtils.showAlertDialog(
      context: context,
      backgroundColor: backgroundColor,
      cancelText: cancelText,
      description: description,
      onTapCancel: onTapCancel,
      onTapSubmit: onTapSubmit,
      submitText: submitText,
      title: title,
    );
  }

  Size screenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  double screenHeight(BuildContext context,
      {double dividedBy = 1, double reducedBy = 0.0}) {
    return screenSize(context).height / dividedBy;
  }

  double screenWidth(BuildContext context, {double dividedBy = 1}) {
    return screenSize(context).width / dividedBy;
  }

  double screenHeightExcludingToolbar(BuildContext context,
      {double dividedBy = 1}) {
    return screenHeight(context,
        dividedBy: dividedBy, reducedBy: kToolbarHeight);
  }

  Future<dynamic> push(Widget widget, {BuildContext? context}) {
    return Navigator.push(
      context ?? this.context,
      MaterialPageRoute(builder: (context) => widget),
    );
  }

  Future<dynamic> pushReplacement(Widget widget, {BuildContext? context}) {
    return Navigator.pushReplacement(
      context ?? this.context,
      MaterialPageRoute(builder: (context) => widget),
    );
  }

  Future<dynamic> pushAndClearStack(Widget widget, {BuildContext? context}) {
    return Navigator.pushAndRemoveUntil(
      context ?? this.context,
      MaterialPageRoute(builder: (context) => widget),
      (route) => false,
    );
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }
}
