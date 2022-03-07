import 'package:community_app/resources/color_resources.dart';
import 'package:community_app/ui/base/base_stateful_widget.dart';
import 'package:community_app/ui/settings_screen/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends BaseStatefulWidgetState<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> _tabList = [
    "ID Card",
    "About",
    "Posts(1)",
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabList.length, vsync: this);
  }

  @override
  Color? get scaffoldBackgroundColor => kBlueColor.withOpacity(0.1);

  @override
  Widget buildBody() {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          expandedHeight: 320,
          automaticallyImplyLeading: false,
          pinned: true,
          actions: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 12),
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: kDarkGreyColor),
              ),
              child: Center(
                child: Text(
                  "Edit Profile",
                  style: theme.textTheme.bodyText1
                      ?.copyWith(color: kDarkGreyColor),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 12),
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const FaIcon(
                    FontAwesomeIcons.whatsapp,
                    color: kWhiteColor,
                    size: 18,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    "Share",
                    style:
                        theme.textTheme.bodyText1?.copyWith(color: kWhiteColor),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                push(const SettingsScreen());
              },
              icon: const Icon(Icons.settings),
              color: kDarkGreyColor,
            ),
            const SizedBox(width: 5),
          ],
          flexibleSpace: FlexibleSpaceBar(
            background: _buildUserProfileWidget(),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              color: kWhiteColor,
            ),
            child: Column(
              children: [
                Material(
                  color: Colors.transparent,
                  child: TabBar(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    tabs: List.generate(_tabList.length, (index) {
                      return Tab(
                        text: _tabList[index],
                      );
                    }),
                    controller: _tabController,
                    indicatorColor: kBlueColor,
                    indicatorWeight: 3,
                    labelColor: kBlueColor,
                    unselectedLabelColor: kDarkGreyColor,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.78,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      _buildIdCardWidget(),
                      Container(),
                      Container(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _buildUserProfileWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            child: Stack(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image:
                          Image.asset("assets/images/profile_image.png").image,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 3,
                  right: 3,
                  child: Container(
                    height: 24,
                    width: 24,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: kBlueColor,
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.edit,
                        color: kWhiteColor,
                        size: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "Inverrsee Bhatt",
            style: theme.textTheme.bodyText2?.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            "AHMEDABAD, GUJARAT, INDIA",
            style: theme.textTheme.bodyText2?.copyWith(
              color: kDarkGreyColor,
              fontWeight: FontWeight.w300,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text(
                      "100",
                      style: theme.textTheme.subtitle2?.copyWith(
                        color: kDarkGreyColor,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      "Followers",
                      style: theme.textTheme.bodyText1?.copyWith(
                        color: kDarkGreyColor,
                        fontSize: 13,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 40),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      "100",
                      style: theme.textTheme.subtitle2?.copyWith(
                        color: kDarkGreyColor,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      "Followings",
                      style: theme.textTheme.bodyText1?.copyWith(
                        color: kDarkGreyColor,
                        fontSize: 13,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 40),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      "100",
                      style: theme.textTheme.subtitle2?.copyWith(
                        color: kBlueColor,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      "Pratistha Points",
                      style: theme.textTheme.bodyText1?.copyWith(
                        color: kDarkGreyColor,
                        fontSize: 13,
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildIdCardWidget() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
        child: Column(
          children: [
            Container(
              width: double.maxFinite,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: kBlueColor),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                            image:
                                Image.asset("assets/images/video_image_1.jpg")
                                    .image,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "Community Name",
                        style: theme.textTheme.subtitle2?.copyWith(
                          color: kBlueColor,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: Image.asset(
                                    "assets/images/img_background_2.png")
                                .image,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "ID No.- 00001",
                            style: theme.textTheme.subtitle2?.copyWith(
                              color: kDarkGreyColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            "Inverrsee Bhatt",
                            style: theme.textTheme.subtitle2?.copyWith(
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            "Member",
                            style: theme.textTheme.subtitle2?.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: kBlueColor,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            "AHMEDABAD, GUJARAT, INDIA",
                            style: theme.textTheme.subtitle2?.copyWith(
                              fontSize: 11,
                              color: kGreyColor,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Share with friends and family.",
              style: theme.textTheme.subtitle2?.copyWith(color: kBlueColor),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.green,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    children: [
                      Text(
                        "Whatsapp",
                        style: theme.textTheme.subtitle2?.copyWith(
                          color: kWhiteColor,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        "Share",
                        style: theme.textTheme.subtitle1?.copyWith(
                          color: kWhiteColor,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 10),
                  const FaIcon(FontAwesomeIcons.whatsapp, color: kWhiteColor),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: kBlueColor,
              ),
              child: Text(
                "Copy link",
                style: theme.textTheme.subtitle2?.copyWith(
                  color: kWhiteColor,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: kDarkGreyColor,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Share",
                    style: theme.textTheme.subtitle1?.copyWith(
                      color: kWhiteColor,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Icon(Icons.share, color: kWhiteColor, size: 16),
                ],
              ),
            ),
          ],
        ),
      ),
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
