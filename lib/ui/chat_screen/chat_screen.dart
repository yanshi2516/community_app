import 'package:community_app/resources/color_resources.dart';
import 'package:community_app/ui/base/base_stateful_widget.dart';
import 'package:community_app/ui/call_screen/audio_call_screen.dart';
import 'package:community_app/ui/call_screen/video_call_screen.dart';
import 'package:community_app/ui/chat_detail_screen/chat_detail_screen.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends BaseStatefulWidgetState<ChatScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> _tabList = [
    "Chats",
    "Calls",
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
  Widget buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: List.generate(
            _tabList.length,
            (index) {
              return Tab(text: _tabList[index]);
            },
          ),
          indicatorWeight: 3,
          indicatorColor: kBlueColor,
          labelColor: kBlueColor,
          labelPadding: const EdgeInsets.symmetric(horizontal: 30),
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorPadding: const EdgeInsets.symmetric(horizontal: 30),
          unselectedLabelColor: kDarkTealColor,
          unselectedLabelStyle: theme.textTheme.subtitle1?.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.8,
          ),
          labelStyle: theme.textTheme.subtitle1?.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.8,
          ),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              _buildChatListWidget(),
              _buildCallsListWidget(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildChatListWidget() {
    return ListView.separated(
      itemCount: 10,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      separatorBuilder: (context, index) {
        return const SizedBox(height: 10);
      },
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            push(const ChatDetailScreen());
          },
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
            style: theme.textTheme.bodyText2?.copyWith(
              fontSize: 16,
              color: kDarkTealColor,
              letterSpacing: 0.5,
            ),
          ),
          subtitle: Text(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
            style: theme.textTheme.bodyText2?.copyWith(
              fontSize: 14,
              color: kGreyColor.withOpacity(0.6),
              letterSpacing: 0.5,
            ),
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
      itemCount: 10,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      separatorBuilder: (context, index) {
        return const SizedBox(height: 10);
      },
      itemBuilder: (context, index) {
        return ListTile(
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
            style: theme.textTheme.bodyText2?.copyWith(
              fontSize: 16,
              color: kDarkTealColor,
              letterSpacing: 0.5,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 3),
              Text(
                "Missed Call",
                style: theme.textTheme.bodyText2?.copyWith(
                  fontSize: 14,
                  color: Colors.red,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                "2 mins",
                style: theme.textTheme.bodyText2?.copyWith(
                  fontSize: 12,
                  color: kGreyColor.withOpacity(0.8),
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () {
                  push(const VideoCallScreen());
                },
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: Icon(
                    Icons.videocam_outlined,
                    color: kLightBlueColor,
                    size: 25,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              InkWell(
                onTap: () {
                  push(const AudioCallScreen());
                },
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: Icon(
                    Icons.call_outlined,
                    color: kLightBlueColor,
                    size: 21,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
