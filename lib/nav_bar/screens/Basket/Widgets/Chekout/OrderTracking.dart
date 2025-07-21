import 'package:flutter/material.dart';

import '../../../../../core/Widgets/Custom_Buttons.dart';
import '../../../../../core/Widgets/TrackingStepsWidget.dart';
import '../../../../../core/Widgets/space_widget.dart';
import '../../../../../core/utilis/size_responsive.dart';
import '../../../orders_page.dart';
import '../../basketPageDetails.dart';
import 'Stepper.dart';

class orderTrack extends StatelessWidget {
  const orderTrack({super.key});

  @override
  Widget build(BuildContext context) {
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.5),
          child: Container(height: 1.5, color: Colors.grey),
        ),
        title: const Text(
          'Order Tracking',
          style: TextStyle(color: kMainColor, fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: Sizeresponsive.defaultSize! * 2,
          horizontal: Sizeresponsive.defaultSize! * 2.5,
        ),
        child: isPortrait
            ? Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Your order code: $orderCode',
              style: const TextStyle(color: Colors.grey, fontSize: 17),
            ),
            heightSpace(value: Sizeresponsive.defaultSize! * 0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${getTotalItems()} Items - ',
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
                Text(
                  '${(calculateSubtotal() + calculateShipping()).toStringAsFixed(2)} KD',
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
            heightSpace(value: Sizeresponsive.defaultSize! * 0.05),
            const Text(
              'Payment Method : Cash',
              style: TextStyle(color: Colors.grey, fontSize: 17),
            ),
            heightSpace(value: Sizeresponsive.defaultSize! * 0.2),
             TrackingSteps(),
            heightSpace(value: Sizeresponsive.defaultSize! * 0.15),
            Genral_Button(
              text: 'Confirm',
              ontap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const orders_page()),
                );
              },

            ),
            heightSpace(value: Sizeresponsive.defaultSize! * 0.15),
            log_Button(
              text: 'Cancel Order',
              ontap: () => _showCancelOrder(context),
              icon: null,
              color: Colors.red[600]!,
              color_text: Colors.white,
              color_icon: Colors.white,

            ),
          ],
        )
            : Row(
          children: [
            // Left side: fixed TrackingSteps (shrunk height)
            Expanded(
              flex: 4,
              child: SizedBox(
                height: screenHeight * 0.9, // make sure it fits
                child: const SingleChildScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  child: TrackingSteps(),
                ),
              ),
            ),

            // Right side: center-aligned static column
            Expanded(
              flex: 5,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'Your order code:',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    Text(
                      orderCode,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    heightSpace(value: 0.5),
                    Text(
                      '${getTotalItems()} Items - ${(calculateSubtotal() + calculateShipping()).toStringAsFixed(2)} KD',
                      style: const TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    heightSpace(value: 0.5),
                    const Text(
                      'Payment Method : Cash',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    heightSpace(value: 1),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40, ),
                      child: Genral_Button(
                        text: 'Confirm',
                        ontap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const orders_page()),
                          );
                        },

                      ),
                    ),
                    heightSpace(value: 1),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40, ),
                      child: log_Button(
                        text: 'Cancel Order',
                        ontap: () => _showCancelOrder(context),
                        icon: null,
                        color: Colors.red[600]!,
                        color_text: Colors.white,
                        color_icon: Colors.white,

                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


void _showCancelOrder(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => SingleChildScrollView(
      child: AlertDialog(
        backgroundColor: Colors.white,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Cancel Order',
              style: TextStyle(
                  color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
              'Reason',
              style: TextStyle(
                color: Colors.grey,
              ),
            )),
            heightSpace(value: 1),
            Container(
              height: 50,
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
                padding: EdgeInsets.symmetric(horizontal:Sizeresponsive.defaultSize! * 0.8 ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Please select reason', style: TextStyle(color: Colors.black)),
                    Icon(
                      Icons.arrow_drop_down,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ),
            heightSpace(value: 2),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Notes',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                )),
            heightSpace(value: 1),
            Container(
              height: 100,
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
      
            ),
            heightSpace(value: 3),
            Genral_Button(text: 'Confirm Cancelation', ontap: () {}),
            heightSpace(value: 1),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                child: Text(
                  'Close',
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
