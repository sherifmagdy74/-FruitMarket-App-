import 'package:flutter/material.dart';
import 'package:fruit_market/core/Widgets/TFF.dart';
import 'package:fruit_market/core/utilis/size_responsive.dart';

import '../../../../core/Widgets/Custom_Buttons.dart';
import '../../../../core/Widgets/space_widget.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
        appBar: AppBar(
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(9),
            child: Container(
              height: 1.5,
              decoration: BoxDecoration(
                color: Colors.grey,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 8,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
            ),
          ),
          title: Text('Profile',
              style: TextStyle(
                  color: kMainColor,
                  fontSize: 30,
                  fontWeight: FontWeight.bold)),
          centerTitle: true,
        ),
        body: isPortrait
            ? SafeArea(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 60),
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.black, width: 1.8),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 50,
                            ),
                          ),
                          Positioned(
                              bottom: 0,
                              right: 0,
                              child: Icon(
                                Icons.add_a_photo_outlined,
                                size: 30,
                              )),
                        ],
                      ),
                      heightSpace(value: 2),
                      Text(
                        'Welcome, Fruit Market',
                        style: TextStyle(fontSize: 20),
                      ),
                      heightSpace(value: 4),
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
                      Genral_Button(text: 'Update', ontap: () {})
                    ],
                  ),
                ),
              )
            : SafeArea(
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: Sizeresponsive.defaultSize! * 1),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black, width: 1.8),
                                      borderRadius: BorderRadius.circular(60),
                                    ),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 60,
                                    ),
                                  ),
                                  Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: Icon(
                                        Icons.add_a_photo_outlined,
                                        size: 30,
                                      )),
                                ],
                              ),
                              heightSpace(value: 2),
                              Text(
                                'Welcome, Fruit Market',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: Sizeresponsive.defaultSize! * 5,
                              vertical: Sizeresponsive.defaultSize! * 2),
                          child: Column(
                            children: [
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
                              Genral_Button(text: 'Update', ontap: () {})
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ));
  }
}
