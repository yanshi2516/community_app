import 'package:community_app/resources/color_resources.dart';
import 'package:community_app/ui/base/base_stateful_widget.dart';
import 'package:community_app/ui/chat_screen/chat_screen.dart';
import 'package:community_app/ui/find_friend_screen/find_friend_screen.dart';
import 'package:community_app/ui/home_screen/home_screen.dart';
import 'package:community_app/ui/notification_screen/notification_screen.dart';
import 'package:community_app/ui/profile_screen/profile_screen.dart';
import 'package:community_app/widgets/common_app_bar.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends BaseStatefulWidgetState<MainScreen> {
  final List<IconData> _list = [
    Icons.home_outlined,
    Icons.chat_bubble_outline,
    Icons.notifications_none_outlined,
    Icons.account_circle_outlined,
  ];
  final List<Widget> _children = [
    const HomeScreen(),
    const ChatScreen(),
    const NotificationScreen(),
    const ProfileScreen(),
  ];
  int _currentIndex = -1;

  @override
  PreferredSizeWidget buildAppBar(BuildContext context) {
    String title = "";
    if (_currentIndex == -1) {
      title = "Find Friend";
    } else if (_currentIndex == 0) {
      title = "Home";
    } else if (_currentIndex == 1) {
      title = "Chats";
    } else if (_currentIndex == 2) {
      title = "Notifications";
    } else if (_currentIndex == 3) {
      title = "Profile";
    }
    return CommonAppBar(
      title: title,
      leadingIcon: _currentIndex == -1
          ? Text(
              "Cancel",
              style: theme.textTheme.subtitle1?.copyWith(
                fontSize: 14,
                letterSpacing: 0.8,
                color: kWhiteColor,
              ),
            )
          : const Icon(Icons.menu),
      showLeading: true,
      onLeadingIconTap: () {
        if (_currentIndex == -1) {
          setState(() {
            _currentIndex = 0;
          });
        } else {
          rootScaffoldKey.currentState?.openDrawer();
        }
      },
      actions: [
        if (_currentIndex == -1)
          IconButton(
            constraints: const BoxConstraints(maxWidth: 90, minWidth: 80),
            onPressed: () {
              if (_currentIndex == -1) {
                setState(() {
                  _currentIndex = 0;
                });
              } else {
                rootScaffoldKey.currentState?.openDrawer();
              }
            },
            icon: Text(
              "Next",
              style: theme.textTheme.subtitle1?.copyWith(
                fontSize: 14,
                letterSpacing: 0.8,
                color: kWhiteColor,
              ),
            ),
          ),
        if (_currentIndex != -1)
          IconButton(
            onPressed: () {},
            icon: Container(
              height: 44,
              width: 44,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: kWhiteColor.withOpacity(0.25),
              ),
              child: const Center(
                child: Icon(
                  Icons.search,
                  color: kWhiteColor,
                  size: 20,
                ),
              ),
            ),
          ),
      ],
    );
  }

  @override
  Widget buildDrawer(BuildContext context) {
    return const Drawer();
  }

  @override
  Widget buildBody() {
    if (_currentIndex == -1) {
      return const FindFriendScreen();
    } else {
      return _children[_currentIndex];
    }
  }

  @override
  Widget buildBottomNavigationBar(BuildContext context) {
    return Container(
      height: 55,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: kLightGreyColor,
            blurRadius: 5,
            spreadRadius: 3,
          ),
        ],
      ),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(_list.length, (index) {
          return InkWell(
            onTap: () {
              if (_currentIndex != index) {
                setState(() {
                  _currentIndex = index;
                });
              }
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  _list[index],
                  color: _currentIndex == index ? kBlueColor : kGreyColor,
                ),
                if (_currentIndex == index) const SizedBox(height: 5),
                if (_currentIndex == index)
                  Container(
                    height: 8,
                    width: 8,
                    decoration: const BoxDecoration(
                      color: kBlueColor,
                      shape: BoxShape.circle,
                    ),
                  ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
