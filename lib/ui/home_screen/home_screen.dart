import 'package:community_app/resources/color_resources.dart';
import 'package:community_app/ui/base/base_stateful_widget.dart';
import 'package:community_app/ui/home_screen/admin_posts_widget.dart';
import 'package:community_app/ui/home_screen/admin_widget.dart';
import 'package:community_app/ui/home_screen/committee_widget.dart';
import 'package:community_app/ui/home_screen/new_post_widget.dart';
import 'package:community_app/ui/home_screen/trending_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseStatefulWidgetState<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> _tabList = [
    "Admin",
    "Committee",
    "New Post",
    "Trending",
    "Admin Posts",
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: _tabList.length,
      vsync: this,
      initialIndex: 3,
    );
  }

  @override
  PreferredSizeWidget buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 5,
      backgroundColor: kWhiteColor,
      title: Text(
        "Home",
        style: theme.textTheme.subtitle2,
      ),
      titleSpacing: 0.0,
      leading: IconButton(
        onPressed: () {},
        icon: Image.asset(
          "assets/images/profile_image.png",
          height: 30,
          width: 30,
          fit: BoxFit.fill,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              color: kBlueColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const FaIcon(
                  FontAwesomeIcons.medal,
                  color: Colors.amber,
                  size: 16,
                ),
                const SizedBox(width: 5),
                Text(
                  "5",
                  style: theme.textTheme.subtitle1,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 10),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications_none_outlined),
          color: kBlueColor,
        ),
        const SizedBox(width: 10),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: TabBar(
          indicatorWeight: 3,
          indicatorColor: kBlueColor,
          isScrollable: true,
          labelColor: kBlueColor,
          unselectedLabelColor: kGreyColor,
          controller: _tabController,
          tabs: List.generate(_tabList.length, (index) {
            return Tab(text: _tabList[index]);
          }),
        ),
      ),
    );
  }

  @override
  Widget buildBody() {
    return TabBarView(
      controller: _tabController,
      children: const [
        AdminWidget(),
        CommitteeWidget(),
        NewPostWidget(),
        TrendingWidget(),
        AdminPostsWidget(),
      ],
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
