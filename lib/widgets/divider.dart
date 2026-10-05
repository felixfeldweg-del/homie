import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  double? height;
  Color? color;
  
  new({super.key , this.height, this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        height: height ?? 1.0,
        width: double.infinity,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: color ?? Colors.grey[200],
          ),
        ),
      ),
    );
  }
}