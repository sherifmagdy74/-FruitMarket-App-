import 'package:flutter/material.dart';

import '../core/Widgets/Custom_Buttons.dart';
import '../core/Widgets/TFF.dart';
import '../core/Widgets/space_widget.dart';
import '../core/utilis/size_responsive.dart';
import 'Otp.dart';

class forgetPass extends StatelessWidget {
  const forgetPass({super.key});

  @override
  Widget build(BuildContext context) {
    final isPortrait = MediaQuery
        .of(context)
        .orientation == Orientation.portrait;

    return Scaffold(
      resizeToAvoidBottomInset: false,

      appBar: AppBar(
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios_rounded,),),
      ),
      body: isPortrait ? Padding(
        padding: EdgeInsets.symmetric(vertical: Sizeresponsive.defaultSize! * 6,
            horizontal: Sizeresponsive.defaultSize! * 2.5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Fruit Market',
              style: TextStyle(
                  color: kMainColor,
                  fontSize: 50,
                  fontWeight: FontWeight.bold),
            ),
            heightSpace(value: 2),
            Text(
              'Enter your Number',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),

            heightSpace(value: 4),
            PhoneTFF(title: 'Phone Number', hintText: 'Mobile Number',),
            heightSpace(value: 5),
            Genral_Button(text: 'Submit', ontap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => otp(),));
            })
          ],
        ),
      ) : Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
              flex: 1,
              child: Padding(
                padding:  EdgeInsets.symmetric(vertical: Sizeresponsive.defaultSize! * 5),
                child: Column(
                  children: [
                    Text(
                      'Fruit Market',
                      style: TextStyle(
                          color: kMainColor,
                          fontSize: 50,
                          fontWeight: FontWeight.bold),
                    ),
                    heightSpace(value: 2),
                    Text(
                      'Enter your Number',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )),

Expanded(
  flex: 1,
  child: Padding(
    padding: EdgeInsets.symmetric(
        horizontal: Sizeresponsive.defaultSize! * 2,
        vertical: Sizeresponsive.defaultSize! * 1.5),    child: Column(
      children: [
        PhoneTFF(title: 'Phone Number', hintText: 'Mobile Number',),
        heightSpace(value: 5),
        Genral_Button(text: 'Submit', ontap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => otp(),));
        })
      ],
    ),
  ),
)

        ],
      ),
    );
  }
}
