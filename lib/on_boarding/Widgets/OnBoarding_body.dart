
import 'package:flutter/material.dart';
import 'package:fruit_market/core/utilis/size_responsive.dart';
import 'package:fruit_market/nav_bar/Nav_bar_build.dart';
import 'package:fruit_market/on_boarding/Widgets/page_view.dart';

import '../../core/Widgets/Custom_Buttons.dart';
import 'dotIndicitor.dart';

class OnBoarding_body extends StatefulWidget {
  const OnBoarding_body({super.key});

  @override
  State<OnBoarding_body> createState() => _OnBoarding_bodyState();
}

class _OnBoarding_bodyState extends State<OnBoarding_body> {
  PageController? pageController;
  final controller = PageController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    Sizeresponsive().init(context);

    return isPortrait
        ?
    Stack(
      children: [
        page_view_onboarding(
          pagecontroller: pageController,
        ),
        dotIndicitor(
          dotIndex: pageController!.hasClients ? pageController?.page : 0,
        ),
        Visibility(
          visible: pageController!.hasClients
              ? (pageController?.page == 2 ? false : true)
              : true,
          child: Positioned(
            top: Sizeresponsive.defaultSize! * 7.5,
            right: Sizeresponsive.defaultSize! * 3.2,
            child: TextButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const NavBarBuild()),
                      (route) => false,
                );
              },
              child: Text(
                'Skip',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: Sizeresponsive.defaultSize! * 5,
          right: Sizeresponsive.defaultSize! * 10,
          left: Sizeresponsive.defaultSize! * 10,
          child: Genral_Button(
            text: pageController!.hasClients
                ? (pageController?.page == 2 ? 'Get Started' : 'Next')
                : 'Next',
            ontap: () {
              if (pageController!.page! < 2) {
                pageController?.nextPage(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                );
              } else {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const NavBarBuild()),
                      (route) => false,
                );
              }
            },
          ),
        ),
      ],
    )
        :
    Row(
      children: [

        Expanded(
          flex: 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 7,
                child: page_view_onboarding(
                  pagecontroller: pageController,
                ),
              ),
              SizedBox(height: 10),
              dotIndicitor(
                dotIndex:
                pageController!.hasClients ? pageController?.page : 0,
              ),
              SizedBox(height: 30),
            ],
          ),
        ),


        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Visibility(
                    visible: pageController!.hasClients
                        ? (pageController?.page == 2 ? false : true)
                        : true,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => const NavBarBuild()),
                              (route) => false,
                        );
                      },
                      child: Text(
                        'Skip',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ),
                Genral_Button(
                  text: pageController!.hasClients
                      ? (pageController?.page == 2
                      ? 'Get Started'
                      : 'Next')
                      : 'Next',
                  ontap: () {
                    if (pageController!.page! < 2) {
                      pageController?.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeIn,
                      );
                    } else {

                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => const NavBarBuild()),
                              (route) => false,
                        );

                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }


}
