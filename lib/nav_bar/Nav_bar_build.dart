import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fruit_market/nav_bar/screens/Home/home_page_view.dart';
import 'package:fruit_market/nav_bar/screens/Basket/basket_page.dart';
import 'package:fruit_market/nav_bar/screens/favourit/favourit_page.dart';
import 'package:fruit_market/nav_bar/screens/more/more_page.dart';
import 'package:fruit_market/nav_bar/screens/orders_page.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../core/Widgets/Custom_Buttons.dart';

class NavBarBuild extends StatefulWidget {
  const NavBarBuild({super.key});
  static const String routeName = '/navbar';
  @override
  State<NavBarBuild> createState() => _NavBarBuildState();
}

class _NavBarBuildState extends State<NavBarBuild> {
  int currentIndex = 0;

  final List<Widget> screens = [
    HomePage(),
    orders_page(),
    basket_page(),
    favourit_page(),
    more_page(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return false;
      },
      child: Scaffold(
        extendBody: true,
        body: screens[currentIndex],
        bottomNavigationBar: ClipRRect(

          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          child: Container(

            height: 65,
            decoration: BoxDecoration(

              color: kMainColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),

            ), // الخلفية الرئيسية
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: GNav(
              activeColor: kMainColor,
              iconSize: 20,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: Colors.white,
              color: Colors.white.withOpacity(0.6),
              selectedIndex: currentIndex,
              onTabChange: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.reorder,
                  text: 'Orders',
                ),
                GButton(
                  icon: Icons.shopping_basket_outlined,
                  text: 'Basket',
                ),
                GButton(
                  icon: Icons.favorite_border,
                  text: 'Favourite',
                ),
                GButton(
                  icon: Icons.more_horiz_sharp,
                  text: 'More',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
