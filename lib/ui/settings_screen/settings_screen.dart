import 'package:community_app/resources/color_resources.dart';
import 'package:community_app/ui/base/base_stateful_widget.dart';
import 'package:community_app/ui/settings_screen/privacy_policy_screen.dart';
import 'package:community_app/widgets/common_app_bar.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends BaseStatefulWidgetState<SettingsScreen> {
  @override
  PreferredSizeWidget buildAppBar(BuildContext context) {
    return CommonAppBar(
      title: "Settings",
      showLeading: true,
      onLeadingIconTap: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
        child: Column(
          children: [
            _buildGeneralSettingsWidget(),
            const SizedBox(height: 50),
            _buildSupportSettingsWidget(),
          ],
        ),
      ),
    );
  }

  Widget _buildGeneralSettingsWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "General",
          style: theme.textTheme.subtitle1?.copyWith(
            color: kDarkGreyColor,
            letterSpacing: 1.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 5),
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 0),
          title: Text(
            "Push Notification",
            style: theme.textTheme.subtitle1?.copyWith(
              color: kDarkGreyColor,
              letterSpacing: 1.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          trailing: const Icon(
            Icons.keyboard_arrow_right_outlined,
            color: kDarkTealColor,
            size: 28,
          ),
        ),
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 0),
          title: Text(
            "Blocked Users",
            style: theme.textTheme.subtitle1?.copyWith(
              color: kDarkGreyColor,
              letterSpacing: 1.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          trailing: const Icon(
            Icons.keyboard_arrow_right_outlined,
            color: kDarkTealColor,
            size: 28,
          ),
        ),
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 0),
          title: Text(
            "Linked Accounts",
            style: theme.textTheme.subtitle1?.copyWith(
              color: kDarkGreyColor,
              letterSpacing: 1.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          trailing: const Icon(
            Icons.keyboard_arrow_right_outlined,
            color: kDarkTealColor,
            size: 28,
          ),
        ),
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 0),
          title: Text(
            "Language",
            style: theme.textTheme.subtitle1?.copyWith(
              color: kDarkGreyColor,
              letterSpacing: 1.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          trailing: const Icon(
            Icons.keyboard_arrow_right_outlined,
            color: kDarkTealColor,
            size: 28,
          ),
        ),
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 0),
          title: Text(
            "Search History",
            style: theme.textTheme.subtitle1?.copyWith(
              color: kDarkGreyColor,
              letterSpacing: 1.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          trailing: const Icon(
            Icons.keyboard_arrow_right_outlined,
            color: kDarkTealColor,
            size: 28,
          ),
        ),
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 0),
          title: Text(
            "Report a Problem",
            style: theme.textTheme.subtitle1?.copyWith(
              color: kDarkGreyColor,
              letterSpacing: 1.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          trailing: const Icon(
            Icons.keyboard_arrow_right_outlined,
            color: kDarkTealColor,
            size: 28,
          ),
        ),
      ],
    );
  }

  Widget _buildSupportSettingsWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Support",
          style: theme.textTheme.subtitle1?.copyWith(
            color: kDarkGreyColor,
            letterSpacing: 1.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 5),
        ListTile(
          onTap: () {
            push(const PrivacyPolicyScreen());
          },
          contentPadding: const EdgeInsets.symmetric(horizontal: 0),
          title: Text(
            "Terms & Policy",
            style: theme.textTheme.subtitle1?.copyWith(
              color: kDarkGreyColor,
              letterSpacing: 1.0,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 0),
          title: Text(
            "Logout",
            style: theme.textTheme.subtitle1?.copyWith(
              color: Colors.red,
              letterSpacing: 1.0,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
