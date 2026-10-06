import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function? onTap; 
  const new({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[300]!, )
        
        ),
      ));
  }
}
