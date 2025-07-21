import 'package:flutter/material.dart';
import '../../../../core/Widgets/Custom_Buttons.dart';
import '../../../../core/Widgets/space_widget.dart';
import '../../../../core/utilis/size_responsive.dart';

import 'SignIn.dart';

class Start extends StatelessWidget {
  const Start({super.key});

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
            icon: Icon(Icons.close, color: Colors.black),
          ),
        ),
        body: isPortrait
            ? Container(
                padding: EdgeInsets.symmetric(
                    vertical: Sizeresponsive.defaultSize! * 5),
                child: Column(children: [
                  Text(
                    'Fruit Market',
                    style: TextStyle(
                        color: kMainColor,
                        fontSize: Sizeresponsive.defaultSize! * 5,
                        fontWeight: FontWeight.bold),
                  ),
                  heightSpace(value: Sizeresponsive.defaultSize! * 0.2),
                  Text(
                    'Welcome to Our app',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: Sizeresponsive.defaultSize! * 2.5,
                        fontWeight: FontWeight.bold),
                  ),
                  heightSpace(value: Sizeresponsive.defaultSize! * 0.3),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Sizeresponsive.defaultSize! * 3,
                    ),
                    child: log_Button(
                      text: 'Sign in with Phone Number',
                      ontap: () {},
                      icon: Icons.phone,
                      color: Colors.white,
                      color_text: Colors.black,
                      color_icon: Colors.grey,
                    ),
                  ),
                  heightSpace(value: Sizeresponsive.defaultSize! * 0.2),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Sizeresponsive.defaultSize! * 3,
                    ),
                    child: log_Button(
                      text: 'Sign in with Google',
                      ontap: () {},
                      icon: Icons.g_mobiledata_sharp,
                      color: Colors.white,
                      color_text: Colors.black,
                      color_icon: Colors.red,
                    ),
                  ),
                  heightSpace(value: 2),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Sizeresponsive.defaultSize! * 3,
                    ),
                    child: log_Button(
                      text: 'Sign in with Facebook',
                      ontap: () {},
                      icon: Icons.facebook,
                      color: Colors.blue[900]!,
                      color_text: Colors.white,
                      color_icon: Colors.white,
                    ),
                  ),
                  heightSpace(value: Sizeresponsive.defaultSize! * 0.3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already member?',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: Sizeresponsive.defaultSize! * 1.8,
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => signin()));
                          },
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                                color: Colors.blue[500]!,
                                fontSize: Sizeresponsive.defaultSize! * 1.8,
                                fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                  heightSpace(value: Sizeresponsive.defaultSize! * 0.2),
                  Wrap(
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Text(
                        'By continue you agree to our',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: Sizeresponsive.defaultSize! * 1.6,
                            fontWeight: FontWeight.w500),
                      ),
                      TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size(0, 0),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          onPressed: () {},
                          child: Text(
                            'Terms of service',
                            style: TextStyle(
                                color: Colors.blue[500]!,
                                fontSize: Sizeresponsive.defaultSize! * 1.6,
                                fontWeight: FontWeight.bold),
                          )),
                      Text(
                        'and our',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: Sizeresponsive.defaultSize! * 1.6,
                            fontWeight: FontWeight.w500),
                      ),
                      TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size(0, 0),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          onPressed: () {},
                          child: Text(
                            'Privacy Policy',
                            style: TextStyle(
                                color: Colors.blue[500]!,
                                fontSize: Sizeresponsive.defaultSize! * 1.6,
                                fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                ]),
              )
            : Row(children: [
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: Sizeresponsive.defaultSize! * 3, ),
                    child: Column(
                      children: [
                                     const     FittedBox(
                          child: Text(
                            'Fruit Market',
                            style: TextStyle(
                                color: kMainColor,
                                fontSize: 50,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        heightSpace(value: 1),
                        Text(
                          'Welcome to Our app',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        heightSpace(value: 2),
                        Wrap(
                          alignment: WrapAlignment.center,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Text(
                              'By continue you agree to our',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500),
                            ),
                            TextButton(
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  minimumSize: Size(0, 0),
                                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                ),
                                onPressed: () {},
                                child: Text(
                                  'Terms of service',
                                  style: TextStyle(
                                      color: Colors.blue[500]!,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                )),
                            Text(
                              'and our',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500),
                            ),
                            TextButton(
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  minimumSize: Size(0, 0),
                                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                ),
                                onPressed: () {},
                                child: Text(
                                  'Privacy Policy',
                                  style: TextStyle(
                                      color: Colors.blue[500]!,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                ))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Sizeresponsive.defaultSize! * 6,
                        ),
                        child: log_Button(
                          text: 'Sign in with Phone Number',
                          ontap: () {},
                          icon: Icons.phone,
                          color: Colors.white,
                          color_text: Colors.black,
                          color_icon: Colors.grey,
                        ),
                      ),
                      heightSpace(value: 1),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Sizeresponsive.defaultSize! * 6,
                        ),
                        child: log_Button(
                          text: 'Sign in with Google',
                          ontap: () {},
                          icon: Icons.g_mobiledata_sharp,
                          color: Colors.white,
                          color_text: Colors.black,
                          color_icon: Colors.red,
                        ),
                      ),
                      heightSpace(value: 1),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Sizeresponsive.defaultSize! * 6,
                        ),
                        child: log_Button(
                          text: 'Sign in with Facebook',
                          ontap: () {},
                          icon: Icons.facebook,
                          color: Colors.blue[900]!,
                          color_text: Colors.white,
                          color_icon: Colors.white,
                        ),
                      ),
                      heightSpace(value: 2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already member?',
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
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => signin()));
                              },
                              child: Text(
                                'Sign In',
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
              ]));
  }
}
