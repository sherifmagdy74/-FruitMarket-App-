import 'package:flutter/material.dart';
import '../../../../../core/utilis/size_responsive.dart';
import '../../../../../nav_bar/screens/Home/Widget/SellerDetailsCard/productDetails.dart';
import '../../../../../core/Widgets/space_widget.dart';
import '../../../../../core/Widgets/Custom_Buttons.dart';
import '../../Model/Seller_Model.dart';
import '../../Model/categorySellerModel.dart';
import '../../Model/productCardModel.dart';
import '../productDetails/productPage.dart';
import 'SellerDetailsCard.dart';
import 'category.dart';

class SellerDetailsPage extends StatelessWidget {
  const SellerDetailsPage({
    super.key,
    required this.seller,
  });

  final SellerModel seller;

  @override
  Widget build(BuildContext context) {
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: kMainColor,
              size: 35,
            ),
          ),
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
        title: Text('Fruit Market',
            style: TextStyle(
                color: kMainColor,
                fontSize: 30,
                fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),

      body: Padding(
        padding:  EdgeInsets.symmetric(vertical: Sizeresponsive.defaultSize! * 0.5, horizontal: Sizeresponsive.defaultSize! * 1.2),
        child: isPortrait? Column(
          children: [
            SellerDetailsCard(seller: seller),
            heightSpace(value: 0.5),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Categories',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                )),
            heightSpace(value: 1.5),
            SizedBox(
              height: 125,
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(width: 7),
                scrollDirection: Axis.horizontal,
                itemCount: categorySellerList.length,
                itemBuilder: (context, index) {
                  return categorySeller(category: categorySellerList[index]);
                },
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Products',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Image.asset('assets/icons/prouductIcon.png'))
              ],
            ),
            heightSpace(value: 1.5),
            Expanded(
              child: ListView.separated(
                itemCount: productCards.length,
                separatorBuilder: (context, index) => SizedBox(height: 10),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => productDetais(product: productCards[index],)));

                    },
                      child: ProductCard(product: productCards[index]));
                },
              ),
            ),
          ],
        ):Row(
          children: [
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                child: Column(children: [
                  SellerDetailsCard(seller: seller),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Categories',
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                      )),
                  heightSpace(value: .8),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(width: 5),
                      scrollDirection: Axis.horizontal,
                      itemCount: categorySellerList.length,
                      itemBuilder: (context, index) {
                        return categorySeller(category: categorySellerList[index]);
                      },
                    ),
                  ),
                ],),
              ),
            ),

            Expanded(
              flex: 1,
              child: Padding(
                padding:  EdgeInsets.only(top: Sizeresponsive.defaultSize! * 0.5),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Products',
                          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Image.asset('assets/icons/prouductIcon.png'))
                      ],
                    ),
                    heightSpace(value: .5),
                    Expanded(
                      child: ListView.separated(
                        itemCount: productCards.length,
                        separatorBuilder: (context, index) => SizedBox(height: 10),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => productDetais(product: productCards[index],)));

                              },
                              child: ProductCard(product: productCards[index]));
                        },
                      ),
                    ),
                  ],),
              ),
            )],
              ),
            )

       );


  }
}
