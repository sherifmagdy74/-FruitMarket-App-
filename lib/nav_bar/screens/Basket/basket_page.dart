import 'package:flutter/material.dart';

import '../../../core/Widgets/Custom_Buttons.dart';
import '../../../core/Widgets/divider.dart';
import '../../../core/Widgets/space_widget.dart';
import '../../../core/utilis/size_responsive.dart';
import '../Home/Widget/productDetails/productPage.dart';
import 'Widgets/Chekout/Stepper.dart';
import 'basketPageDetails.dart';

class basket_page extends StatefulWidget {
  const basket_page({super.key});

  @override
  State<basket_page> createState() => _basket_pageState();
}

class _basket_pageState extends State<basket_page> {
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
        title: Text('Basket',
            style: TextStyle(
                color: kMainColor,
                fontSize: 30,
                fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: isPortrait
          ? BasketHome()
          : Row(
        children: [
          Expanded(
            flex: 1,
            child: ListView.builder(
              itemCount: BasketProducts.length,
              itemBuilder: (context, index) {
                final product = BasketProducts[index];
                return Padding(
                  padding:EdgeInsets.only(left: Sizeresponsive.defaultSize! * 1,right: Sizeresponsive.defaultSize! * 3),
                  child: Container(
                    height: 120,
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 5)],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Material(
                          elevation: 10,
                          borderRadius: BorderRadius.circular(60),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(60),
                            child: Image.asset(
                              product.image,
                              height: 90,
                              width: 90,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(product.productName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                                if (product.oldPrice != null)
                                  Row(
                                    children: [
                                      Text('KD${product.newPrice}',
                                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                                      const widthSpace(value: 0.5),
                                      Text('KD${product.oldPrice}',
                                          style: TextStyle(
                                              color: Colors.grey[400],
                                              decoration: TextDecoration.lineThrough,
                                              fontSize: 13)),
                                    ],
                                  )
                                else
                                  Text("${product.newPrice ?? 'Price Upon Selection'} KD",
                                      style: const TextStyle(
                                          color: Colors.green, fontWeight: FontWeight.bold)),

                                /// Discount Badge
                                if (product.discount != null)
                                  Container(
                                    width: 100,
                                    height: 25,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.red[100],
                                    ),
                                    child: Text('Up to ${product.discount!}',
                                        style: const TextStyle(color: Colors.redAccent)),
                                  ),
                              ],
                            ),
                          ),
                        ),

                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  BasketProducts.removeAt(index);
                                });
                              },
                              icon: const Icon(Icons.delete_forever),
                            ),
                            Material(
                              elevation: 5,
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
height: Sizeresponsive.defaultSize! * 4,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey[100],
                                  border: Border.all(color: Colors.grey.shade300),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          if (product.quantity > 1) {
                                            product.quantity--;
                                          }
                                        });
                                      },
                                      icon: const Icon(Icons.remove),
                                    ),
                                    Text('${product.quantity}',
                                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          product.quantity++;
                                        });
                                      },
                                      icon: const Icon(Icons.add),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.white,
              padding:  EdgeInsets.only(bottom: Sizeresponsive.defaultSize! * 6.5,left: Sizeresponsive.defaultSize! * 1.5,right: Sizeresponsive.defaultSize! * 1.5),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Subtotal', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.grey)),
                        Text('${calculateSubtotal().toStringAsFixed(2)} KD', style: const TextStyle(fontSize: 15)),
                      ],
                    ),
                    heightSpace(value: 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Shipping Charges', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.grey)),
                        Text('${calculateShipping().toStringAsFixed(2)} KD', style: const TextStyle(fontSize: 15)),
                      ],
                    ),
                    heightSpace(value: 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Bag Total', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: kMainColor)),
                        Text('${(calculateSubtotal() + calculateShipping()).toStringAsFixed(2)} KD',
                            style: const TextStyle(fontSize: 15)),
                      ],
                    ),
                    heightSpace(value:2 ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${getTotalItems()} items in cart',
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color: Colors.grey)),
                            heightSpace(value: 0.5),
                            Text('${(calculateSubtotal() + calculateShipping()).toStringAsFixed(2)} KD',
                                style: TextStyle(fontSize: 17, color: Colors.grey[700], fontWeight: FontWeight.bold)),
                          ],
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Genral_Button(
                              text: 'Proceed To Checkout',
                              ontap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => CheckoutStepperPage()));
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      )
    );
  }

}
