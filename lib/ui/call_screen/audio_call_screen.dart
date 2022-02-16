import 'package:community_app/resources/color_resources.dart';
import 'package:community_app/ui/base/base_stateful_widget.dart';
import 'package:flutter/material.dart';

class AudioCallScreen extends StatefulWidget {
  const AudioCallScreen({Key? key}) : super(key: key);

  @override
  State<AudioCallScreen> createState() => _AudioCallScreenState();
}

class _AudioCallScreenState extends BaseStatefulWidgetState<AudioCallScreen> {
  @override
  Widget buildBody() {
    return Stack(
      children: [
        Container(
          height: double.maxFinite,
          width: double.maxFinite,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: Image.asset("assets/images/video_image_1.jpg").image,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                  "Calling",
                  style: theme.textTheme.bodyText2?.copyWith(
                    fontSize: 14,
                    color: kWhiteColor,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 100),
                Row(
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
                          Icons.volume_up_rounded,
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
                          Icons.pause,
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
                  ],
                ),
                const SizedBox(height: 150),
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
              ],
            ),
          ),
        ),
      ],
    );
  }
}