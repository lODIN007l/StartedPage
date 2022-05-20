import 'package:flutter/material.dart';
import 'package:habit_app/app_styles.dart';
import 'package:habit_app/model/onboard_data.dart';
import 'package:habit_app/size_configs.dart';
import 'package:habit_app/views/pages.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  int currentPage = 0;
  PageController _pageController = PageController(initialPage: 0);

  AnimatedContainer dotIndicator(index) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 400),
      height: 12,
      width: 10,
      decoration: BoxDecoration(
          color: currentPage == index ? kPrimaryColor : kSecondaryColor,
          shape: BoxShape.circle),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeH = SizeConfig.blockSizeH!;
    double sizeW = SizeConfig.blockSizeV!;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 9,
              child: PageView.builder(
                itemCount: onboardingContents.length,
                controller: _pageController,
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemBuilder: (context, index) => Column(
                  children: [
                    SizedBox(
                      height: sizeW * 5,
                    ),
                    Text(
                      onboardingContents[index].title,
                      style: kTitle,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: sizeW * 5,
                    ),
                    Container(
                      height: sizeW * 50,
                      child: Image.asset(
                        onboardingContents[index].image,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(
                      height: sizeW * 5,
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: kBodyText1,
                        children: [
                          TextSpan(text: 'WE CAN '),
                          TextSpan(
                            text: 'HELP YOU ',
                            style: TextStyle(color: kPrimaryColor),
                          ),
                          TextSpan(text: 'TO BE A BETTER '),
                          TextSpan(text: 'VERSION OF '),
                          TextSpan(
                            text: 'YOURSELF',
                            style: TextStyle(color: kPrimaryColor),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: sizeW * 5,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  currentPage == onboardingContents.length - 1
                      ? _buttonStart(
                          buttoname: 'Get Started',
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpPage()));
                          },
                          bgColor: kPrimaryColor,
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            onBoarButton(
                              name: 'Skip',
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignUpPage(),
                                  ),
                                );
                              },
                            ),
                            Row(
                              children: List.generate(
                                onboardingContents.length,
                                (index) => dotIndicator(index),
                              ),
                            ),
                            onBoarButton(
                              name: 'Next',
                              onPressed: () {
                                _pageController.nextPage(
                                    duration: Duration(milliseconds: 400),
                                    curve: Curves.easeInOut);
                              },
                            ),
                          ],
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _buttonStart extends StatelessWidget {
  const _buttonStart({
    Key? key,
    required this.buttoname,
    required this.onPressed,
    required this.bgColor,
  }) : super(key: key);
  final String buttoname;
  final VoidCallback onPressed;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: SizeConfig.blockSizeH! * 15.5,
        width: SizeConfig.blockSizeV! * 100,
        child: TextButton(
          onPressed: onPressed,
          child: Text(
            buttoname,
            style: kBodyText1,
          ),
          style: TextButton.styleFrom(backgroundColor: bgColor),
        ),
      ),
    );
  }
}

class onBoarButton extends StatelessWidget {
  const onBoarButton({Key? key, required this.name, required this.onPressed})
      : super(key: key);
  final String name;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(6),
        splashColor: Colors.black12,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            name,
            style: kBodyText1,
          ),
        ));
  }
}
