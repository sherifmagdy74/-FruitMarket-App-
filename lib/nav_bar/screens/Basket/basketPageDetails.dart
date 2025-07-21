import 'package:flutter/material.dart';

import '../../../core/Widgets/Custom_Buttons.dart';
import '../../../core/Widgets/space_widget.dart';
import '../../../core/utilis/size_responsive.dart';
import '../Home/Widget/productDetails/productPage.dart';
import '../../../core/Widgets/divider.dart';
import 'Widgets/Chekout/Stepper.dart';

class BasketHome extends StatefulWidget {
  const BasketHome({super.key});

  @override
  State<BasketHome> createState() => _BasketHomeState();
}

class _BasketHomeState extends State<BasketHome> {

  @override
  Widget build(BuildContext context) {
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(



      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
        child: ListView.builder(
          itemCount: BasketProducts.length,
          itemBuilder: (context, index) {
            final product = BasketProducts[index];
            return Container(
              width: double.infinity,
              height: 120,
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.symmetric(vertical: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(color: Colors.black12, blurRadius: 5)
                ],
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(product.productName,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      if (product.oldPrice != null)
                        Row(
                          children: [
                            Text(
                              'KD${product.newPrice}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.black),
                            ),
                            const widthSpace(value: 0.5),
                            Text(
                              'KD${product.oldPrice}',
                              style: TextStyle(
                                  color: Colors.grey[400],
                                  decoration: TextDecoration.lineThrough,
                                  decorationColor: Colors.grey[400],
                                  fontSize: 13),
                            ),
                          ],
                        )
                      else if (product.newPrice != null)
                        Text(
                          "${product.newPrice} KD",
                          style: const TextStyle(
                              color: Colors.green, fontWeight: FontWeight.bold),
                        )
                      else
                        const Text(
                          "Price Upon Selection",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      product.discount != null
                          ? Container(
                        width: 100,
                        height: 25,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.red[100],
                        ),
                        child: Text(
                          'Up to ${product.discount!}',
                          style: const TextStyle(color: Colors.redAccent),
                        ),
                      )
                          :const SizedBox.shrink(),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            BasketProducts.removeAt(index);
                          }); // لتحديث الواجهة
                        },
                        icon: Icon(Icons.delete_forever),
                      ),
                      Material(
                          elevation: 8,
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            width: Sizeresponsive.defaultSize! * 11,
                            height: Sizeresponsive.defaultSize! * 2.7,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[100],
                              border: Border.all(color: Colors.grey.shade300),
                            ),
                            child: FittedBox(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    iconSize: 50,
                                    onPressed: () {
                                      setState(() {
                                        if (product.quantity > 1) {
                                          product.quantity--;
                                        }
                                      });
                                    },
                                    icon: const Icon(Icons.remove),
                                  ),
                                  widthSpace(value: 2.5),
                                  Text(
                                    '${product.quantity}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 50,
                                    ),
                                  ),
                                  widthSpace(value: 2.5),
                                  IconButton(
                                    iconSize: 50,
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
                          ))
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
      bottomSheet:
      Container(
        color: Colors.white,
        height: Sizeresponsive.defaultSize! * 35,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(

            children: [
              DashedDivider(
                height: 2,
                color: Colors.grey,
              ),
              heightSpace(value: 2.7),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Subtotal',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.grey),),
                      Text(' ${calculateSubtotal().toStringAsFixed(2)} KD',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.grey),),
                    ],
                  ),
                  heightSpace(value: 2,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Shipping Charges',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.grey),),
                      Text(' ${calculateShipping().toStringAsFixed(2)} KD',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.grey),),
                    ],
                  ),
                  heightSpace(value: 2,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Bag Total',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color:kMainColor),),
                      Text('${(calculateSubtotal() + calculateShipping()).toStringAsFixed(2)} KD',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.grey),),
                    ],
                  ),
                  heightSpace(value: 2,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${getTotalItems()} items in cart',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17,color:Colors.grey),),
                          heightSpace(value: 0.5,),
                          Row(
                            children: [
                              Text(' ${(calculateSubtotal() + calculateShipping()).toStringAsFixed(2)} KD',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17,color: Colors.grey[700]),),
                            ],
                          ),

                        ],
                      ),
                      Expanded(child: Padding(
                        padding: const EdgeInsets.only(left: 75,right: 18),
                        child: Genral_Button(text: 'Procced To Checkout', ontap:(){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => CheckoutStepperPage()));
                        }),
                      ))
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),

    );
  }
}
double calculateSubtotal() {
  return BasketProducts.fold(0, (total, product) {
    final price = double.tryParse(product.newPrice ?? '0') ?? 0;
    return total + (price * product.quantity);
  });
}
double calculateShipping() {
  int totalItems = BasketProducts.fold(0, (sum, product) => sum + product.quantity);
  return 0.5 * totalItems;
}


int getTotalItems() {
  return BasketProducts.fold(0, (sum, product) => sum + product.quantity);
}