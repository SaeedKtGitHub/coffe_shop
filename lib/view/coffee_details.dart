import 'package:coffe_shop/model/constants.dart';
import 'package:coffe_shop/controller/home_controller.dart';
import 'package:coffe_shop/model/coffe.dart';
import 'package:coffe_shop/view/widgets/build_widget.dart';
import 'package:coffe_shop/view/widgets/pay_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CoffeDetails extends StatefulWidget {
  final Coffe coffe;
  const CoffeDetails({super.key,required this.coffe});
  @override
  State<CoffeDetails> createState() => _CoffeDetailsState();
}

class _CoffeDetailsState extends State<CoffeDetails> {
  int quantity=0;

  @override
  HomeController controller=Get.put(HomeController());
  List<bool> isSelected = [false, true, false];//the state of sizes toggles buttons
  String size='';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: backgroundColor,
          elevation: 0,
          foregroundColor: Colors.black,
        ),
        backgroundColor: backgroundColor,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                const SizedBox(height: 35,),
                //The image:
                Image.asset(widget.coffe.imagePath,height: 150,),
                const SizedBox(height: 45,),
                //Quantity text
                Text('QUANTITY',style: TextStyle(fontSize: 20,color: Colors.grey[600],
                letterSpacing: 5,
                ),),
                const SizedBox(height: 20,),
               Padding(
                 padding: const EdgeInsets.only(left: 100.0,right: 40),
                 //this row has : increment,decrement buttons and quantity counter
                 child: Row(
                   children: [
                     // minus button
                     IconButton(
                       onPressed: (){
                         setState(() {
                        quantity=controller.deccrementQuantity(quantity);
                         });
               },
                       icon: const Icon(Icons.remove),
                     ),
                     Container(
                       height: 60,
                       width: 60,
                       decoration: BoxDecoration(
                         color: Colors.white,
                         shape: BoxShape.rectangle,
                         borderRadius: BorderRadius.circular(10),
                       ),
                       child: Center(
                         child: GetBuilder<HomeController>(
                           builder: (controller) {
                             return Text(
                               quantity.toString(),
                               style: const TextStyle(
                                 fontSize: 22,
                                 fontWeight: FontWeight.bold,
                               ),
                             );
                           },
                         ),
                       ),
                     ),
                     IconButton(
                       onPressed: (){
                         setState(() {
                           quantity=controller.incrementQuantity(quantity);
                         });
                       },
                       icon: const Icon(Icons.add),
                     ),
                   ],
                 ),

               ),
                const SizedBox(height: 45,),
                //Size text
                Text('SIZE',style: TextStyle(fontSize: 20,color: Colors.grey[600],
                  letterSpacing: 5,
                ),),
                const SizedBox(height: 15,),
               //sizes Toggle Buttons:
               ToggleButtons(
                  isSelected: isSelected,
                onPressed: (int index) {
                 setState(() {
                   //set the values of toggles when any button pressed
                   isSelected=controller.setValues(isSelected, index);
                   size!=controller.getSize(index);
                 });

              },
                fillColor: Colors.brown,
                borderRadius: BorderRadius.circular(17.0),
                  children: <Widget>[
                    buildToggleButton(label: 'S',isSelected: isSelected[0]),
                    buildToggleButton(label: 'M',isSelected: isSelected[1]),
                    buildToggleButton(label:'L',isSelected: isSelected[2]),
                    ],
              ),
                const SizedBox(height: 30,),
               //Add to cart button
               PayButton(text: 'Add To Cart', onPressed:(){
                 if(quantity==0){
                   return;}//if the quantity=0,and the user press Add to cart nothing will happen
                 //Show dialog to confirm the adding to cart process
                 controller.showDialog();
                  controller.addItemToCart(widget.coffe,size!,quantity);
               },)
              ],


            ),
          ),
        ),
      ),
    );
  }
}
