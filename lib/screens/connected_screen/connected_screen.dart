import 'package:flutter/material.dart';
import 'package:map_ui/assets.dart';
import 'package:map_ui/screens/connected_screen/curve_painter/curve_painter_one.dart';
import 'package:map_ui/screens/connected_screen/curve_painter/curve_painter_two.dart';
import 'package:map_ui/services/routes/routes.dart';

import 'package:map_ui/widgets/chip.dart';
import 'package:map_ui/widgets/elevated_button.dart';
import 'package:sizer/sizer.dart';

class ConnectedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: colorScheme.secondaryContainer,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: colorScheme.surface.withOpacity(0.4), width: 2),
                    shape: BoxShape.circle),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: colorScheme.primary,
                      size: 16,
                    ),
                  ),
                ),
              ),
            ),
          )),
      body: Container(
        child:
            Stack(alignment: Alignment.center, fit: StackFit.expand, children: [
          Container(
            child: CustomPaint(
              painter: CurvePainter(),
            ),
          ),
          RotatedBox(
            quarterTurns: 2,
            child: Container(
              child: CustomPaint(
                painter: CurvePainterTwo(),
              ),
            ),
          ),
          _bottomContainer(textTheme, colorScheme, context),
          SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(children: [
                    TextSpan(
                        text: "You are connected with  ",
                        style: textTheme.headline1!.copyWith(fontSize: 17.sp)),
                    TextSpan(
                        text: "Clara  \n",
                        style: textTheme.headline1!.copyWith(
                            fontSize: 18.sp, color: colorScheme.onPrimary)),
                    TextSpan(
                        text: "   from Hamburg!",
                        style: textTheme.headline1!.copyWith(fontSize: 17.sp)),
                  ]),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Expanded(
                      child: _userAvatarWithName(
                        colorScheme.onSurface,
                        textTheme,
                        context,
                        AssetsPath.girl,
                        "Clara",
                        colorScheme.onPrimary,
                        colorScheme.onSurface,
                      ),
                    ),
                    Expanded(
                      child: _userAvatarWithName(
                        colorScheme.primary,
                        textTheme,
                        context,
                        AssetsPath.userOne,
                        "You",
                        colorScheme.onSurface,
                        colorScheme.secondaryContainer,
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                  ],
                )
              ],
            ),
          )
        ]),
        color: colorScheme.secondaryContainer,
      ),
    );
  }

  Container _userAvatarWithName(
      Color textColor,
      TextTheme textTheme,
      BuildContext context,
      String assetPath,
      userName,
      Color color,
      bubbleColor) {
    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            child: Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                  border: Border.all(color: color, width: 6),
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage(assetPath), fit: BoxFit.fill)),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: 44,
              width: 100,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            userName,
                            style:
                                textTheme.bodyText1!.copyWith(color: textColor),
                          ),
                          Image.asset(
                            AssetsPath.handWave,
                            height: 15,
                          )
                        ]),
                    height: 34,
                    width: 100,
                    decoration: BoxDecoration(
                        color: color, borderRadius: BorderRadius.circular(8)),
                  ),
                  Positioned(
                    top: 0,
                    child: Container(
                      child: Stack(alignment: Alignment.center, children: [
                        Container(
                            height: 8,
                            width: 8,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: bubbleColor,
                            ))
                      ]),
                      height: 15,
                      width: 15,
                      decoration:
                          BoxDecoration(shape: BoxShape.circle, color: color),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      height: 152,
      width: 152,
    );
  }

  Positioned _bottomContainer(
      TextTheme textTheme, ColorScheme colorScheme, BuildContext context) {
    return Positioned(
      bottom: 10,
      right: 10,
      left: 10,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "Interest",
                style: textTheme.bodyText1!.copyWith(fontSize: 14.sp),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  CustomChip(
                    itemName: "Football",
                    path: AssetsPath.footBall,
                  ),
                  CustomChip(itemName: "Nature", path: AssetsPath.beachImg),
                  CustomChip(itemName: "Fashion", path: AssetsPath.dress),
                ],
              ),
              SizedBox(height: 20),
              Text(
                  "You have 3 things in common with Clara Let's start by talking about things you both like!",
                  style: textTheme.bodyText1!.copyWith(
                      fontSize: 11.sp,
                      color: colorScheme.primary.withOpacity(0.5))),
              SizedBox(height: 50),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: colorScheme.onPrimary),
                    height: 60,
                    width: 60,
                    child: Stack(alignment: Alignment.center, children: [
                      Image.asset(
                        AssetsPath.speechBubble,
                        height: 25,
                      )
                    ]),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: 40, vertical: 15),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(35))),
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.talkScreen);
                        },
                        child: Row(mainAxisSize: MainAxisSize.min, children: [
                          Icon(
                            Icons.mic_outlined,
                            color: colorScheme.onSurface,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Lets Talk",
                            style: textTheme.headline1!.copyWith(
                                fontSize: 11.sp, color: colorScheme.onSurface),
                          )
                        ])),
                  )
                ],
              )
            ]),
          ),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: colorScheme.onSurface),
        height: 35.h,
      ),
    );
  }
}
