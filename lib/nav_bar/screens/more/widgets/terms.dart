import 'package:flutter/material.dart';
import 'package:fruit_market/core/Widgets/space_widget.dart';

import '../../../../core/Widgets/Custom_Buttons.dart';

class Terms extends StatelessWidget {
  const Terms({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:

            Text('Terms and Conditions',
                style: TextStyle(
                    color: kMainColor, fontSize: 22, fontWeight: FontWeight.bold)),

        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15,top: 20),
        child: Column(
          children: [
            Text('Having a Terms and Conditions agreement is completely optional. No laws require you to have one. Not even the super-strict and wide-reaching General Data Protection Regulation (GDPR).',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
            heightSpace(value: 1.5),
            Text('Having a Terms and Conditions agreement is completely optional. No laws require you to have one. Not even the super-strict and wide-reaching General Data Protection Regulation (GDPR).',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
            heightSpace(value: 1.5),
            Text('Having a Terms and Conditions agreement is completely optional. No laws require you to have one. Not even the super-strict and wide-reaching General Data Protection Regulation (GDPR).',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),)

          ],
        ),
      ),
    );
  }
}
