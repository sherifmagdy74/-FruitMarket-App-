import 'package:flutter/material.dart';
import 'package:fruit_market/core/Widgets/Custom_Buttons.dart';
import 'package:fruit_market/core/Widgets/space_widget.dart';
import 'package:fruit_market/core/utilis/size_responsive.dart';

import '../../../../../core/Widgets/divider.dart';
import 'Address.dart';
import 'Payment.dart';
import 'PlaceOrder.dart';
import 'Time.dart';

class CheckoutStepperPage extends StatefulWidget {
  @override
  _CheckoutStepperPageState createState() => _CheckoutStepperPageState();
}

class _CheckoutStepperPageState extends State<CheckoutStepperPage> {
  int currentStep = 0;
  final PageController _pageController = PageController();

  List<Widget> steps = [
    TimePage(),
    AddressPage(),
    PaymentPage(),
  ];

  void goToNextStep() {
    if (currentStep < steps.length - 1) {
      setState(() {
        currentStep++;
      });
      _pageController.animateToPage(
        currentStep,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => place_order(orderCode: orderCode)),
      );
    }
  }

  Widget buildStepItem(int index) {
    bool isCurrent = index == currentStep;
    Color color = isCurrent ? kMainColor : Colors.grey;

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 10),
            // Circle
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: color, width: 2),
                  ),
                ),
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
            SizedBox(width: 10),
            // Label
            Text(
              ['Delivery Time', 'Delivery Address', 'Payment'][index],
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ],
        ),
        // Line under the circle
        if (index < 2)
          Container(
            margin: EdgeInsets.only(left: 24, top: 4),
            height: 40,
            width: 2,
            color: Colors.grey,
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      appBar: AppBar(
        leading: currentStep > 0
            ? IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            setState(() {
              currentStep--;
            });
            _pageController.animateToPage(
              currentStep,
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          },
        )
            : null,
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
            padding: const EdgeInsets.only(top: 20, left: 27, right: 27),
            child: Row(
              children: [
                buildStepCircle(0),
                buildStepLine(),
                buildStepCircle(1),
                buildStepLine(),
                buildStepCircle(2),
              ],
            ),
          ),
          SizedBox(height: 24),
          Divider(color: Colors.grey[400]),
          heightSpace(value: 2),
          Expanded(
            child: PageView(
              controller: _pageController,
              physics: NeverScrollableScrollPhysics(),
              children: steps,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 35, left: 30, right: 30),
            child: Genral_Button(
              text: currentStep == steps.length - 1
                  ? 'Place Order'
                  : 'Continue',
              ontap: goToNextStep,
            ),
          ),
        ],
      )
          : Row(
        children: [
          // Left Stepper
          Container(
            width: Sizeresponsive.defaultSize! * 25,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(3, (index) => buildStepItem(index)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 20, left: 20, right: 20),
                  child: Genral_Button(
                    text: currentStep == steps.length - 1
                        ? 'Place Order'
                        : 'Continue',
                    ontap: goToNextStep,
                  ),
                ),
              ],
            ),
          ),
          // Right Page Content
          Expanded(
            child: PageView(
              controller: _pageController,
              physics: NeverScrollableScrollPhysics(),
              children: steps,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildStepCircle(int step) {
    bool isCurrent = step == currentStep;
    Color outerColor = isCurrent ? kMainColor : Colors.grey;
    Color innerCircleColor = isCurrent ? kMainColor : Colors.grey;

    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.circle,
                border: Border.all(color: outerColor, width: 2),
              ),
            ),
            Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                color: innerCircleColor,
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        Text(
          ['Delivery Time', 'Delivery Address', 'Payment'][step],
          style: TextStyle(
            color: outerColor,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget buildStepLine() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1),
        child: DashedDivider(
          height: 3,
          color: Colors.grey,
        ),
      ),
    );
  }
}

String orderCode = "#${DateTime.now().millisecondsSinceEpoch.toString().substring(6)}";
