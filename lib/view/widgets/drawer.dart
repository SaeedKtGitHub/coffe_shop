import 'package:coffe_shop/model/constants.dart';
import 'package:coffe_shop/view/home_page.dart';
import 'package:coffe_shop/view/intro_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: backgroundColor,
        child: Padding(
          padding: const EdgeInsets.only(left: 13.0),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    const SizedBox(height: 50,),
                    // Updated the asset path
                    Image.asset('lib/images/expresso.png', height: 130,),
                    const SizedBox(height: 80,),
                    const SizedBox(width: 15,),
                    ListTile(
                      onTap: () {
                        Get.back();
                        Get.to(const HomePage());
                      },
                      leading: const Icon(Icons.home),
                      title: const Text('Home'),
                    ),
                    const ListTile(
                      leading: Icon(Icons.info),
                      title: Text('About'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 14.0),
                child: ListTile(
                  onTap: ()=>Get.to(IntroPage()),
                  leading: const Icon(Icons.logout_outlined),
                  title: const Text('Logout'),
                  
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
