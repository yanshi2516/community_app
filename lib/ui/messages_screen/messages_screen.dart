import 'package:community_app/resources/color_resources.dart';
import 'package:community_app/ui/base/base_stateful_widget.dart';
import 'package:community_app/ui/call_screen/audio_call_screen.dart';
import 'package:community_app/ui/call_screen/video_call_screen.dart';
import 'package:community_app/ui/chat_detail_screen/chat_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends BaseStatefulWidgetState<MessagesScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> _tabList = [
    "Messages",
    "My Chat Groups",
    "Your Contacts",
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabList.length, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  PreferredSizeWidget buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: kBlueColor,
      automaticallyImplyLeading: false,
      title: Text(
        "Messages",
        style: theme.textTheme.subtitle2?.copyWith(color: kWhiteColor),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_vert),
        ),
        const SizedBox(width: 10),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15),
            TabBar(
              tabs: List.generate(_tabList.length, (index) {
                return Tab(
                  text: _tabList[index],
                );
              }),
              controller: _tabController,
              indicatorColor: kWhiteColor,
              indicatorWeight: 3,
              labelColor: kWhiteColor,
              unselectedLabelColor: kWhiteColor.withOpacity(0.5),
              isScrollable: true,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget buildBody() {
    return TabBarView(
      controller: _tabController,
      children: [
        _buildChatListWidget(),
        _buildChatListWidget(),
        _buildCallsListWidget(),
      ],
    );
  }

  Widget _buildChatListWidget() {
    return ListView.separated(
      itemCount: 10,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      separatorBuilder: (context, index) {
        return const Divider();
      },
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            push(const ChatDetailScreen());
          },
          dense: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          minLeadingWidth: 60,
          leading: SizedBox(
            width: 50,
            child: Stack(
              children: [
                Container(
                  height: 50,
                  width: 50,
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
                  bottom: 1,
                  right: 0,
                  child: Container(
                    height: 12,
                    width: 12,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green,
                      border: Border.all(color: kWhiteColor),
                    ),
                  ),
                ),
              ],
            ),
          ),
          title: Text(
            "Inverrsee Bhatt",
            style: theme.textTheme.subtitle2?.copyWith(
              fontSize: 15,
              letterSpacing: 0.5,
            ),
          ),
          subtitle: Text(
            "Lorem Ipsum is simply dummy text",
            style: theme.textTheme.bodyText2?.copyWith(
              fontSize: 13,
              color: kDarkGreyColor,
              letterSpacing: 0.5,
              fontWeight: FontWeight.w300,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "2 mins",
                style: theme.textTheme.bodyText2?.copyWith(
                  fontSize: 12,
                  color: kGreyColor.withOpacity(0.8),
                  letterSpacing: 0.5,
                ),
              ),
              Container(
                height: 25,
                width: 25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: kBlueColor,
                ),
                child: Center(
                  child: Text(
                    "10",
                    style: theme.textTheme.subtitle2?.copyWith(
                      fontSize: 14,
                      color: kWhiteColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCallsListWidget() {
    return ListView.separated(
      itemBuilder: (context, index) {
        return ListTile(
          contentPadding:
          const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          tileColor: kWhiteColor,
          leading: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: kLightGreyColor.withOpacity(0.5),
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Icon(
                Icons.person_add_alt_sharp,
                size: 36,
                color: kWhiteColor,
              ),
            ),
          ),
          title: Text(
            "User",
            style: theme.textTheme.subtitle2,
          ),
          subtitle: Text(
            "12345 67890",
            style: theme.textTheme.bodyText2?.copyWith(
              fontSize: 12,
              color: kGreyColor,
            ),
          ),
          trailing: Container(
            height: 30,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.green,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const FaIcon(
                  FontAwesomeIcons.whatsapp,
                  color: kWhiteColor,
                  size: 18,
                ),
                const SizedBox(width: 5),
                Text(
                  "INVITE",
                  style: theme.textTheme.bodyText1?.copyWith(
                    color: kWhiteColor,
                    fontSize: 14,
                  ),
                )
              ],
            ),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 0.8);
      },
      itemCount: 10,
    );
  }
}
