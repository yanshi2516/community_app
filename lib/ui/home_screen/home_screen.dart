import 'package:community_app/resources/color_resources.dart';
import 'package:community_app/ui/base/base_stateful_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseStatefulWidgetState<HomeScreen> {
  @override
  Widget buildBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          children: [
            // _buildStoriesWidget(),
            _buildFeedListWidget(),
          ],
        ),
      ),
    );
  }

  /*Widget _buildStoriesWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Stories",
          style: theme.textTheme.subtitle2?.copyWith(
            color: kDarkTealColor,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 25),
        SizedBox(
          height: 100,
          child: ListView.separated(
            itemCount: 10,
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return SizedBox(
                width: 80,
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: Image.asset("assets/images/profile_image.png")
                              .image,
                          fit: BoxFit.fill,
                        ),
                        border: Border.all(color: kBlueColor, width: 3),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Inverrsee Bhatt",
                      style: theme.textTheme.bodyText2?.copyWith(
                        fontSize: 14,
                        color: kDarkTealColor,
                        letterSpacing: 0.2,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(width: 16);
            },
          ),
        ),
      ],
    );
  }*/

  Widget _buildFeedListWidget() {
    return ListView.separated(
      itemCount: 10,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemBuilder: (context, index) {
        return const SizedBox(height: 10);
      },
      separatorBuilder: (context, index) {
        return Column(
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: Image.asset("assets/images/profile_image.png").image,
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
              subtitle: Text(
                "San Francisco",
                style: theme.textTheme.bodyText2?.copyWith(
                  fontSize: 14,
                  color: kGreyColor.withOpacity(0.6),
                  letterSpacing: 0.5,
                ),
              ),
              trailing: const Icon(
                Icons.more_horiz,
                color: kDarkTealColor,
              ),
            ),
            Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
              style: theme.textTheme.bodyText2?.copyWith(
                color: kDarkTealColor.withOpacity(0.8),
                fontSize: 12,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 200,
              width: double.maxFinite,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: Image.asset("assets/images/post_image.png").image,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(
                  Icons.favorite_border,
                  color: kDarkTealColor,
                ),
                const SizedBox(width: 5),
                Text(
                  "100K",
                  style: theme.textTheme.bodyText2?.copyWith(
                    color: kDarkTealColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 20),
                const Icon(
                  Icons.chat_bubble_outline,
                  color: kDarkTealColor,
                ),
                const SizedBox(width: 5),
                Text(
                  "2K",
                  style: theme.textTheme.bodyText2?.copyWith(
                    color: kDarkTealColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.bookmark_border,
                  color: kDarkTealColor,
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
