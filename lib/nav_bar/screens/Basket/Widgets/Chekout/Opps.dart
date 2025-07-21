import 'package:flutter/material.dart';
import '../../../../../core/Widgets/Custom_Buttons.dart';
import '../../../../../core/Widgets/space_widget.dart';
import '../../../../../core/utilis/size_responsive.dart';

class opps extends StatelessWidget {
  const opps({super.key});

  @override
  Widget build(BuildContext context) {
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_rounded)),

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
        title: Text('Checkout',
            style: TextStyle(
                color: kMainColor,
                fontSize: 30,
                fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),

      body: isPortrait
          ? Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 130),
            child: Image.asset('assets/checkout/opps.png'),
          ),
          heightSpace(value: 5),
          FittedBox(
            child: Text(
              'OPPS',
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 23,
                  fontWeight: FontWeight.bold),
            ),
          ),
          heightSpace(value: 1),
          FittedBox(
            child: Text(
              'Error while confirming your payment/order',
              style: TextStyle(color: Colors.grey, fontSize: 17),
            ),
          ),
          heightSpace(value: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: log_Button(
                text: 'Back',
                ontap: () {
                  Navigator.pop(context);
                },
                icon: null,
                color: Colors.red[600]!,
                color_text: Colors.white,
                color_icon: Colors.white),
          )
        ],
      )
          : Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding:  EdgeInsets.symmetric(vertical: Sizeresponsive.defaultSize! * 2,horizontal: Sizeresponsive.defaultSize! * 2),
              child: Column(
                children: [
                  Image.asset(
                    'assets/checkout/opps.png',
                    width: 230,
                  ),
                ],
              ),
            ),
          ),


          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FittedBox(
                  child: Text(
                    'OPPS',
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 23,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                heightSpace(value: 1),
                FittedBox(
                  child: Text(
                    'Error while confirming your payment/order',
                    style: TextStyle(color: Colors.grey, fontSize: 17),
                  ),
                ),
                heightSpace(value: 5),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: log_Button(
                      text: 'Back',
                      ontap: () {
                        Navigator.pop(context);
                      },
                      icon: null,
                      color: Colors.red[600]!,
                      color_text: Colors.white,
                      color_icon: Colors.white),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
