import 'package:flutter/material.dart';
import 'package:map_ui/screens/connected_screen/connected_screen.dart';
import 'package:map_ui/screens/connected_screen/lets_talk/lets_talk.dart';
import 'package:map_ui/screens/profile_screen/profile_screen.dart';

class Routes {
  Routes._privateConstructor();

  static const String profileScreen = '/profileScreen';
  static const String talkScreen = '/talkScreen';

  static const String connected_screen = '/connected_screen';
  static Map<String, Widget Function(BuildContext)> routes =
      <String, WidgetBuilder>{
    profileScreen: (_) => ProfileScreen(),
    connected_screen: (_) => ConnectedScreen(),
    talkScreen: (_) => LetsTalkScreen(),
  };
}
