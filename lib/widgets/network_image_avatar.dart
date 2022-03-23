import 'package:flutter/material.dart';

class NetworkImageAvatar extends StatelessWidget {
  final String url;
   NetworkImageAvatar({required this.url });

  @override
  Widget build(BuildContext context) {
    return Container(
          height: 47,
          width: 47,
          child: CircleAvatar(
            radius: 30.0,
            backgroundImage: NetworkImage(url),
            backgroundColor: Colors.transparent,
          ));
        
  }
}