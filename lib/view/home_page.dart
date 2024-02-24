import 'package:coffe_shop/model/constants.dart';
import 'package:coffe_shop/controller/home_controller.dart';
import 'package:coffe_shop/view/widgets/bottom_nav_bar.dart';
import 'package:coffe_shop/view/cart_page.dart';
import 'package:coffe_shop/view/widgets/drawer.dart';
import 'package:coffe_shop/view/shop_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {

   const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex=0 ;

  //to manage the pages because we have bottom appbar
  final List<Widget> _pages = [
    const ShopPage(),
    Cart_Page(),
  ];


  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: backgroundColor,
            elevation: 0,
            foregroundColor: Colors.black,
          ),
          backgroundColor: backgroundColor,
          drawer: const MyDrawer(),

          bottomNavigationBar: MyBottomNavBar(
            onTabChange: (index) {
              setState(() {
                _selectedIndex=index;
              });
            },
          ),
          body:_pages[_selectedIndex],
        );
      },
    );
  }

}