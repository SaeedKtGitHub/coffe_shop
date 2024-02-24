import 'package:flutter/material.dart';

class buildToggleButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  const buildToggleButton({super.key,required this.label,required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
