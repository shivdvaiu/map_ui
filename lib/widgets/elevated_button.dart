import 'package:flutter/material.dart';

class MyElevatedButton extends StatelessWidget {
final Widget child;
MyElevatedButton({required this.child});

  @override
  Widget build(BuildContext context) {

    var colorScheme = Theme.of(context).colorScheme;
    return  ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical:12,horizontal: 26),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
        primary: Color(0xfff7bae7)),
      onPressed: (){}, child: child);
  }
}