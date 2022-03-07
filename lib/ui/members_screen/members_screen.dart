import 'package:community_app/resources/color_resources.dart';
import 'package:community_app/ui/base/base_stateful_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MembersScreen extends StatefulWidget {
  const MembersScreen({Key? key}) : super(key: key);

  @override
  _MembersScreenState createState() => _MembersScreenState();
}

class _MembersScreenState extends BaseStatefulWidgetState<MembersScreen>
    with SingleTickerProviderStateMixin {
  final List<String> _tabList = [
    "All Members(1000)",
    "Committee Members(500)",
    "Your contacts",
  ];
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabList.length, vsync: this);
  }

  @override
  PreferredSizeWidget buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: kBlueColor,
      titleSpacing: 0.0,
      automaticallyImplyLeading: false,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextFormField(
          decoration: InputDecoration(
            hintText: "Search by name, registration number",
            hintStyle: theme.textTheme.bodyText1?.copyWith(
              color: kGreyColor,
            ),
            filled: true,
            fillColor: kWhiteColor,
            border: InputBorder.none,
            suffixIcon: const Icon(Icons.search),
            suffixIconColor: kGreyColor,
          ),
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(110),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text(
                    "All States",
                    style: theme.textTheme.subtitle2?.copyWith(
                      fontSize: 16,
                      color: kWhiteColor,
                    ),
                  ),
                  const SizedBox(width: 5),
                  const Icon(
                    Icons.arrow_drop_down,
                    color: kWhiteColor,
                  ),
                ],
              ),
            ),
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
  Color? get scaffoldBackgroundColor => kLightGreyColor.withOpacity(0.3);

  @override
  Widget buildBody() {
    return TabBarView(
      controller: _tabController,
      children: [
        _buildMembersWidget(),
        _buildMembersWidget(),
        _buildContactsWidget(),
      ],
    );
  }

  Widget _buildMembersWidget() {
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
                Icons.person,
                size: 36,
                color: kWhiteColor,
              ),
            ),
          ),
          title: Text(
            "Test User",
            style: theme.textTheme.subtitle2,
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "AHMEDABAD, GUJARAT",
                style: theme.textTheme.bodyText2?.copyWith(
                  fontSize: 9,
                  color: kGreyColor.withOpacity(0.6),
                ),
              ),
              const SizedBox(height: 3),
              Container(
                width: 80,
                height: 18,
                decoration: BoxDecoration(
                  border: Border.all(color: kBlueColor),
                  color: kBlueColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(2),
                ),
                child: Center(
                  child: Text(
                    "ID No.- 00001",
                    style: theme.textTheme.bodyText1?.copyWith(
                      fontSize: 9,
                      color: kBlueColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
          trailing: Container(
            height: 30,
            width: 100,
            decoration: BoxDecoration(
              border: Border.all(color: kBlueColor),
              borderRadius: BorderRadius.circular(2),
            ),
            child: Center(
              child: Text(
                "Message",
                style: theme.textTheme.bodyText1?.copyWith(
                  color: kBlueColor,
                ),
              ),
            ),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 8);
      },
      itemCount: 10,
    );
  }

  Widget _buildContactsWidget() {
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
