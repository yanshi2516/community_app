import 'package:community_app/resources/color_resources.dart';
import 'package:community_app/ui/base/base_stateful_widget.dart';
import 'package:community_app/widgets/common_app_bar.dart';
import 'package:flutter/material.dart';

class FindFriendScreen extends StatefulWidget {
  const FindFriendScreen({Key? key}) : super(key: key);

  @override
  _FindFriendScreenState createState() => _FindFriendScreenState();
}

class _FindFriendScreenState extends BaseStatefulWidgetState<FindFriendScreen> {
  @override
  Widget buildBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          children: [
            _buildSearchWidget(),
            _buildFriendsListWidget(),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchWidget() {
    return TextFormField(
      style: Theme.of(context).textTheme.bodyText2?.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        isDense: true,
        prefixIcon: const Icon(Icons.search),
        label: const Text("Search"),
        labelStyle: Theme.of(context).textTheme.bodyText2?.copyWith(
              fontSize: 14,
              color: kGreyColor,
              fontWeight: FontWeight.w600,
            ),
        filled: true,
        fillColor: kDarkTealColor.withOpacity(0.1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        counter: const SizedBox.shrink(),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      ),
    );
  }

  Widget _buildFriendsListWidget() {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return const Divider();
      },
      itemCount: 20,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemBuilder: (context, index) {
        return ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(
            "Inverrsee Bhatt",
            style: theme.textTheme.bodyText2?.copyWith(
              fontSize: 16,
              color: kDarkTealColor,
              letterSpacing: 0.5,
            ),
          ),
          leading: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: Image.asset("assets/images/profile_image.png").image,
                fit: BoxFit.fill,
              ),
            ),
          ),
          subtitle: Text(
            "You're friend on instagram",
            style: theme.textTheme.bodyText2?.copyWith(
              fontSize: 14,
              color: kGreyColor.withOpacity(0.6),
              letterSpacing: 0.5,
            ),
          ),
          trailing: const Icon(
            Icons.check_circle,
            color: kBlueColor,
            size: 30,
          ),
        );
      },
    );
  }
}
