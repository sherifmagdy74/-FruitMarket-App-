import 'package:flutter/material.dart';
import '../../../core/Widgets/Custom_Buttons.dart';
import '../../../core/Widgets/space_widget.dart';
import '../Home/Widget/productDetails/productPage.dart';

class favouritPageDetails extends StatefulWidget {
  const favouritPageDetails({super.key, });

  @override
  State<favouritPageDetails> createState() => _favouritPageDetailsState();
}

class _favouritPageDetailsState extends State<favouritPageDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  title: Text('Favourit',
      style: TextStyle(
          color: kMainColor, fontSize: 30, fontWeight: FontWeight.bold)),
  centerTitle: true,
),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: favouriteProducts.length,
          itemBuilder: (context, index) {
            final product = favouriteProducts[index];
            return Container(
              width: double.infinity,
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
                    borderRadius:BorderRadius.circular(60) ,
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
                          style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                      if(product.oldPrice != null)
                        Row(
                          children: [
                            Text(
                              'KD${product.newPrice}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.black),
                            ),
                            widthSpace(value: 0.5),
                            Text(
                              'KD${product.oldPrice}',
                              style: TextStyle(
                                  color: Colors.grey[400],
                                  decoration: TextDecoration.lineThrough,
                                  decorationColor: Colors.grey[400],
                                  fontSize: 16),
                            ),
                          ],
                        ) else
                        if(product.newPrice != null)
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
                      Row(
                        children: [
                          Text('Store Name :', style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                          Text(' Store One', style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),

                        ],
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          favouriteProducts.removeAt(index);
                        });
                      },
                      icon: Icon(Icons.cancel),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),

    );
  }
}
