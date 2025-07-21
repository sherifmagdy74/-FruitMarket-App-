import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import '../Model/pageviewCategory.dart';
import '../../../../core/Widgets/Custom_Buttons.dart';

class dotindicitor_home extends StatelessWidget {
  const dotindicitor_home({super.key, this.dotIndex, required this.dotsCount});
  final double? dotIndex;
  final int dotsCount;


  @override
  Widget build(BuildContext context) {

    return Align(
      alignment: Alignment.bottomCenter,
      child: DotsIndicator(

        dotsCount:dotsCount ,


        position: dotIndex ?? 0.0,
        decorator: DotsDecorator(activeColor: kMainColor,
            color: Colors.transparent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5), side:BorderSide(color: kMainColor))

        ),
      ),
    );
  }
}
