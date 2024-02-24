import 'package:coffe_shop/model/constants.dart';
import 'package:coffe_shop/controller/home_controller.dart';
import 'package:coffe_shop/view/home_page.dart';
import 'package:coffe_shop/view/widgets/pay_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntroPage extends StatefulWidget {
   IntroPage({Key? key}) : super(key: key);
  HomeController controller=Get.put(HomeController());

   @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 100,),
                //The image
                Image.asset('lib/images/expresso.png',
                height: 170,
                ),
                const SizedBox(height: 70,),
                const Text('Brew Day',
                style: TextStyle(fontSize: 24,color: Colors.brown,fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30,),
                const Text('Lets have an amazing coffee!',
                  style: TextStyle(fontSize: 18,color: Colors.brown),
                ),
                const SizedBox(height: 60,),
                //The enter shop  button
                PayButton(text: 'Enter the shop', onPressed: ()=>Get.to(const HomePage())),

              ],
            ),
          ),
        ),
      ) ,
    ) ;


  }
}
