import 'package:flutter/material.dart';

import '../core/Widgets/Custom_Buttons.dart';
import '../core/Widgets/space_widget.dart';
import '../core/utilis/size_responsive.dart';

class otp extends StatefulWidget {
  const otp({super.key});

  @override
  State<otp> createState() => _otpState();
}

class _otpState extends State<otp> {
  final List<TextEditingController> controllers =
      List.generate(4, (_) => TextEditingController());
  final List<FocusNode> focusNodes = List.generate(4, (_) => FocusNode());

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    for (var node in focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
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
      body:isPortrait? Padding(
        padding: EdgeInsets.symmetric(horizontal: Sizeresponsive.defaultSize! * 2.5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Fruit Market',
              style: TextStyle(
                  color: kMainColor, fontSize: 50, fontWeight: FontWeight.bold),
            ),
            heightSpace(value: 2),
            Text(
              'Enter Received OTP',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            heightSpace(value: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(4, (index) {
                return SizedBox(
                  width: 60,
                  height: 60,
                  child: TextField(
                    cursorColor: kMainColor,
                    cursorWidth: 2,
                    controller: controllers[index],
                    focusNode: focusNodes[index],
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        if (index < 3) {
                          FocusScope.of(context)
                              .requestFocus(focusNodes[index + 1]);
                        } else {
                          FocusScope.of(context).unfocus();
                        }
                      } else if (value.isEmpty) {
                        if (index > 0) {
                          FocusScope.of(context)
                              .requestFocus(focusNodes[index - 1]);
                        }
                      }
                    },
                    decoration: InputDecoration(
                      counterText: '',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: kMainColor),
                      ),
                    ),
                  ),
                );
              }),
            ),
            heightSpace(value: 6),
            Genral_Button(text: 'Confirm', ontap: () {}),
            heightSpace(value: 4),
            Text(
              '60s',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                  color: Colors.grey),
            ),
            heightSpace(value: 3),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Not received? ',
                  style: TextStyle(
                      color: Colors.grey,
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
                    onPressed: () {},
                    child: Text(
                      'Send Again',
                      style: TextStyle(
                          color: Colors.blue[500]!,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ))
              ],
            ),
          ],
        ),
      ):Row(
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
                        color: kMainColor, fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                  heightSpace(value: 2),
                  Text(
                    'Enter Received OTP',
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
            child:
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Sizeresponsive.defaultSize! * 1,
                    vertical: Sizeresponsive.defaultSize! * 1.5),              child: Column(
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(4, (index) {
                      return SizedBox(
                        width: 60,
                        height: 60,
                        child: TextField(
                          cursorColor: kMainColor,
                          cursorWidth: 2,
                          controller: controllers[index],
                          focusNode: focusNodes[index],
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                          keyboardType: TextInputType.number,
                          maxLength: 1,
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              if (index < 3) {
                                FocusScope.of(context)
                                    .requestFocus(focusNodes[index + 1]);
                              } else {
                                FocusScope.of(context).unfocus();
                              }
                            } else if (value.isEmpty) {
                              if (index > 0) {
                                FocusScope.of(context)
                                    .requestFocus(focusNodes[index - 1]);
                              }
                            }
                          },
                          decoration: InputDecoration(
                            counterText: '',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(color: kMainColor),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                  heightSpace(value: 2),
                  Genral_Button(text: 'Confirm', ontap: () {}),
                  heightSpace(value: 2),
                  Text(
                    '60s',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                        color: Colors.grey),
                  ),
                  heightSpace(value: 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Not received? ',
                        style: TextStyle(
                            color: Colors.grey,
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
                          onPressed: () {},
                          child: Text(
                            'Send Again',
                            style: TextStyle(
                                color: Colors.blue[500]!,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
