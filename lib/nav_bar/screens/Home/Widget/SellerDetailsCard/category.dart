import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruit_market/core/Widgets/space_widget.dart';

import '../../../../../core/utilis/size_responsive.dart';
import '../../Model/categorySellerModel.dart';

class categorySeller extends StatelessWidget {
  const categorySeller({super.key, required this.category});

  final CategorySellerModel category;
  @override
  Widget build(BuildContext context) {
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return isPortrait?Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Material(
              elevation: 5,
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(15),
              child: Container(
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            Image.asset(category.image,  fit: BoxFit.fill,),
          ],
        ),
        heightSpace(value: 0.3),
        Text(category.title,style: TextStyle(fontWeight: FontWeight.bold),)
      ],
    ):Column(
      children: [
        Container(
width: Sizeresponsive.defaultSize! * 10.5,
height: Sizeresponsive.defaultSize! * 10.5,
          decoration: BoxDecoration(
            boxShadow:  [
              BoxShadow(
                color: Colors.grey.withOpacity(1),
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(0, 0),
              ),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Image.asset(category.image,  fit: BoxFit.contain,),
        ),
        heightSpace(value: 0.3),
        Text(category.title,style: TextStyle(fontWeight: FontWeight.bold),)
      ],
    );

  }
}
