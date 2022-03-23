import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:map_ui/screens/home_screen/home_screen.dart';
import 'package:map_ui/screens/profile_screen/profile_screen.dart';
import 'package:map_ui/services/app_themes/app_theme.dart';
import 'package:sizer/sizer.dart';

import 'screens/explore_screen/explore_screen.dart';
import 'services/routes/routes.dart';

void main() {
  runApp(Sizer(
    builder: (context, orientation, deviceType) {
      return MaterialApp(
        routes: Routes.routes,
        theme: primaryMaterialTheme,
        debugShowCheckedModeBanner: false,
        title: 'Sizer',
        home: MapUI(),
      );
    },
  ));
}

class MapUI extends StatefulWidget {
  const MapUI({Key? key}) : super(key: key);

  @override
  State<MapUI> createState() => _MapUIState();
}

class _MapUIState extends State<MapUI> {
  List<Widget> screens = [
    HomeScreen(),
    ExploreScreen(),
    Container(),
    Container(),
    ProfileScreen(),
  ];

  List<IconData> icons = [
    Icons.home_outlined,
    Icons.explore_outlined,
    Icons.add_outlined,
    Icons.chat_bubble_outline_outlined,
    Icons.person_outlined,
  ];

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Stack(
      fit: StackFit.expand,
      children: [
        screens[currentIndex],
        Positioned(
          bottom: 5,
          left: 5,
          right: 5,
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ...List.generate(
                        icons.length,
                        (i) => GestureDetector(
                            onTap: () {
                              log(i.toString());
                              if (i == 4) {
                                Navigator.pushNamed(
                                    context, Routes.profileScreen);
                                return;
                              }
                              currentIndex = i;

                              setState(() {});
                            },
                            child: _buildNavItem(colorScheme, icons[i], i)))
                  ]),
            ),
            margin: EdgeInsets.all(15),
            decoration: BoxDecoration(
                boxShadow: [],
                borderRadius: BorderRadius.circular(55),
                color: Theme.of(context).colorScheme.onSurface),
            height: 9.h,
          ),
        )
      ],
    );
  }

  Container _buildNavItem(ColorScheme colorScheme, IconData icon, int i) {
    return Container(
      child: Icon(icon,
          color: i == currentIndex
              ? colorScheme.onSurface
              : colorScheme.primary.withOpacity(0.5)),
      height: 40,
      width: 40,
      decoration: BoxDecoration(
          color: i == currentIndex ? colorScheme.onPrimary : Colors.transparent,
          shape: BoxShape.circle),
    );
  }
} 
