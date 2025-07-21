import 'package:flutter/material.dart';

class Listtile extends StatelessWidget {
  const Listtile({
    super.key,
    required this.iconLeading,
    required this.text,
    required this.ontap,
  });

  final IconData iconLeading;
  final String text;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:ontap ,
      child: ListTile(

        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
        dense: true,
        visualDensity: const VisualDensity(vertical: -2),
        leading: Icon(iconLeading, size: 24),
        title: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
        ),
        trailing:
          Icon(Icons.navigate_next_outlined, size: 24),

      ),
    );

  }
}
