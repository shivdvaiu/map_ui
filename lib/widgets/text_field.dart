import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isObsecure;
  final String hintText;
  final TextInputType textInputType;
  final Widget prefixIcon;
  final Widget suffixIcon;

  const CustomTextField({
    Key? key,
    required this.textEditingController,
    this.isObsecure = false, 
    required this.hintText,
    required this.textInputType,
    required this.suffixIcon,
    required this.prefixIcon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderSide: Divider.createBorderSide(context,color:Colors.transparent),
    );

    return Container(
      height: 55,
      decoration: BoxDecoration(
           color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
          borderRadius: BorderRadius.circular(44)),
      child: TextField(
        focusNode: FocusNode(),
        onChanged: (value) {},
        style:
            Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 10.sp),
        controller: textEditingController,
        decoration: InputDecoration(
          
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          hintStyle: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(fontSize: 11.sp,color: Theme.of(context).colorScheme.surface,fontWeight: FontWeight.w500),
          hintText: hintText,
          border: inputBorder,
          focusedBorder: inputBorder,
          enabledBorder: inputBorder,
         
        ),
        keyboardType: textInputType,
        obscureText: isObsecure,
      ),
    );
  }
}
