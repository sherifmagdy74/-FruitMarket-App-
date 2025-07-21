import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/Widgets/Custom_Buttons.dart';
import '../../core/Widgets/space_widget.dart';
import '../../core/utilis/size_responsive.dart';
import '../Nav_bar_build.dart';
import 'Basket/Widgets/Chekout/Stepper.dart';
import 'Basket/basketPageDetails.dart';
import 'Home/home_page_view.dart';

class orders_page extends StatelessWidget {
  const orders_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => NavBarBuild()),
                );
              },
              icon: Icon(Icons.arrow_back_ios_new)),
          backgroundColor: Colors.white,
          elevation: 0,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1.5),
            child: Container(
              height: 1.5,
              color: Colors.grey.shade300, // خط بسيط تحت الـ AppBar بدون shadow
            ),
          ),
          title: Text('My Orders',
              style: TextStyle(
                  color: kMainColor,
                  fontSize: 30,
                  fontWeight: FontWeight.bold)),
          centerTitle: true,
        ),
        body: ListView.separated(
            itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.only(
                      top: Sizeresponsive.defaultSize! * 2.5,
                      left: Sizeresponsive.defaultSize! * 1,
                      right: Sizeresponsive.defaultSize! * 1),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: double.infinity,
                        height: Sizeresponsive.defaultSize! * 15,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(1),
                              blurRadius: 8,
                              offset: Offset(0, 0),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: Sizeresponsive.defaultSize! * 2.5,
                              left: Sizeresponsive.defaultSize! * 1.2,
                              right: Sizeresponsive.defaultSize! * 1.2),
                          child: Row(mainAxisSize: MainAxisSize.min, children: [
                            Column(
                              children: [
                                Container(
                                    width: Sizeresponsive.defaultSize! * 8,
                                    height: Sizeresponsive.defaultSize! * 8,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'assets/order/Frame 2870.jpg'),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(150),
                                    )),
                              ],
                            ),
                            widthSpace(value: 0.6),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '$orderCode - ${(calculateSubtotal() + calculateShipping()).toStringAsFixed(2)} KD',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                                heightSpace(value: 1),
                                Text(
                                  '9 Sep - ${getTotalItems()} items',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 18),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Status: ',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 18),
                                    ),
                                    Text(
                                      'Delivered',
                                      style: TextStyle(
                                          color: Colors.yellow, fontSize: 18),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Spacer(),
                            Column(
                              children: [
                                Container(
                                    width: Sizeresponsive.defaultSize! * 8,
                                    height: Sizeresponsive.defaultSize! * 8,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'assets/order/status.png'),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(150),
                                    )),
                              ],
                            ),
                          ]),
                        ),
                      )
                    ],
                  ),
                ),
            separatorBuilder: (context, index) => heightSpace(value: 0),
            itemCount: 10));
  }
}
