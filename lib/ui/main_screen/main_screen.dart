import 'package:community_app/resources/color_resources.dart';
import 'package:community_app/ui/base/base_stateful_widget.dart';
import 'package:community_app/ui/chat_screen/chat_screen.dart';
import 'package:community_app/ui/create_post_screen/create_post_screen.dart';
import 'package:community_app/ui/home_screen/home_screen.dart';
import 'package:community_app/ui/members_screen/members_screen.dart';
import 'package:community_app/ui/profile_screen/profile_screen.dart';
import 'package:community_app/ui/settings_screen/settings_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends BaseStatefulWidgetState<MainScreen> {
  final _advancedDrawerController = AdvancedDrawerController();
  final List<Widget> _children = [
    const HomeScreen(),
    const MembersScreen(),
    const CreatePostScreen(),
    const ChatScreen(),
    const ProfileScreen(),
  ];
  int _currentIndex = 0;
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
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavigationBar(),
      floatingActionButton: _buildFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildBody() {
    return _children[_currentIndex];
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
      ],
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: kWhiteColor,
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      iconSize: 24,
      unselectedItemColor: kGreyColor,
      selectedItemColor: kBlueColor,
      unselectedFontSize: 14,
      selectedFontSize: 14,
      type: BottomNavigationBarType.fixed,
      items: [
        const BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.home),
          label: "Home",
        ),
        const BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.person_2),
          label: "Members",
        ),
        const BottomNavigationBarItem(
          icon: Icon(
            CupertinoIcons.person_2,
            color: kWhiteColor,
          ),
          label: "Create Post",
        ),
        const BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.chat_bubble_2),
          label: "Messages",
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            "assets/images/profile_image.png",
            height: 24,
            width: 24,
          ),
          label: "Profile",
        ),
      ],
    );
  }

  Widget _buildFloatingActionButton() {
    return SizedBox(
      height: 60,
      width: 60,
      child: FloatingActionButton(
        backgroundColor: Colors.transparent,
        elevation: 0,
        onPressed: () {
          setState(() {
            _currentIndex = 2;
          });
        },
        child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 5),
            shape: BoxShape.circle,
            color: kBlueColor,
          ),
          child: const Icon(Icons.photo_camera, size: 30),
        ),
      ),
    );
  }
}
