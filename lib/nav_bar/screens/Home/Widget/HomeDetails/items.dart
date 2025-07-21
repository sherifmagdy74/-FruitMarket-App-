import 'package:flutter/material.dart';

class item extends StatelessWidget {
  const item({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 8,
      borderRadius: BorderRadius.circular(15),
      child: ClipRRect(

        borderRadius: BorderRadius.circular(15),
        child: Image.asset(
          image,
          width: 85,
          height: 80,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
