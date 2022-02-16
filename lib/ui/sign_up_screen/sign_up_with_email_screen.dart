import 'package:community_app/resources/color_resources.dart';
import 'package:community_app/ui/base/base_stateful_widget.dart';
import 'package:community_app/ui/main_screen/main_screen.dart';
import 'package:community_app/ui/sign_in_screen/sign_in_screen.dart';
import 'package:community_app/widgets/common_app_bar.dart';
import 'package:community_app/widgets/custom_button.dart';
import 'package:community_app/widgets/entry_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpWithEmailScreen extends StatefulWidget {
  const SignUpWithEmailScreen({Key? key}) : super(key: key);

  @override
  _SignUpWithEmailScreenState createState() => _SignUpWithEmailScreenState();
}

class _SignUpWithEmailScreenState
    extends BaseStatefulWidgetState<SignUpWithEmailScreen> {
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
          EntryField(
            hint: "Email",
          ),
          const SizedBox(height: 20),
          EntryField(
            hint: "Password",
            obscureText: true,
          ),
          const SizedBox(height: 20),
          EntryField(
            hint: "Confirm Password",
            obscureText: true,
          ),
          const SizedBox(height: 40),
          CustomButton(
            label: "Sign Up",
            width: double.maxFinite,
            onTap: () {
              pushAndClearStack(
                const MainScreen(),
                context: context,
              );
            },
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
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
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
