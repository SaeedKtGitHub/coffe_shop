import 'package:coffe_shop/controller/home_controller.dart';
import 'package:coffe_shop/view/widgets/coffe_tile.dart';
import 'package:coffe_shop/view/coffee_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShopPage extends StatefulWidget {

   const ShopPage({Key? key}) : super(key: key);
  @override
  State<ShopPage> createState() => _ShopPageState();

}

class _ShopPageState extends State<ShopPage> {
  @override

  Widget build(BuildContext context) {
    return SafeArea(
      child:Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              //heading message:
              const Text('How would you like your coffee?',style: TextStyle(fontSize: 20),),
              const SizedBox(height: 20,),

              //List of coffee to buy:

              GetBuilder<HomeController>(
                builder: (controller){

                  return Expanded(
                    child: ListView.builder(itemCount:controller.coffeShop.length
                   ,itemBuilder: (context,index){
                     return CoffeTile(
                         coffe: controller.coffeShop[index],
                          onPressed: (){
                           Get.to(()=>CoffeDetails(coffe:controller.coffeShop[index] ));
                          },
                       icon: const Icon(Icons.arrow_forward_sharp),
                    );
                       })
                );
                }
              )

            ],
          ),
        ),
      )
    );
  }
}
