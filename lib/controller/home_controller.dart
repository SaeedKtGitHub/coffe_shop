import 'package:coffe_shop/model/coffe.dart';
import 'package:coffe_shop/model/order.dart';
import 'package:coffe_shop/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{

  final   List<Coffe> _shop=[
    Coffe(name: 'Long Black',
        price: 4.10,
        imagePath: 'lib/images/black.png'),
    Coffe(name: 'Latte',
        price: 4.20,
        imagePath: 'lib/images/latte.png'),
    Coffe(name: 'Espresso',
        price: 3.50,
        imagePath: 'lib/images/expresso.png'),
    Coffe(name: 'Iced Coffe',
        price: 4.40,
        imagePath: 'lib/images/ice-coffee.png'),
  ];


  final List<Order> _userCart=[];
  List<Coffe> get coffeShop=>_shop;
  List<Order> get userCart=>_userCart;

  //retrieve Order when press Undo (in Snakcbar)
  void retrieveOrder(Order order,int index){
    userCart.insert(index, order);
  }

  void addItemToCart(Coffe coffee,String size,int quantity){
    if(size==''){//if the user didn't chose a size,the size will be 'M'
      size='M';
    }
    Order order=Order(coffe: coffee, quantity: quantity, size: size);
    _userCart.add(order);
    update();
  }

  void removeItemFromCard(Order order){
    _userCart.remove(order);
    update();
  }

  //show dialog when order Successfully added to cart
  void showDialog(){
    Get.defaultDialog(
      title: 'Success!',
      titleStyle: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      middleText: 'Successfully added to cart!',
      middleTextStyle: const TextStyle(
        fontSize: 18, // Adjust the font size as needed
      ),
      barrierDismissible: false,
      textConfirm: 'OK',
      confirmTextColor: Colors.blue, // Change the text color to match your theme
      buttonColor: Colors.white, // Customize the button's background color
      onConfirm: () {
        Get.back();
        Get.back();

      },
      radius: 10, // Customize the dialog's border radius
    );
  }

  //calculate the bill for all the orders
  double calculateBill (){
    double total=0;
    for(int i=0;i<userCart.length;i++){
      double orderPrice=(userCart[i].coffe.price.toDouble())*userCart[i].quantity.toDouble();
      total+=orderPrice;
    }
   return total;
  }

  //show dialog when press pay to show the Confirmation dialog and then pay
  void payNow(){

    Get.defaultDialog(
      title: 'Pay!',
      titleStyle: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),

      content: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Total = \$${calculateBill().toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 10),
             const Text (
              'Are you sure you want to place this order?',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
      barrierDismissible: false,
      textConfirm: 'OK',
      confirmTextColor: Colors.blue,
      textCancel: 'No',
      cancelTextColor: Colors.red,
      buttonColor: Colors.white,
      onConfirm: () {
        //Add pay logic here
        Get.back();
        Get.back();
        Get.to(const HomePage());

        update();
      },
      onCancel: () {

      },
      radius: 10, // Customize the dialog's border radius
    );
    //Pay service logic here:
  }
  int  incrementQuantity(int quantity){
    return ++quantity;
  }
  int deccrementQuantity(int quantity){
    if(quantity==0){return 0 ;} //to prevent minus Quantity if user press - and quantity=0
    return --quantity;
  }

  //set the toggle buttons values,the index(which is the selected toggle) will be true and the other will be false
  List<bool> setValues(List<bool> isSelected,int index){

      for (int buttonIndex = 0; buttonIndex < isSelected.length; buttonIndex++) {
        if (buttonIndex == index) {
          isSelected[buttonIndex] = true;
        } else {
          isSelected[buttonIndex] = false;
        }
      }

      return isSelected;
    }


  Map<int,String>  sizes = {
    0: "S",
    1: "M",
    2: "L",
  };
    //determine the sizes depending on the index
      String? getSize(int index){
          return sizes[index];
      }



    }



