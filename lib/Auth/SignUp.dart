import 'package:flutter/material.dart';

import '../core/Widgets/Custom_Buttons.dart';
import '../core/Widgets/TFF.dart';
import '../core/Widgets/space_widget.dart';
import '../core/utilis/size_responsive.dart';

class signup extends StatelessWidget {
  const signup({super.key});

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      resizeToAvoidBottomInset: false,

      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_rounded,
          ),
        ),
      ),
      body: isPortrait
          ? Padding(
            padding: EdgeInsets.symmetric(horizontal: Sizeresponsive.defaultSize! * 2.5),
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
                  heightSpace(value: Sizeresponsive.defaultSize! * 0.15),
                  Text(
                    'Sign Up to Wikala',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: Sizeresponsive.defaultSize! * 2.5,
                        fontWeight: FontWeight.bold),
                  ),
                  heightSpace(value: Sizeresponsive.defaultSize! * .2),
                  tff(
                    title: 'Full name ',
                    hintText: 'First and Last Name',
                  ),
                  heightSpace(value: Sizeresponsive.defaultSize! * 0.15),
                  PhoneTFF(
                    title: 'Phone Number with Whatsapp',
                    hintText: 'Mobile Number',
                  ),
                  heightSpace(value:  Sizeresponsive.defaultSize! * 0.15),
                  tff(
                    title: 'Password',
                    hintText: 'Password',
                  ),
                  heightSpace(value: Sizeresponsive.defaultSize! * 0.3),
                  Genral_Button(text: 'Sign Up', ontap: () {}),
                  heightSpace(value: Sizeresponsive.defaultSize! * 0.2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account? |',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                      widthSpace(value: 0.4),
                      TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size(0, 0),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(
                                color: Colors.blue[500]!,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                ],
              ),
          )
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: Sizeresponsive.defaultSize! * 5),
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
                          'Sign Up to Wikala',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: Sizeresponsive.defaultSize! * 1,
                          vertical: Sizeresponsive.defaultSize! * 1.5),
                      child: Column(children: [
                        tff(
                          title: 'Full name ',
                          hintText: 'First and Last Name',
                        ),
                        heightSpace(value: 2.5),
                        PhoneTFF(
                          title: 'Phone Number with Whatsapp',
                          hintText: 'Mobile Number',
                        ),
                        heightSpace(value: 2.5),
                        tff(
                          title: 'Password',
                          hintText: 'Password',
                        ),
                        heightSpace(value: 4),
                        Genral_Button(text: 'Sign Up', ontap: () {}),
                        heightSpace(value: 2.5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already have an account? |',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            ),
                            widthSpace(value: 0.4),
                            TextButton(
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  minimumSize: Size(0, 0),
                                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                      color: Colors.blue[500]!,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ))
                          ],
                        ),
                      ]),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
