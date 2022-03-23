import 'package:flutter/material.dart';
import 'package:map_ui/assets.dart';
import 'package:map_ui/constants/constants.dart';
import 'package:map_ui/widgets/glassmorphism.dart';
import 'package:map_ui/widgets/network_image_avatar.dart';
import 'package:map_ui/widgets/post_card.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatelessWidget {
 final List<PostCard> cards = [
    PostCard(
        quote: "If you could live anywhere in the world,where would you pick?",
        type: "Travel",
        icon: AssetsPath.vacations, imageUrl: Constants.mountainBg,),
    PostCard(
        quote:
            "Which country do you guys think is most likely to win euro 2020",
        type: "Football",
        icon: AssetsPath.footBall, imageUrl: Constants.football,),
   PostCard(
        quote: "If you could live anywhere in the world,where would you pick?",
        type: "Travel",
        icon: AssetsPath.vacations, imageUrl: Constants.travel,),
   PostCard(
        quote: "If you could live anywhere in the world,where would you pick?",
        type: "Travel",
        icon: AssetsPath.vacations, imageUrl: Constants.mountainBg,),
  ];
  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: colorScheme.onBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            SizedBox(
              height: 20,
            ),
            _topBar(textTheme, colorScheme),
            SizedBox(
              height: 20,
            ),
            _cardOne(colorScheme, textTheme),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 4,
                  itemBuilder: (context, i) {
                    return Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: cards[i]);
                  }),
            )
          ]),
        ),
      ),
    );
  }

  Container _cardOne(ColorScheme colorScheme, TextTheme textTheme) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min, //
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 15,
                ),
                Container(
                  child: Center(
                    child: Icon(
                      Icons.podcasts_outlined,
                      color: colorScheme.onSurface,
                    ),
                  ),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: colorScheme.primary),
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                    child: Text(
                  "A new ways to make friends through voice chat",
                  style: textTheme.bodyText1!.copyWith(fontSize: 10.sp),
                )),
                Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: colorScheme.secondaryContainer.withOpacity(0.8)),
                  child: Icon(
                    Icons.clear_outlined,
                    color: colorScheme.onSurface,
                    size: 15,
                  ),
                  height: 20,
                  width: 20,
                ),
                SizedBox(
                  width: 8,
                ),
              ]),
          SizedBox(
            height: 19,
          ),
        ],
      ),
      decoration: BoxDecoration(
          color: colorScheme.secondaryContainer.withOpacity(0.8),
          borderRadius: BorderRadius.circular(12)),
      width: double.infinity,
    );
  }

  Row _topBar(TextTheme textTheme, ColorScheme colorScheme) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Welcome back,",
                style: textTheme.headline1!.copyWith(fontSize: 17.sp)),
            Text("Nadia",
                style: textTheme.headline1!
                    .copyWith(fontSize: 16.sp, color: colorScheme.onPrimary))
          ],
        ),
        Spacer(),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: colorScheme.surface.withOpacity(0.4)),
              shape: BoxShape.circle),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                Icon(
                  Icons.notifications_outlined,
                  color: colorScheme.primary,
                  size: 3.5.h,
                ),
                Positioned(
                  right: 5,
                  top: 1,
                  child: Container(
                    height: 1.5.h,
                    width: 1.5.w,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: colorScheme.secondaryContainer),
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          width: 16,
        ),
        NetworkImageAvatar(url: Constants.user)
      ],
    );
  }
}
