import 'package:flutter/material.dart';
import 'package:fruit_market/core/utilis/size_responsive.dart';
import '../../../../../core/Widgets/space_widget.dart';
import '../../../../../core/Widgets/Custom_Buttons.dart';
import 'Opps.dart';
import 'OrderTracking.dart';

class place_order extends StatelessWidget {
  const place_order({super.key, required this.orderCode});

  final String orderCode;

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
        title: Text('Checkout',
            style: TextStyle(
                color: kMainColor,
                fontSize: 30,
                fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),

      body: isPortrait ? _buildPortraitLayout(context) : _buildLandscapeLayout(context),
    );
  }

  Widget _buildPortraitLayout(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: Sizeresponsive.defaultSize! * 1),
          child: Image.asset('assets/checkout/confirm.png'),
        ),
        heightSpace(value: 3),
        FittedBox(
          child: Text(
            'YOUR ORDER IS CONFIRMED!',
            style: TextStyle(
              color: kMainColor,
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        heightSpace(value: 1),
        Text(
          'Your order code: $orderCode',
          style: TextStyle(color: Colors.grey, fontSize: 17),
        ),
        Text(
          'Thank you for choosing our products!',
          style: TextStyle(color: Colors.grey, fontSize: 17),
        ),
        heightSpace(value: 3),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Genral_Button(
            text: 'Continue Shopping',
            ontap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => opps()));
            },
          ),
        ),
        heightSpace(value: Sizeresponsive.defaultSize! * 0.2),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: log_Button(
            text: 'Track Order',
            ontap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => orderTrack()));
            },
            icon: null,
            color: Colors.white,
            color_text: kMainColor,
            color_icon: kMainColor,
          ),
        ),
      ],
    );
  }

  Widget _buildLandscapeLayout(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding:  EdgeInsets.symmetric(vertical: Sizeresponsive.defaultSize! * 2,horizontal: Sizeresponsive.defaultSize! * 2),
            child: Image.asset('assets/checkout/confirm.png'),
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(
                child: Text(
                  'YOUR ORDER IS CONFIRMED!',
                  style: TextStyle(
                    color: kMainColor,
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              heightSpace(value: 1),
              Text(
                'Your order code: $orderCode',
                style: TextStyle(color: Colors.grey, fontSize: 17),
              ),
              Text(
                'Thank you for choosing our products!',
                style: TextStyle(color: Colors.grey, fontSize: 17),
              ),
              heightSpace(value: 3),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Genral_Button(
                  text: 'Continue Shopping',
                  ontap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => opps()));
                  },
                ),
              ),
              heightSpace(value: 2.5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: log_Button(
                  text: 'Track Order',
                  ontap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => orderTrack()));
                  },
                  icon: null,
                  color: Colors.white,
                  color_text: kMainColor,
                  color_icon: kMainColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
