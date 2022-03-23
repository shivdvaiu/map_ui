import 'package:flutter/material.dart';

class CustomChip extends StatelessWidget {
  final String itemName,path;
  final Color color;
  Color? textColor = Color(0xff662363);
  CustomChip({required this.itemName,required this.path, this.color=Colors.transparent,this.textColor});

  @override
  Widget build(BuildContext context) {

    var textTheme  = Theme.of(context).textTheme;
    return Container(

      decoration: BoxDecoration(
        color: color,
          border: Border.all(color: Colors.black12),
          borderRadius: BorderRadius.circular(24)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
          Image.asset(
            path,
            height: 18,
            width: 18,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            itemName,
            style: textTheme.bodyText1!.copyWith(color: textColor),
          )
        ]),
      ),
    );
  }
}