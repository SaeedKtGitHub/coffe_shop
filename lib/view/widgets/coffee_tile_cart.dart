import 'package:flutter/material.dart';
import 'package:coffe_shop/model/coffe.dart';

class CoffeTileCart extends StatefulWidget {
  final Coffe coffe;
  final Widget icon;
  final Function()? onPressed;
  final int quantity;
  final String size;

  const CoffeTileCart({
    Key? key,
    required this.coffe,
    required this.onPressed,
    required this.icon,
    required this.quantity,
    required this.size,
  }) : super(key: key);

  @override
  State<CoffeTileCart> createState() => _CoffeTileCartState();
}

class _CoffeTileCartState extends State<CoffeTileCart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
      child: ListTile(
        title: Text(
          widget.coffe.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Size: ${widget.size}',
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
            Text(
              'Quantity: ${widget.quantity}',
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Price: ${widget.quantity} x ${widget.coffe.price.toStringAsFixed(2)} = ${(widget.quantity * widget.coffe.price).toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),

              ],
            ),
          ],
        ),
        leading: Image.asset(
          widget.coffe.imagePath,
          width: 80,
          height: 80,
          fit: BoxFit.cover,
        ),
        trailing: IconButton(
          onPressed: widget.onPressed,
          icon: widget.icon,
        ),
      ),
    );
  }
}
