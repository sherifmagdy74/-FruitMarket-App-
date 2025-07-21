import 'package:flutter/material.dart';
import '../core/Widgets/Custom_Buttons.dart';
import '../core/Widgets/TFF.dart';
import '../core/Widgets/space_widget.dart';
import '../core/utilis/size_responsive.dart';
import 'ForgetPass.dart';
import 'SignUp.dart';

class signin extends StatelessWidget {
  const signin({super.key});

  @override
  Widget build(BuildContext context) {
    final isLandscape = MediaQuery
        .of(context)
        .orientation == Orientation.landscape;

    return Scaffold(
      resizeToAvoidBottomInset: false,

      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_rounded),
        ),
      ),
      body: isLandscape
          ? Row(
        children: [
          Expanded(

            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: Sizeresponsive.defaultSize! * 5),
              child: Column(
                children: [
                  Text(
                    'Fruit Market',
                    style: TextStyle(
                      color: kMainColor,
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  heightSpace(value: 2),
                  Text(
                    'Login to Wikala',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Sizeresponsive.defaultSize! * 2,
                    vertical: Sizeresponsive.defaultSize! * 1.5),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    PhoneTFF(
                      title: 'Phone Number with Whatsapp',
                      hintText: 'Mobile Number',
                    ),
                    heightSpace(value: 1),
                    tff(
                      title: 'Password',
                      hintText: 'Password',
                    ),
                    heightSpace(value: 1),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(
                                  builder: (context) => forgetPass()));
                        },
                        child: Text(
                          'Forget Password?',
                          style: TextStyle(
                            color: Colors.blue[700]!,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.blue[700],
                          ),
                        ),
                      ),
                    ),
                    heightSpace(value: 1),
                    SizedBox(
                      width: double.infinity,
                      child: Genral_Button(
                        text: 'Login',
                        ontap: () {},
                      ),
                    ),
                    heightSpace(value: 1),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don’t have an account? |',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        widthSpace(value: 0.5),
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size(0, 0),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(
                                    builder: (context) => signup()));
                          },
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Colors.blue[500]!,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      )
          : Padding(
            padding:  EdgeInsets.symmetric(horizontal: Sizeresponsive.defaultSize! * 2),
            child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
            Text(
              'Fruit Market',
              style: TextStyle(
                color: kMainColor,
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
            heightSpace(value: 2),
            Text(
              'Login to Wikala',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            heightSpace(value: Sizeresponsive.defaultSize! * 0.3),
            PhoneTFF(
                title: 'Phone Number with Whatsapp', hintText: 'Mobile Number'),
            heightSpace(value: Sizeresponsive.defaultSize! * 0.2),
            tff(title: 'Password', hintText: 'Password'),
            heightSpace(value: 2),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => forgetPass()));
                },
                child: Text(
                  'Forget Password?',
                  style: TextStyle(
                    color: Colors.blue[700]!,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.blue[700],
                  ),
                ),
              ),
            ),
            heightSpace(value: Sizeresponsive.defaultSize! * 0.1),
            Genral_Button(text: 'Login', ontap: () {}),
            heightSpace(value: Sizeresponsive.defaultSize! * 0.13),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don’t have an account? |',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                widthSpace(value: 0.4),
                TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size(0, 0),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => signup()));
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.blue[500]!,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
                    ],
                  ),
          ),
    );
  }
}
