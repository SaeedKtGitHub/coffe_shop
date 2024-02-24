import 'package:coffe_shop/model/constants.dart';
import 'package:coffe_shop/controller/home_controller.dart';
import 'package:coffe_shop/model/order.dart';
import 'package:coffe_shop/view/widgets/coffee_tile_cart.dart';
import 'package:coffe_shop/view/widgets/pay_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cart_Page extends StatefulWidget {
   Cart_Page({Key? key}) : super(key: key);

  HomeController controller=Get.put(HomeController(),permanent: false);
  @override
  State<Cart_Page> createState() => _Cart_PageState();
}

class _Cart_PageState extends State<Cart_Page> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: GetBuilder<HomeController>(
            builder: (controller) {
              //if the cart is empty I will show an Empty cart message,ternary expression will help me
              return controller.userCart.isEmpty
                  ? const Center(
                   child: Text('The cart is empty, Let\'s fill it! ',style: TextStyle(fontSize: 18),),
              )
                  : Column(//the list is not empty so I will show the content
                  children: [
                  const Text('Your Cart', style: TextStyle(fontSize: 23)),
                  const SizedBox(height: 15),
                  Expanded(
                    child: ListView.builder(
                      itemCount: controller.userCart.length,
                      itemBuilder: (context, index) {
                        Order order = controller.userCart[index];
                        //the list item will be CoffeTileCart
                        return CoffeTileCart(
                          icon: const Icon(Icons.delete),
                          quantity: order.quantity,
                          size: order.size,
                          coffe: order.coffe,
                          onPressed: () {
                            Get.closeCurrentSnackbar();
                            controller.removeItemFromCard(order);

                            Get.snackbar(
                              'Expense deleted',
                              '',
                              duration: const Duration(seconds: 2),
                              backgroundColor: Colors.brown,
                              colorText: Colors.white,
                              snackPosition: SnackPosition.BOTTOM,
                              mainButton: TextButton(
                                onPressed: () {
                                  setState(() {
                                    controller.retrieveOrder(order, index);
                                  });
                                },
                                child: const Text('Undo',
                                  style: TextStyle(
                                    color: Colors.white, // Customize the button text color
                                  ),
                                ),
                              ),
                            );

                          }




                        );
                      },
                    ),
                  ),
                  PayButton(text: 'Pay now', onPressed:controller.payNow
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

}
