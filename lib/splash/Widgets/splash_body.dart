import 'package:flutter/material.dart';
import '../../core/Widgets/Custom_Buttons.dart';
import '../../core/utilis/size_responsive.dart';
import '../../on_boarding/OnBoarding.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation<double>? fadingAnimation;
  bool _initialized = false;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    fadingAnimation =
        Tween<double>(begin: 0.2, end: 1).animate(animationController!);
    animationController?.repeat(reverse: true);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Sizeresponsive().init(context);
      _initialized = true;
      GoToNextView(context);
    });
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    Sizeresponsive().init(context);
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      backgroundColor: kMainColor,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return

              isPortrait?   Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FadeTransition(
                  opacity: fadingAnimation!,
                  child: Container(
                    height: Sizeresponsive.screenHeight! * 0.4,
                    width: double.infinity,
                    child: Image.asset(
                      'assets/splash1.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),

Spacer(),
                Container(

                  width: double.infinity,
                  child: Image.asset(
                    'assets/splash2.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            )
                  :
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FadeTransition(
                    opacity: fadingAnimation!,
                    child: Container(
                      height: Sizeresponsive.screenHeight! * 0.4,
                      width: double.infinity,
                      child: Image.asset(
                        'assets/splash1.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),

                  Spacer(),
                  Container(
                    height: Sizeresponsive.screenHeight! * 0.5,
                    width: double.infinity,
                    child: Image.asset(
                      'assets/splash2.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              );
          },
        ),
      ),
    );
  }



  void GoToNextView(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => OnBoarding_view(),),(route) => false,
      );
    });
  }
}
