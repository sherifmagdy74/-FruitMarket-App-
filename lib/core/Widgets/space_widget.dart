import 'package:flutter/material.dart';
import 'package:fruit_market/core/utilis/size_responsive.dart';

class heightSpace extends StatelessWidget {
  const heightSpace({super.key, required this.value});
final double value;
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: Sizeresponsive.defaultSize! *value,);
  }
}
class widthSpace extends StatelessWidget {
  const widthSpace({super.key, required this.value});
  final double value;
  @override
  Widget build(BuildContext context) {
    return SizedBox(width: Sizeresponsive.defaultSize! *value,);
  }
}