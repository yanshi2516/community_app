import 'package:community_app/resources/color_resources.dart';
import 'package:community_app/ui/base/base_stateful_widget.dart';
import 'package:flutter/material.dart';

class LiveScreen extends StatefulWidget {
  const LiveScreen({Key? key}) : super(key: key);

  @override
  _LiveScreenState createState() => _LiveScreenState();
}

class _LiveScreenState extends BaseStatefulWidgetState<LiveScreen> {
  final List<String> _categoryList = [
    "Food",
    "Love",
    "Romance",
    "Stylish",
    "Fashion",
    "Decoration",
    "Home Decor",
    "Furniture",
  ];

  @override
  Widget buildBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          children: [
            _buildCategoryListWidget(),
            const SizedBox(height: 20),
            _buildFeedListWidget(),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryListWidget() {
    return SizedBox(
      height: 32,
      child: ListView.separated(
        itemCount: _categoryList.length,
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: kBlueColor),
            ),
            child: Center(
              child: Text(
                _categoryList[index],
                style: theme.textTheme.subtitle1?.copyWith(color: kBlueColor),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(width: 10);
        },
      ),
    );
  }

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
                "28 minutes ago",
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
            const SizedBox(height: 10),
            Container(
              height: 150,
              width: double.maxFinite,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: Image.asset("assets/images/post_image.png").image,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Expanded(
                  child: Center(
                    child: Icon(
                      Icons.thumb_up_alt_outlined,
                      color: kDarkTealColor,
                    ),
                  ),
                ),
                Container(
                  width: 0.4,
                  height: 25,
                  color: kDarkTealColor.withOpacity(0.5),
                ),
                const Expanded(
                  child: Center(
                    child: Icon(
                      Icons.mode_comment_outlined,
                      color: kDarkTealColor,
                    ),
                  ),
                ),
                Container(
                  width: 0.4,
                  height: 25,
                  color: kDarkTealColor.withOpacity(0.5),
                ),
                const Expanded(
                  child: Center(
                    child: Icon(
                      Icons.upload_outlined,
                      color: kDarkTealColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
