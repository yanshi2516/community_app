import 'package:community_app/resources/color_resources.dart';
import 'package:community_app/ui/base/base_stateful_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommitteeWidget extends StatefulWidget {
  const CommitteeWidget({Key? key}) : super(key: key);

  @override
  State<CommitteeWidget> createState() => _CommitteeWidgetState();
}

class _CommitteeWidgetState extends BaseStatefulWidgetState<CommitteeWidget> {
  @override
  Color? get scaffoldBackgroundColor => kLightGreyColor.withOpacity(0.3);

  @override
  Widget buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 20),
          Container(
            width: double.maxFinite,
            color: kWhiteColor,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Text(
              "Committee Members(5)",
              style: theme.textTheme.subtitle2?.copyWith(
                color: kBlueColor,
              ),
            ),
          ),
          Container(
            color: kWhiteColor,
            height: 10,
          ),
          ListView.separated(
            separatorBuilder: (context, index) {
              return Container(
                color: kWhiteColor,
                height: 15,
              );
            },
            itemCount: 5,
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                color: kWhiteColor,
                child: Row(
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
                            "Team ABC",
                            style: theme.textTheme.subtitle1?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "Ahmedabad, Gujarat, India",
                            style: theme.textTheme.subtitle1?.copyWith(
                              fontSize: 13,
                              color: kDarkTealColor,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
          Container(
            color: kWhiteColor,
            height: 20,
          ),
        ],
      ),
    );
  }
}
