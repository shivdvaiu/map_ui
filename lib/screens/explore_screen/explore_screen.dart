import 'package:flutter/material.dart';
import 'package:map_ui/assets.dart';
import 'package:map_ui/screens/google_maps/google_maps.dart';
import 'package:map_ui/widgets/chip.dart';
import 'package:map_ui/widgets/text_field.dart';
import 'package:sizer/sizer.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var textTheme = Theme.of(context).textTheme;
    final inputBorder = OutlineInputBorder(
      borderSide: Divider.createBorderSide(context, color: Colors.transparent),
    );

    return Scaffold(
        backgroundColor: colorScheme.onSurface,
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40,
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: colorScheme.primary.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(14)),
                  child: TextField(
                    focusNode: FocusNode(),
                    onChanged: (value) {},
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(fontSize: 10.sp, color: colorScheme.primary),
                    controller: TextEditingController(),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 14),
                      prefixIcon: Icon(
                        Icons.search,
                        color: colorScheme.primary,
                        size: 30,
                      ),
                      hintStyle: textTheme.bodyText1!.copyWith(
                          fontSize: 12.sp,
                          color: colorScheme.surface.withOpacity(0.7)),
                      hintText: "Search",
                      border: inputBorder,
                      focusedBorder: inputBorder,
                      enabledBorder: inputBorder,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text("Interest",
                    style: textTheme.bodyText2!
                        .copyWith(color: Colors.black, fontSize: 12.sp)),
                SizedBox(
                  height: 10,
                ),
                Wrap(
                  runSpacing: 10.0,
                  spacing: 10.0,
                  children: [
                    CustomChip(
                      itemName: "Football",
                      path: AssetsPath.footBall,
                    ),
                    CustomChip(itemName: "Nature", path: AssetsPath.beachImg),
                    CustomChip(itemName: "Fashion", path: AssetsPath.dress),
                    CustomChip(
                      itemName: "Music",
                      path: AssetsPath.music,
                      color: colorScheme.onPrimary,
                      textColor: Colors.white,
                    ),
                    CustomChip(
                        itemName: "Photography", path: AssetsPath.camera),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Text("Around me",
                    style: textTheme.bodyText2!
                        .copyWith(color: Colors.black, fontSize: 12.sp)),
                SizedBox(
                  height: 10,
                ),
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: "People with",
                        style: textTheme.bodyText1!
                            .copyWith(color: Colors.grey, fontSize: 11.sp)),
                    TextSpan(
                        text: "  'Music'   ",
                        style: textTheme.bodyText1!
                            .copyWith(color: colorScheme.onPrimary)),
                    TextSpan(
                        text: "interest around you",
                        style: textTheme.bodyText1!
                            .copyWith(color: Colors.grey, fontSize: 11.sp))
                  ]),
                ),
                SizedBox(
                  height: 25,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(22),
                  child: Container(
                    height: 80.h,
                    child: GoogleMapsView(),
                  ),
                ),
                SizedBox(
                  height: 150,
                ),
              ],
            ),
          ),
        ));
  }
}
