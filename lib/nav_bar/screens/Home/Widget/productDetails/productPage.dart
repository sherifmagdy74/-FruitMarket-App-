import 'package:flutter/material.dart';
import 'package:fruit_market/core/Widgets/space_widget.dart';
import 'package:fruit_market/core/utilis/size_responsive.dart';

import '../../../../../core/Widgets/Custom_Buttons.dart';
import '../../Model/productCardModel.dart';
import 'DropDown.dart';

class productDetais extends StatelessWidget {
  const productDetais({super.key, required this.product});

  final ProductCardModel product;

  @override
  Widget build(BuildContext context) {
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              if (!favouriteProducts.contains(product)) {
                favouriteProducts.add(product);
              }

              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${product.productName} added to favourites'),backgroundColor: kMainColor,)
              );

            },
            icon: Icon(Icons.favorite_border),
          ),          IconButton(onPressed: () {}, icon: Icon(Icons.file_upload_outlined)),
        ],
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
        title: Text('Product Name',
            style: TextStyle(
                color: kMainColor,
                fontSize: 30,
                fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),

      body: isPortrait?SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          Stack(
          children: [
          Container(
          width: double.infinity,
            height: 170,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              boxShadow: const [
                BoxShadow(color: Colors.black12, blurRadius: 15)
              ],
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image.asset(
                  product.image,
                  fit: BoxFit.fill,
                )),
          ),
          product.discount != null
              ? Padding(
            padding: const EdgeInsets.only(right: 15, top: 15),
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                width: 100,
                height: 25,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[100],
                ),
                child: Text(
                  product.discount!,
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            ),
          )
              : SizedBox.shrink(),
          ],
        ),
        heightSpace(value: 1.5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Category Name',
                  style: TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: kMainColor),
                ),
                heightSpace(value: 0.5),
                Text(
                  product.productName,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  'Price',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                heightSpace(value: 0.5),
        
        
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
                            color: Colors.red[300],
                            decoration: TextDecoration.lineThrough,
                            decorationColor: Colors.red[300],
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
                heightSpace(value: 0.5),
        
        
        
                  ],
                )
              ],
            ),
            heightSpace(value: 1.5),
              Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',style: TextStyle(color: Colors.grey,)),
              heightSpace(value: 2),
               Text('Sell Per : Kartoon',style: TextStyle(color: Colors.grey,fontSize: 15),),
              heightSpace(value: 2),
              SimpleMultiDropdown(title: 'Select weight',),
              heightSpace(value: 2),
              SimpleMultiDropdown(title: 'Select Addons',),
              Padding(
                padding: const EdgeInsets.only(left:210 ),
                child: Genral_Button(text: 'Add to Cart', ontap: () {
                  if (!BasketProducts.contains(product)) {
                    BasketProducts.add(product);
                  }

                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('${product.productName} added to Basket',),backgroundColor: kMainColor,)
                  );},),
              )
        
            ],
        ),
            ),
      ):Row(
        children: [
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              child: Padding(
                padding:  EdgeInsets.symmetric(vertical: Sizeresponsive.defaultSize! * 1, horizontal: Sizeresponsive.defaultSize! * 1),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 170,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            boxShadow: const [
                              BoxShadow(color: Colors.black12, blurRadius: 15)
                            ],
                          ),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(40),
                              child: Image.asset(
                                product.image,
                                fit: BoxFit.fill,
                              )),
                        ),
                        product.discount != null
                            ? Padding(
                          padding: const EdgeInsets.only(right: 15, top: 15),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              width: 100,
                              height: 25,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey[100],
                              ),
                              child: Text(
                                product.discount!,
                                style: const TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        )
                            : SizedBox.shrink(),
                      ],
                    ),
                    heightSpace(value: 1.5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Category Name',
                              style: TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: kMainColor),
                            ),
                            heightSpace(value: 0.5),
                            Text(
                              product.productName,
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'Price',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            heightSpace(value: 0.5),


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
                                        color: Colors.red[300],
                                        decoration: TextDecoration.lineThrough,
                                        decorationColor: Colors.red[300],
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
                            heightSpace(value: 0.5),



                          ],
                        )
                      ],
                    ),
                    heightSpace(value: 1.5),
                    Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',style: TextStyle(color: Colors.grey,)),

                  ],
                ),
              ),
            ),
          ),
         Expanded(
           flex: 1,
           child: SingleChildScrollView(
             child: Padding(
               padding:  EdgeInsets.only             (right: Sizeresponsive.defaultSize! * 1, left: Sizeresponsive.defaultSize! * 1,bottom: Sizeresponsive.defaultSize! * 3),

               child: Column(
                 children: [
                   Text('Sell Per : Kartoon',style: TextStyle(color: Colors.grey,fontSize: 15),),
                   heightSpace(value: 3),
                   SimpleMultiDropdown(title: 'Select weight',),
                   heightSpace(value: 2),
                   SimpleMultiDropdown(title: 'Select Addons',),
                   heightSpace(value: 2),
                   Padding(
                     padding: const EdgeInsets.only(left:210 ),
                     child: Genral_Button(text: 'Add to Cart', ontap: () {
                       if (!BasketProducts.contains(product)) {
                         BasketProducts.add(product);
                       }

                       ScaffoldMessenger.of(context).showSnackBar(
                           SnackBar(content: Text('${product.productName} added to Basket',),backgroundColor: kMainColor,)
                       );},),
                   )
                 ],
               ),
             ),
           ),
         ),



        ],
      ));
  }
}
List<ProductCardModel> favouriteProducts = [];
List<ProductCardModel> BasketProducts = [];