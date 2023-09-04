import 'package:flutter/material.dart';

class CoffeeType extends StatelessWidget {
  final String coffeeType;
  final bool isSelcted;
  final VoidCallback onTap;
  const CoffeeType(
      {super.key,
      required this.coffeeType,
      required this.isSelcted,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0, top: 10),
        child: Text(
          coffeeType,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: isSelcted ? Colors.orange : Colors.white),
        ),
      ),
    );
  }
}
