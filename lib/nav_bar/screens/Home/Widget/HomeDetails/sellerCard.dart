import 'package:flutter/material.dart';

import '../../../../../core/Widgets/Custom_Buttons.dart';
import '../../../../../core/Widgets/space_widget.dart';
import '../../../../../core/utilis/size_responsive.dart';
import '../../Model/Seller_Model.dart';

class sellerCard extends StatelessWidget {
  const sellerCard({super.key, required this.seller});


  final SellerModel seller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 7, left: 7),
      child: Stack(
        children: [
          Material(
            elevation: 15,
            borderRadius: BorderRadius.circular(20),
            child: Container(
              height: Sizeresponsive.defaultSize! * 15,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),

            ),
          ),
          SizedBox(
            height: Sizeresponsive.defaultSize! * 14,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Material(
                    elevation: 3,
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(60),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(70),
                      child: Image.asset(
                         seller.image ,
                        height: Sizeresponsive.defaultSize! * 10,
                        width: Sizeresponsive.defaultSize! * 10,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  widthSpace(value: 1.5),
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,

                      children: [
                        Row(
                          children: [
                            Text(seller.sellerName,
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold)),
                            widthSpace(value: 1),
                            Icon(Icons.star, color: Colors.amber, size: 18),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.delivery_dining_outlined,color:Colors.grey ,),
                            Text('Delivery Charges: ${seller.deliveryCharge}',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 12),),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Container(
                                width: Sizeresponsive.defaultSize! * .5,
                                height: Sizeresponsive.defaultSize! * .5,
                                color: Colors.grey,
                              ),
                            ),
                            widthSpace(value: 1),
                            Text(
                              seller.status,
                              style: TextStyle(color: seller.status == "Open" ? Colors.green : Colors.red,fontSize: 12),
                            ),
                            widthSpace(value: 3),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Container(
                                width: Sizeresponsive.defaultSize! * .5,
                                height: Sizeresponsive.defaultSize! * .5,
                                color: Colors.grey,
                              ),
                            ),
                            widthSpace(value: 0.3),
                            Text(
                              seller.category,
                              style: TextStyle(color: Colors.blue,fontSize: 12),
                            ),

                          ],
                        )
                      ],
                    ),
                  ),

                  widthSpace(value: 1.5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,

                    children: [
                      Text(seller.rating.toString(),style: TextStyle(color: Colors.grey,fontSize: 10),),
                      Row(
                        children: [
                          Text('${seller.distance} KM' ,style: TextStyle(color: kMainColor,fontSize: 10),),
                          Icon(Icons.location_on_outlined,color: kMainColor,size: 10,)
                        ],
                      )
                    ],
                  ),

                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}


