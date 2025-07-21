import 'package:flutter/material.dart';
import 'package:fruit_market/nav_bar/screens/Home/Model/pageviewCategory.dart';

class row_view extends StatelessWidget {
  const row_view({super.key, required this.category});

  final row category;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(right: 2, left: 2, top: 8, bottom: 15),
        child: Container(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),

              child: Image.asset(category.image, fit: BoxFit.fill,),
            ),
          ),
        );
  }
}
