import 'package:community_app/resources/color_resources.dart';
import 'package:community_app/ui/base/base_stateful_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NewPostWidget extends StatefulWidget {
  const NewPostWidget({Key? key}) : super(key: key);

  @override
  State<NewPostWidget> createState() => _NewPostWidgetState();
}

class _NewPostWidgetState extends BaseStatefulWidgetState<NewPostWidget> {
  @override
  Widget buildBody() {
    return ListView.separated(
      itemCount: 15,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 20),
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
                    letterSpacing: 0.5,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "06:00 am | AHMEDABAD, GUJARAT",
                      style: theme.textTheme.bodyText2?.copyWith(
                        fontSize: 9,
                        color: kGreyColor.withOpacity(0.6),
                      ),
                    ),
                    const SizedBox(height: 3),
                    Container(
                      width: 40,
                      height: 18,
                      decoration: BoxDecoration(
                        border: Border.all(color: kBlueColor),
                        color: kBlueColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const FaIcon(
                            FontAwesomeIcons.medal,
                            size: 10,
                            color: Colors.amber,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            "35",
                            style: theme.textTheme.bodyText1?.copyWith(
                              fontSize: 9,
                              color: kBlueColor,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 30,
                      decoration: BoxDecoration(
                        border: Border.all(color: kBlueColor),
                        borderRadius: BorderRadius.circular(2),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Center(
                        child: Text(
                          "Message",
                          style: theme.textTheme.bodyText1?.copyWith(
                            color: kBlueColor,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    const Icon(
                      Icons.more_vert,
                      color: kBlackColor,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
                style: theme.textTheme.bodyText2?.copyWith(
                  fontSize: 12,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 200,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: Image.asset("assets/images/post_image.png").image,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.comment,
                          color: kGreyColor,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          "Comment",
                          style: theme.textTheme.bodyText1?.copyWith(
                            color: kGreyColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.thumb_up_alt_outlined,
                          color: kGreyColor,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          "Useful",
                          style: theme.textTheme.bodyText1?.copyWith(
                            color: kGreyColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const FaIcon(
                          FontAwesomeIcons.whatsapp,
                          color: kGreyColor,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          "Share",
                          style: theme.textTheme.bodyText1?.copyWith(
                            color: kGreyColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
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
                  const SizedBox(width: 15),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Comment here",
                        hintStyle: theme.textTheme.bodyText1?.copyWith(
                          color: kGreyColor,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: kLightGreyColor.withOpacity(0.5),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) {
        return Container(
          height: 10,
          width: double.maxFinite,
          color: kLightGreyColor.withOpacity(0.3),
        );
      },
    );
  }
}
