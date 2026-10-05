import 'package:flutter/material.dart';

class SubPanel extends StatelessWidget {

  Widget child;
  new({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: Colors.white,
          border: Border.all(color: Colors.grey[300]!, width: 1),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: child,
        )
      ),
    );
  }
}