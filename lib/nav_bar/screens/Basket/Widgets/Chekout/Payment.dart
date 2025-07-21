import 'package:flutter/material.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

import '../../../../../core/Widgets/Custom_Buttons.dart';
import '../../../../../core/Widgets/space_widget.dart';
import '../../basketPageDetails.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20,top: 5),
              child: Text(
                'Coupon Code',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            heightSpace(value: 0.5),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 7),
              child: Container(
                height: 55,
                width: double.infinity,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 15,
                      spreadRadius: 2,
                      offset: Offset(2, 4),
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Do You Have any Coupon Code?',
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 35,
                          width: 80,
                          decoration: BoxDecoration(
                              color: kMainColor,
                              borderRadius: BorderRadius.circular(30)),
                          child: Center(
                            child: Text(
                              'Apply',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            heightSpace(value: 2),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Order Details',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            heightSpace(value: 1),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total Items',style: TextStyle(fontSize: 16,color: Colors.grey[500]) ,),
                      Text('${getTotalItems()} Items in cart',style: TextStyle(fontSize: 16,color: Colors.grey[700],fontWeight: FontWeight.bold) ,),
                    ],
                  ),
                  heightSpace(value: 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Subtotal',style: TextStyle(fontSize: 16,color: Colors.grey[500]) ,),
                      Text(' ${calculateSubtotal().toStringAsFixed(2)} KD',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.grey[700]),),
                    ],
                  ),
                  heightSpace(value: 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Shipping Charges',style: TextStyle(fontSize: 16,color: Colors.grey[500]) ,),
                      Text('${calculateShipping().toStringAsFixed(2)} KD',style: TextStyle(fontSize: 16,color: Colors.grey[700],fontWeight: FontWeight.bold) ,),
                    ],
                  ),
                  Divider(color: Colors.grey,),
                  heightSpace(value: 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Bag Total',style: TextStyle(fontSize: 20,color: kMainColor,fontWeight: FontWeight.bold) ,),
                      Text('${(calculateSubtotal() + calculateShipping()).toStringAsFixed(2)} KD',style: TextStyle(fontSize: 16,color: kMainColor,fontWeight: FontWeight.bold) ,),
                    ],
                  ),
                ],
              ),
            ),
            heightSpace(value: 2.5),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Payment',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Container(
                height: 55,
                width: double.infinity,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 15,
                      spreadRadius: 2,
                      offset: Offset(2, 4),
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Image.asset('assets/checkout/cash.png'),
                      widthSpace(value: 0.5),
                      Text(
                        'Credit Card/Debit card',
                        style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      Spacer(),
                      RoundCheckBox(
                        size: 30,
                        onTap: (selected) {},),
        
        
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
              child: Container(
                height: 55,
                width: double.infinity,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 15,
                      spreadRadius: 2,
                      offset: Offset(2, 4),
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Image.asset('assets/checkout/cridet.png'),
                      widthSpace(value: 0.5),
                      Text(
                        'Cash of Delivery',
                        style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      Spacer(),
                      RoundCheckBox(
                        size: 30,
                        onTap: (selected) {},),
        
        
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 15,bottom: 20),
              child: Container(
                height: 55,
                width: double.infinity,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 15,
                      spreadRadius: 2,
                      offset: Offset(2, 4),
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Image.asset('assets/checkout/knet.png'),
                      widthSpace(value: 0.5),
                      Text(
                        'Knet',
                        style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      Spacer(),
                      RoundCheckBox(
                        size: 30,
                        onTap: (selected) {},),
        
        
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
