import 'package:flutter/material.dart';
import 'package:fruit_market/core/Widgets/space_widget.dart';
import 'package:fruit_market/core/utilis/size_responsive.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({super.key, this.image, this.title, this.subtitle});

  final String? image;
  final String? title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    Sizeresponsive().init(context);

    return isPortrait
        ? Column(
      children: [
        Spacer(flex: 2),


        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Image.asset(
              image!,
              fit: BoxFit.contain,
            ),
          ),
        ),


        Spacer(flex: 1),
        Text(
          title!,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),

        SizedBox(height: Sizeresponsive.defaultSize! * 0.5),


        Padding(
          padding: EdgeInsets.symmetric(horizontal: Sizeresponsive.defaultSize! * 2.4),
          child: Text(
            subtitle!,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),

        Spacer(flex: 3),
      ],
    )

        : Column(
      children: [
        heightSpace(value: 6),
        Expanded(
          flex: 3,
          child: Image.asset(
            image!,
            fit: BoxFit.cover,
          ),
        ),
        heightSpace(value: 3),
        Text(
          title!,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        heightSpace(value: 2),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            subtitle!,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        heightSpace(value: 5),
      ],
    );
  }
}
