import 'package:community_app/resources/color_resources.dart';
import 'package:community_app/ui/base/base_stateful_widget.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends BaseStatefulWidgetState<ProfileScreen> {
  @override
  Widget buildBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 20,
        ),
        child: Column(
          children: [
            _buildUserProfileWidget(),
            const SizedBox(height: 40),
            _buildFollowersAndFollowingWidget(),
            const SizedBox(height: 40),
            _buildStoriesWidget(),
            const SizedBox(height: 40),
            _buildPostsWidget(),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildUserProfileWidget() {
    return Row(
      children: [
        SizedBox(
          height: 105,
          width: 105,
          child: Stack(
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: kBlueColor,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: Image.asset("assets/images/video_image_1.jpg").image,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: kBlueColor,
                    border: Border.all(color: kWhiteColor),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.add,
                      color: kWhiteColor,
                      size: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Inverrsee Bhatt",
                style: theme.textTheme.bodyText2?.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "UI Designer",
                style: theme.textTheme.bodyText2?.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: kDarkGreyColor,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                "www.yourname@gmail.com",
                style: theme.textTheme.bodyText2?.copyWith(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: kBlueColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFollowersAndFollowingWidget() {
    return Row(
      children: [
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: Column(
              children: [
                Text(
                  "Following".toUpperCase(),
                  style: theme.textTheme.subtitle2?.copyWith(
                    color: kDarkTealColor,
                    fontSize: 14,
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  "100",
                  style: theme.textTheme.subtitle2?.copyWith(
                    color: kDarkTealColor,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 40),
        Expanded(
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              children: [
                Text(
                  "Followers".toUpperCase(),
                  style: theme.textTheme.subtitle2?.copyWith(
                    color: kDarkTealColor,
                    fontSize: 14,
                    letterSpacing: 1.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  "1500",
                  style: theme.textTheme.subtitle2?.copyWith(
                    color: kDarkTealColor,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStoriesWidget() {
    return SizedBox(
      height: 90,
      child: Align(
        alignment: Alignment.centerLeft,
        child: ListView.separated(
          itemCount: 3,
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) {
            return const SizedBox(width: 15);
          },
          itemBuilder: (context, index) {
            if (index == 0) {
              return Column(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: kLightGreyColor.withOpacity(0.5),
                      border: Border.all(
                        color: kDarkTealColor.withOpacity(0.2),
                        width: 2.5,
                      ),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.add,
                        size: 40,
                        color: kDarkTealColor.withOpacity(0.5),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "New",
                    style: theme.textTheme.subtitle1?.copyWith(
                      color: kDarkTealColor,
                      fontSize: 16,
                    ),
                  ),
                ],
              );
            } else {
              return Column(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: kDarkTealColor.withOpacity(0.5),
                        width: 2.5,
                      ),
                      image: DecorationImage(
                        image: Image.asset("assets/images/profile_image.png")
                            .image,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Food",
                    style: theme.textTheme.subtitle1?.copyWith(
                      color: kDarkTealColor,
                      fontSize: 16,
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildPostsWidget() {
    return GridView.builder(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemCount: 9,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: kLightGreyColor,
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: Image.asset("assets/images/video_image_1.jpg").image,
                fit: BoxFit.fill,
              ),
            ),
          );
        });
  }
}
