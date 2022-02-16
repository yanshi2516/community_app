import 'package:carousel_slider/carousel_slider.dart';
import 'package:community_app/resources/color_resources.dart';
import 'package:community_app/ui/base/base_stateful_widget.dart';
import 'package:community_app/ui/sign_up_screen/sign_up_screen.dart';
import 'package:community_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends BaseStatefulWidgetState<WelcomeScreen> {
  final CarouselController _carouselController = CarouselController();
  final List<String> _imageList = [
    "assets/images/img_background_1.png",
    "assets/images/img_background_2.png",
    "assets/images/img_background_3.png",
  ];
  int _currentIndex = 0;

  @override
  Widget buildBody() {
    return SafeArea(
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              CarouselSlider(
                carouselController: _carouselController,
                items: List.generate(_imageList.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Container(
                          height: 400,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: Image.asset(
                                _imageList[index],
                              ).image,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
                options: CarouselOptions(
                  height: 400,
                  viewportFraction: 1.0,
                  onPageChanged: (index, _) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(_imageList.length, (index) {
                  if (_currentIndex == index) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      height: 10,
                      width: 10,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: kBlueColor,
                      ),
                    );
                  } else {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      height: 8,
                      width: 8,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: kSearchIconTextColor,
                      ),
                    );
                  }
                }),
              ),
              const SizedBox(height: 20),
              Text(
                "Welcome",
                style: theme.textTheme.subtitle2?.copyWith(
                  color: kDarkTealColor,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. When an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                  style: theme.textTheme.bodyText1?.copyWith(
                    color: kGreyColor,
                    letterSpacing: 0.5,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30, right: 20, left: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.keyboard_backspace),
                    color: kDarkTealColor,
                    iconSize: 24,
                  ),
                  CustomButton(
                    width: 120,
                    height: 40,
                    label: "Next",
                    onTap: () {
                      if (_currentIndex == 2) {
                        pushReplacement(const SignUpScreen());
                      } else {
                        _carouselController.nextPage();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
