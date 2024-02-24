import 'package:flutter/material.dart';

class PayButton extends StatelessWidget {
  String text;
  final Function()? onPressed;
    PayButton({super.key,required this.text,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(25),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.brown,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 17),
          ),
        ),
      ),
    );
  }
}
