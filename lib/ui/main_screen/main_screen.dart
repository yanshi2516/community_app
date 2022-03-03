import 'package:community_app/resources/color_resources.dart';
import 'package:community_app/ui/base/base_stateful_widget.dart';
import 'package:community_app/ui/chat_screen/chat_screen.dart';
import 'package:community_app/ui/find_friend_screen/find_friend_screen.dart';
import 'package:community_app/ui/home_screen/home_screen.dart';
import 'package:community_app/ui/notification_screen/notification_screen.dart';
import 'package:community_app/ui/profile_screen/profile_screen.dart';
import 'package:community_app/ui/settings_screen/settings_screen.dart';
import 'package:community_app/widgets/common_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends BaseStatefulWidgetState<MainScreen> {
  final _advancedDrawerController = AdvancedDrawerController();
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
  bool _isDrawerOpened = false;

  @override
  void initState() {
    super.initState();
    _advancedDrawerController.addListener(() {
      setState(() {
        _isDrawerOpened = _advancedDrawerController.value.visible;
      });
    });
  }

  PreferredSizeWidget _buildAppBar() {
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
          _advancedDrawerController.showDrawer();
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
  Widget buildBody() {
    return AdvancedDrawer(
      controller: _advancedDrawerController,
      backdropColor: kBlueColor,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: _isDrawerOpened ? _buildDrawerScaffold() : _buildScaffold(),
      drawer: _buildDrawer(),
    );
  }

  Widget _buildDrawerScaffold() {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          height: double.maxFinite,
          width: 10,
          decoration: BoxDecoration(
            color: kWhiteColor.withOpacity(0.5),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
          ),
        ),
        Container(
          width: 200,
          height: double.maxFinite,
          decoration: const BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildScaffold() {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBody() {
    if (_currentIndex == -1) {
      return const FindFriendScreen();
    } else {
      return _children[_currentIndex];
    }
  }

  Widget _buildDrawer() {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: IconButton(
            icon: const Icon(Icons.close),
            iconSize: 30,
            color: kWhiteColor,
            onPressed: () {
              _advancedDrawerController.hideDrawer();
            },
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Text(
              "Menu",
              style: theme.textTheme.bodyText2?.copyWith(
                color: kWhiteColor,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: Image.asset("assets/images/video_image_2.jpg").image,
                    fit: BoxFit.fill,
                  ),
                  border: Border.all(color: kWhiteColor, width: 3),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Inverrsee Bhatt",
                style: theme.textTheme.bodyText2?.copyWith(
                  fontSize: 20,
                  color: kWhiteColor,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                "yourname@gmail.com",
                style: theme.textTheme.bodyText2?.copyWith(
                  fontSize: 12,
                  color: kWhiteColor,
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(height: 50),
              ListTile(
                onTap: () {
                  _advancedDrawerController.hideDrawer();
                },
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Discover',
                      style: theme.textTheme.subtitle1?.copyWith(
                        color: kWhiteColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                dense: true,
              ),
              ListTile(
                onTap: () {
                  _advancedDrawerController.hideDrawer();
                },
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Messages',
                      style: theme.textTheme.subtitle1?.copyWith(
                        color: kWhiteColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                dense: true,
              ),
              ListTile(
                onTap: () {
                  _advancedDrawerController.hideDrawer();
                },
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Friends',
                      style: theme.textTheme.subtitle1?.copyWith(
                        color: kWhiteColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                dense: true,
              ),
              ListTile(
                onTap: () {
                  _advancedDrawerController.hideDrawer();
                },
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Groups',
                      style: theme.textTheme.subtitle1?.copyWith(
                        color: kWhiteColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                dense: true,
              ),
              ListTile(
                onTap: () {
                  _advancedDrawerController.hideDrawer();
                },
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Invite Friends',
                      style: theme.textTheme.subtitle1?.copyWith(
                        color: kWhiteColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                dense: true,
              ),
              ListTile(
                dense: true,
                onTap: () {
                  _advancedDrawerController.hideDrawer();
                  push(const SettingsScreen());
                },
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Settings',
                      style: theme.textTheme.subtitle1?.copyWith(
                        color: kWhiteColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        /*Column(
          children: [
            ,
            ,
            ,

            Spacer(),
            DefaultTextStyle(
              style: TextStyle(
                fontSize: 12,
                color: Colors.white54,
              ),
              child: Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 16.0,
                ),
                child: Text('Terms of Service | Privacy Policy'),
              ),
            ),
          ],
        ),*/
        /**/
      ],
    );
  }

  Widget _buildBottomNavigationBar() {
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
