import 'package:community_app/resources/color_resources.dart';
import 'package:community_app/ui/base/base_stateful_widget.dart';
import 'package:flutter/material.dart';

class ChatDetailScreen extends StatefulWidget {
  const ChatDetailScreen({Key? key}) : super(key: key);

  @override
  _ChatDetailScreenState createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends BaseStatefulWidgetState<ChatDetailScreen> {
  @override
  PreferredSizeWidget buildAppBar(BuildContext context) {
    return AppBar(
      bottom: PreferredSize(
        child: Container(),
        preferredSize: const Size(double.maxFinite, 30),
      ),
      leading: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.keyboard_arrow_left),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          SizedBox(
            width: 40,
            child: Stack(
              children: [
                Container(
                  height: 40,
                  width: 40,
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
        ],
      ),
      leadingWidth: 90,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Inverrsee Bhatt",
            style: theme.textTheme.bodyText2?.copyWith(
              fontSize: 16,
              color: kWhiteColor,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            "Active Now",
            style: theme.textTheme.bodyText2?.copyWith(
              fontSize: 12,
              color: kWhiteColor,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_horiz),
        ),
        const SizedBox(width: 10),
      ],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(15),
          bottomLeft: Radius.circular(15),
        ),
      ),
      elevation: 5.0,
      shadowColor: kBlueColor,
    );
  }

  @override
  Widget buildBody() {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 20),
            itemCount: 50,
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            reverse: true,
            itemBuilder: (context, index) {
              if (index % 2 == 0) {
                return Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Container(
                          margin: const EdgeInsets.only(
                              top: 7, bottom: 7, right: 10, left: 20),
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: kBlueColor,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: kLightBlueColor,
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(0, 2),
                                ),
                              ]),
                          child: Text(
                            "Hello!!!",
                            style: theme.textTheme.subtitle1?.copyWith(
                              color: kWhiteColor,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        "3:00 PM",
                        style: theme.textTheme.subtitle1?.copyWith(
                          color: kGreyColor,
                          fontSize: 13,
                        ),
                      )
                    ],
                  ),
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "3:00 PM",
                        style: theme.textTheme.subtitle1?.copyWith(
                          color: kGreyColor,
                          fontSize: 13,
                        ),
                      ),
                      Flexible(
                        child: Container(
                          margin: const EdgeInsets.only(
                              top: 7, bottom: 7, right: 20, left: 10),
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: kBlueColor.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: const [
                                BoxShadow(
                                  color: kLightGreyColor,
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(0, 2),
                                ),
                              ]),
                          child: Text(
                            "Hello!!!",
                            style: theme.textTheme.subtitle1?.copyWith(
                              color: kDarkGreyColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            boxShadow: const [
              BoxShadow(
                color: kLightGreyColor,
                blurRadius: 5,
                spreadRadius: 3,
              ),
            ],
          ),
          child: TextFormField(
            style: theme.textTheme.bodyText2?.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              isDense: true,
              prefixIcon: const Icon(
                Icons.attachment,
                color: kGreyColor,
                size: 22,
              ),
              prefixIconColor: kGreyColor,
              suffixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.mic_none,color: kGreyColor,size: 22,),
                  SizedBox(width: 12),
                  Icon(Icons.send,size: 30,color: kBlueColor,),
                  SizedBox(width: 12),
                ],
              ),
              hintText: "Type a message",
              hintStyle: Theme.of(context).textTheme.bodyText2?.copyWith(
                    fontSize: 14,
                    color: kLightGreyColor,
                    fontWeight: FontWeight.w400,
                  ),
              filled: true,
              fillColor: kWhiteColor,
              border: OutlineInputBorder(
                  borderSide: const BorderSide(color: kLightGreyColor),
                  borderRadius: BorderRadius.circular(50)),
              errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: kLightGreyColor),
                  borderRadius: BorderRadius.circular(50)),
              disabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: kLightGreyColor),
                  borderRadius: BorderRadius.circular(50)),
              focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: kLightGreyColor),
                  borderRadius: BorderRadius.circular(50)),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: kLightGreyColor),
                  borderRadius: BorderRadius.circular(50)),
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: kLightGreyColor),
                  borderRadius: BorderRadius.circular(50)),
              counter: const SizedBox.shrink(),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            ),
          ),
        ),
      ],
    );
  }
}
