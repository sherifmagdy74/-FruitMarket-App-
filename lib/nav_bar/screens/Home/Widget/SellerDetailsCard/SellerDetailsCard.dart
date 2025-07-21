import 'package:flutter/material.dart';
import 'package:fruit_market/core/Widgets/space_widget.dart';
import '../../Model/Seller_Model.dart';

class SellerDetailsCard extends StatelessWidget {
  final SellerModel seller;

  const SellerDetailsCard({super.key, required this.seller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
        ),
        padding: EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(60),
              child: Image.asset(
                seller.image,
                height: 90,
                width: 90,
                fit: BoxFit.cover,
              ),
            ),
            widthSpace(value: 2),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    seller.sellerName,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  heightSpace(value: 1),
                  Text(
                    'Delivery : 40 to 60 Min',
                    style: TextStyle(color: Colors.grey),
                  ),
                  heightSpace(value: 1),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 5,
                        height: 5,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(11),
                        ),
                      ),
                     widthSpace(value: 0.8),
                      Text(
                        seller.status,
                        style: TextStyle(
                          color: seller.status == "Open"
                              ? Colors.green
                              : Colors.red,
                        ),
                      ),
                      widthSpace(value: 2),
                      Container(
                        width: 5,
                        height: 5,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(11),
                        ),
                      ),
                      widthSpace(value: 0.8),
                      Text(
                        '${seller.rating}',
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                      ),

                    ],
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Icon(Icons.star, color: Colors.amber, size: 20),
            ),
          ],
        ),
      ),
    );
  }
}
