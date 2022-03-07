import 'package:community_app/resources/color_resources.dart';
import 'package:community_app/ui/base/base_stateful_widget.dart';
import 'package:community_app/widgets/common_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildProfileWidget(),
                const SizedBox(height: 16),
                _buildSettingsListWidget(),
                const SizedBox(height: 30),
                _buildReviewWidget(),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "V 0.0.1",
                style: theme.textTheme.subtitle1?.copyWith(
                  color: kDarkGreyColor,
                ),
              ),
              InkWell(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.logout,
                      color: Colors.red,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      "Logout",
                      style: theme.textTheme.subtitle1?.copyWith(
                        fontSize: 14,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildProfileWidget() {
    return Container(
      color: kBlueColor,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Row(
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: Image.asset("assets/images/profile_image.png").image,
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Inverrsee Bhatt",
                style: theme.textTheme.bodyText2?.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: kWhiteColor,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                "1234567890",
                style: theme.textTheme.subtitle1?.copyWith(
                  fontSize: 16,
                  color: kWhiteColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsListWidget() {
    return Column(
      children: [
        ListTile(
          leading: const Icon(
            Icons.volunteer_activism,
            color: kBlueColor,
          ),
          title: Text(
            "My Donations",
            style: theme.textTheme.bodyText2?.copyWith(
              color: kBlueColor,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        ListTile(
          leading: const FaIcon(
            FontAwesomeIcons.language,
            color: kBlueColor,
          ),
          title: Text(
            "Change Language",
            style: theme.textTheme.bodyText2?.copyWith(
              color: kBlueColor,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        ListTile(
          leading: const Icon(
            Icons.image_rounded,
            color: kBlueColor,
          ),
          title: Text(
            "Quotes",
            style: theme.textTheme.bodyText2?.copyWith(
              color: kBlueColor,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        ListTile(
          leading: const FaIcon(
            CupertinoIcons.person_2_fill,
            color: kBlueColor,
          ),
          title: Text(
            "Create your sanstha/group/community",
            style: theme.textTheme.bodyText2?.copyWith(
              color: kBlueColor,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        ListTile(
          leading: const Icon(
            Icons.security,
            color: kBlueColor,
          ),
          title: Text(
            "Privacy Policy",
            style: theme.textTheme.bodyText2?.copyWith(
              color: kBlueColor,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        ListTile(
          leading: const Icon(
            CupertinoIcons.doc_fill,
            color: kBlueColor,
          ),
          title: Text(
            "Terms & Condition",
            style: theme.textTheme.bodyText2?.copyWith(
              color: kBlueColor,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        ListTile(
          leading: const Icon(
            Icons.share,
            color: kBlueColor,
          ),
          title: Text(
            "Share with friends and family",
            style: theme.textTheme.bodyText2?.copyWith(
              color: kBlueColor,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        ListTile(
          leading: const Icon(
            Icons.cloud_upload,
            color: kBlueColor,
          ),
          title: Text(
            "Upload Documents",
            style: theme.textTheme.bodyText2?.copyWith(
              color: kBlueColor,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        ListTile(
          leading: const Icon(
            Icons.logout,
            color: kBlueColor,
          ),
          title: Text(
            "Leave Community",
            style: theme.textTheme.bodyText2?.copyWith(
              color: kBlueColor,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        ListTile(
          leading: const Icon(
            Icons.delete_rounded,
            color: kBlueColor,
          ),
          title: Text(
            "Delete Account",
            style: theme.textTheme.bodyText2?.copyWith(
              color: kBlueColor,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildReviewWidget() {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 20),
      color: kBlueColor.withOpacity(0.2),

    );
  }
}
