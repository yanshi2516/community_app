import 'package:community_app/resources/color_resources.dart';
import 'package:community_app/ui/base/base_stateful_widget.dart';
import 'package:community_app/ui/sign_in_screen/sign_in_screen.dart';
import 'package:community_app/ui/sign_up_screen/sign_up_with_email_screen.dart';
import 'package:community_app/widgets/common_app_bar.dart';
import 'package:community_app/widgets/custom_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends BaseStatefulWidgetState<SignUpScreen> {
  @override
  PreferredSizeWidget buildAppBar(BuildContext context) {
    return CommonAppBar(
      title: "Sign Up",
      showLeading: false,
    );
  }

  @override
  Widget buildBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Sign up with",
            style: theme.textTheme.subtitle2?.copyWith(
              color: kDarkTealColor,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 20),
          CustomButton(
            width: double.maxFinite,
            label: "Email",
            onTap: () {
              push(const SignUpWithEmailScreen());
            },
          ),
          const SizedBox(height: 20),
          Text(
            "OR",
            style: theme.textTheme.subtitle2?.copyWith(
              color: kDarkTealColor,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: const [
              Expanded(
                child: CustomButton(
                  color: Colors.indigo,
                  label: "Facebook",
                ),
              ),
              SizedBox(width: 15),
              Expanded(
                child: CustomButton(
                  color: Colors.blue,
                  label: "Twitter",
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          RichText(
            text: TextSpan(
                text: "already remember?",
                style: theme.textTheme.subtitle1?.copyWith(
                  color: kDarkTealColor,
                  fontSize: 13,
                ),
                children: [
                  TextSpan(
                    text: "  Sign in",
                    style: theme.textTheme.subtitle2?.copyWith(
                      color: kBlueColor,
                      fontSize: 14,
                    ),
                    recognizer: TapGestureRecognizer()..onTap = () {
                      pushReplacement(const SignInScreen());
                    },
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}
