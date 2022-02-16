import 'package:community_app/resources/color_resources.dart';
import 'package:community_app/ui/base/base_stateful_widget.dart';
import 'package:community_app/ui/main_screen/main_screen.dart';
import 'package:community_app/widgets/common_app_bar.dart';
import 'package:community_app/widgets/custom_button.dart';
import 'package:community_app/widgets/entry_field.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends BaseStatefulWidgetState<SignInScreen> {
  bool _isRemember = false;

  @override
  PreferredSizeWidget buildAppBar(BuildContext context) {
    return CommonAppBar(
      title: "Sign In",
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
          Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              child: Text(
                "Forgot Password?",
                style: theme.textTheme.subtitle1?.copyWith(
                  color: kBlueColor,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Checkbox(
                value: _isRemember,
                onChanged: (value) {
                  setState(() {
                    _isRemember = value ?? false;
                  });
                },
              ),
              Text(
                "Remember Me",
                style: theme.textTheme.subtitle2?.copyWith(
                  color: kGreyColor,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          CustomButton(
            label: "Sign In",
            width: double.maxFinite,
            onTap: () {
              pushAndClearStack(
                const MainScreen(),
                context: context,
              );
            },
          ),
          const SizedBox(height: 40),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 0.5,
                  color: kGreyColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "OR",
                  style: theme.textTheme.subtitle2?.copyWith(
                    color: kGreyColor,
                    fontSize: 13,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 0.5,
                  color: kGreyColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
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
        ],
      ),
    );
  }
}
