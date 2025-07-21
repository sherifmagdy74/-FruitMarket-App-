import 'package:flutter/material.dart';
import 'package:fruit_market/core/Widgets/space_widget.dart';
import '../../../../core/Widgets/Custom_Buttons.dart';
import '../../../../core/utilis/size_responsive.dart';

class Support extends StatelessWidget {
  const Support({super.key});

  @override
  Widget build(BuildContext context) {
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

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
        title: Text('Contact Us',
            style: TextStyle(
                color: kMainColor, fontSize: 30, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),

      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: Sizeresponsive.defaultSize! * 2, vertical: Sizeresponsive.defaultSize! * 1.5),
        child: isPortrait
            ? SingleChildScrollView(
              child: Column(
                        children: [
              Text('Name', style: TextStyle(color: Colors.grey)),
              heightSpace(value: 1),
              Container(
                width: double.infinity,
                height: 75,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                ),
              ),
              heightSpace(value: 2),
              Text('Mobile Number', style: TextStyle(color: Colors.grey)),
              heightSpace(value: 1),
              Container(
                width: double.infinity,
                height: 75,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                ),
              ),
              heightSpace(value: 2),
              Text('Message', style: TextStyle(color: Colors.grey)),
              heightSpace(value: 1),
              Container(
                width: double.infinity,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                ),
              ),
              heightSpace(value: 2.5),
              Genral_Button(text: 'Submit', ontap: () {}),
              heightSpace(value: 2.7),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 25,
                        child: Icon(
                          Icons.facebook,
                          color: Colors.blue,
                          size: 20,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 25,
                        child: Image.asset(
                          'assets/icons/insta.png',
                          width: 45,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 25,
                        child: Image.asset(
                          'assets/icons/whats.png',
                          width: 35,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 25,
                        child: Image.asset(
                          'assets/icons/youtube.jpg',
                          width: 27,
                        ),
                      ),
                    ),
                  ])
                        ],
                      ),
            )
            : Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Name', style: TextStyle(color: Colors.grey)),
                    heightSpace(value: 1),
                    Container(
                      width: double.infinity,
                      height: 75,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                      ),
                    ),
                    heightSpace(value: 2),
                    Text('Mobile Number', style: TextStyle(color: Colors.grey)),
                    heightSpace(value: 1),
                    Container(
                      width: double.infinity,
                      height: 75,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                      ),
                    ),
                    heightSpace(value: 2),
                    Text('Message', style: TextStyle(color: Colors.grey)),
                    heightSpace(value: 1),
                    Container(
                      width: double.infinity,
                      height: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                      ),
                    ),
                    heightSpace(value: 2.5),
                    Genral_Button(text: 'Submit', ontap: () {}),
                  ],
                ),
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 25,
                          child: Icon(
                            Icons.facebook,
                            color: Colors.blue,
                            size: 20,
                          ),
                        ),
                      ),
                      heightSpace(value: 1.5),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 25,
                          child: Image.asset(
                            'assets/icons/insta.png',
                            width: 45,
                          ),
                        ),
                      ),
                      heightSpace(value: 1.5),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 25,
                          child: Image.asset(
                            'assets/icons/whats.png',
                            width: 35,
                          ),
                        ),
                      ),
                      heightSpace(value: 1.5),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 25,
                          child: Image.asset(
                            'assets/icons/youtube.jpg',
                            width: 27,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
