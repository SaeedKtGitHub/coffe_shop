import 'package:coffe_shop/model/coffe.dart';
import 'package:flutter/material.dart';

class CoffeTile extends StatefulWidget {
  final  Coffe coffe;
  final Widget icon;
  final Function()? onPressed;
  const CoffeTile({super.key,required this.coffe,required this.onPressed,required this.icon});

  @override
  State<CoffeTile> createState() => _CoffeTileState();
}

class _CoffeTileState extends State<CoffeTile> {
  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),

      ),
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(vertical: 18,horizontal: 10),
      child: ListTile(
        title: Text(widget.coffe.name),
        subtitle: Text('\$ ${widget.coffe.price.toStringAsFixed(2)}'),
        leading: Image.asset(widget.coffe.imagePath),
        trailing: IconButton(
            onPressed:widget.onPressed ,
            icon: widget.icon,
      ),
    )
    );
  }

}
