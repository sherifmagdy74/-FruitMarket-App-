import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../Model/pageviewCategory.dart';
import '../../../../../../core/Widgets/Custom_Buttons.dart';
import '../../../../../../core/Widgets/space_widget.dart';
import '../../../../../../nav_bar/screens/Home/Widget/SellerDetailsCard/sellerDetailsPage.dart';
import 'row_view.dart';
import 'sellerCard.dart';
import '../../Filter_Feature.dart';
import '../../Model/Seller_Model.dart';

import '../dotindicitor.dart';
import 'items.dart';

class HomePage_body extends StatefulWidget {
  const HomePage_body({super.key});

  @override
  State<HomePage_body> createState() => _HomePage_bodyState();
}

class _HomePage_bodyState extends State<HomePage_body> {
  PageController? pageController;
  final controller = PageController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.portraitUp,
    //   DeviceOrientation.portraitDown,
    // ]);
    pageController = PageController(initialPage: 0)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
        body:  Column(children: [
                SizedBox(height: 20),
                PreferredSize(
                  preferredSize: Size.fromHeight(kToolbarHeight),
                  child: AppBar(
                    automaticallyImplyLeading: false,
                    title: Text(
                      'Fruit Market',
                      style: TextStyle(
                          color: kMainColor,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    actions: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.search,
                          color: kMainColor,
                          size: 35,
                        ),
                      ),
                      IconButton(
                        onPressed: () => showTransparentFilterDialog(context),
                        icon: Image.asset(
                          'assets/icons/filter.png',
                        ),
                        color: kMainColor,
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 1,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 160,
                  child: PageView.builder(
                    onPageChanged: (index) {
                      setState(() {
                        pageController != index.toDouble();
                      });
                    },
                    controller: pageController,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return row_view(
                        category: Roow[index],
                      );
                    },
                    itemCount: Roow.length,
                  ),
                ),
                dotindicitor_home(
                  dotIndex: pageController?.hasClients == true &&
                          pageController?.page != null
                      ? pageController!.page
                      : 0.0,
                  dotsCount: Roow.length,
                ),
                heightSpace(value: 1.5),
                Padding(
                  padding: EdgeInsets.only(right: 7, left: 7),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      item(
                        image: 'assets/items/category.png',
                      ),
                      item(
                        image: 'assets/items/category2.png',
                      ),
                      item(
                        image: 'assets/items/category3.png',
                      ),
                      item(
                        image: 'assets/items/category4.png',
                      ),
                    ],
                  ),
                ),
                heightSpace(value: 3),
                Padding(
                  padding: EdgeInsets.only(left: 9),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Sellers',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'Show all',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 20,
                            ),
                          ))
                    ],
                  ),
                ),

                Expanded(
                  child: ListView.builder(
                    itemCount: sellerList.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SellerDetailsPage(
                                            seller: sellerList[index])));
                              },
                              child: sellerCard(seller: sellerList[index])),
                          heightSpace(value: 1)
                        ],
                      );
                    },
                  ),
                )
              ]));

  }
}
