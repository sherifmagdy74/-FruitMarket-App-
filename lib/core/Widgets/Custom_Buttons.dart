import 'package:flutter/material.dart';
import 'package:fruit_market/core/utilis/size_responsive.dart';

class Genral_Button extends StatelessWidget {
  const Genral_Button({super.key, required this.text, required this.ontap});

  final VoidCallback? ontap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 60,
        width: Sizeresponsive.screenWidth,
        decoration: BoxDecoration(
            color: kMainColor, borderRadius: BorderRadius.circular(30)),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontSize: 14, color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}

class log_Button extends StatelessWidget {
  const log_Button(
      {super.key,
      required this.text,
      required this.ontap,
      required this.icon,
      required this.color,
      required this.color_text,
      required this.color_icon});

  final VoidCallback? ontap;
  final String text;
  final IconData? icon;
  final Color color;
  final Color color_text;
  final Color color_icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(100),
        child: Container(
          height: 60,
          width: Sizeresponsive.screenWidth,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(30)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: color_icon,
                size: 30,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                text,
                style: TextStyle(
                    fontSize: Sizeresponsive.defaultSize! * 1.3, color: color_text, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

const kMainColor = Color(0xFF1f4f37);

