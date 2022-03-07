import 'package:community_app/resources/color_resources.dart';
import 'package:community_app/ui/base/base_stateful_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminWidget extends StatefulWidget {
  const AdminWidget({Key? key}) : super(key: key);

  @override
  State<AdminWidget> createState() => _AdminWidgetState();
}

class _AdminWidgetState extends BaseStatefulWidgetState<AdminWidget> {
  @override
  Widget buildBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Admin",
              style: theme.textTheme.subtitle2?.copyWith(
                color: kBlueColor,
              ),
            ),
            const SizedBox(height: 20),
            ListView.separated(
              separatorBuilder: (context, index) {
                return const SizedBox(height: 15);
              },
              itemCount: 3,
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: kBlueColor, width: 3),
                              image: DecorationImage(
                                image: Image.asset(
                                        "assets/images/profile_image.png")
                                    .image,
                                fit: BoxFit.fill,
                              )),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: kBlueColor,
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 5,
                            vertical: 2,
                          ),
                          child: Text(
                            "Admin",
                            style: theme.textTheme.bodyText1?.copyWith(
                              color: kWhiteColor,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Team Admin",
                            style: theme.textTheme.subtitle1?.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            "Ahmedabad, Gujarat, India",
                            style: theme.textTheme.subtitle1?.copyWith(
                              fontSize: 13,
                              color: kGreyColor,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: kDarkTealColor),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  CupertinoIcons.person_2,
                                  color: kDarkTealColor,
                                  size: 18,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  "Following",
                                  style: theme.textTheme.bodyText1?.copyWith(
                                    color: kDarkTealColor,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
