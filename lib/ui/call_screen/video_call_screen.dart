import 'package:community_app/resources/color_resources.dart';
import 'package:community_app/ui/base/base_stateful_widget.dart';
import 'package:flutter/material.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({Key? key}) : super(key: key);

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends BaseStatefulWidgetState<VideoCallScreen> {
  @override
  Widget buildBody() {
    return Stack(
      children: [
        Container(
          height: double.maxFinite,
          width: double.maxFinite,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: Image.asset("assets/images/video_image_2.jpg").image,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            margin: const EdgeInsets.only(top: 20, right: 20),
            height: 200,
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: Image.asset("assets/images/video_image_1.jpg").image,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(top: 50, left: 20),
            child: Column(
              children: [
                Text(
                  "Inverrsee Bhatt",
                  style: theme.textTheme.bodyText2?.copyWith(
                    fontSize: 20,
                    color: kWhiteColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "2:30",
                  style: theme.textTheme.bodyText2?.copyWith(
                    fontSize: 14,
                    color: kWhiteColor,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.call_end,
                      color: kWhiteColor,
                      size: 30,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: kLightGreyColor.withOpacity(0.5),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.videocam,
                          color: kWhiteColor,
                          size: 30,
                        ),
                      ),
                    ),
                     Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: kLightGreyColor.withOpacity(0.5),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.mic,
                          color: kWhiteColor,
                          size: 30,
                        ),
                      ),
                    ),
                     Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: kLightGreyColor.withOpacity(0.5),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.flip_camera_ios,
                          color: kWhiteColor,
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ],
    );
  }
}
