import 'package:coffe_shop/model/coffe.dart';

class Order{
  Coffe coffe;
  int quantity;
  String size;
   Order({required this.coffe,required this.quantity,required this.size});

}