import 'package:community_app/resources/color_resources.dart';
import 'package:community_app/ui/base/base_stateful_widget.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState
    extends BaseStatefulWidgetState<NotificationScreen> {
  @override
  Widget buildBody() {
    return ListView.separated(
      itemCount: 20,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
      itemBuilder: (context, index) {
        return Container(
          width: double.maxFinite,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: kWhiteColor,
            boxShadow: [
              BoxShadow(
                color: kDarkTealColor.withOpacity(0.1),
                blurRadius: 5,
                spreadRadius: 3,
              ),
            ],
          ),
          child: Column(
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                dense: true,
                leading: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image:
                          Image.asset("assets/images/profile_image.png").image,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                title: Text(
                  "Inverrsee Bhatt",
                  style: theme.textTheme.bodyText2?.copyWith(
                    fontSize: 16,
                    color: kDarkTealColor,
                    letterSpacing: 0.5,
                  ),
                ),
                trailing: Text(
                  "12 mins",
                  style: theme.textTheme.bodyText2?.copyWith(
                    fontSize: 12,
                    color: kDarkTealColor,
                  ),
                ),
              ),
              Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
                style: theme.textTheme.bodyText1?.copyWith(
                  color: kDarkTealColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 25);
      },
    );
  }
}
