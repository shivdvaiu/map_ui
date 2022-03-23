import 'package:flutter/material.dart';
import 'package:map_ui/assets.dart';
import 'package:map_ui/constants/constants.dart';
import 'package:map_ui/widgets/draggable_list_view.dart';
import 'package:map_ui/widgets/elevated_button.dart';
import 'package:sizer/sizer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var textTheme = Theme.of(context).textTheme;
    return Stack(
      alignment: Alignment.center,
      fit: StackFit.expand,
      children: [
        Container(
          width: double.infinity,
          child: Image.network(
            Constants.boy,
            fit: BoxFit.cover,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                gradient: LinearGradient(
                    end: const Alignment(0.0, -0),
                    begin: const Alignment(0.0, 0.4),
                    colors: [
                      colorScheme.primary,
                      colorScheme.primary.withOpacity(0.5),
                    ],
                    stops: [
                      0.0,
                      1.0
                    ])),
          ),
        ),
        Material(
            color: Colors.transparent, child: DraggableSearchableListView()),
        Positioned(
          top: 50,
          left: 10,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              child: Center(
                  child: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 20,
              )),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 1),
                  shape: BoxShape.circle),
            ),
          ),
        ),
        Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
            height: 150,
          ),
          Center(
            child: Text(
              "Brandon Aminoff",
              style: textTheme.headline1!
                  .copyWith(color: Colors.white, fontSize: 19.sp),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              "HAMBURG,GERMANY",
              style: textTheme.bodyText2!.copyWith(
                  color: Colors.grey,
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w100),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyElevatedButton(
                  child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.chat_bubble_outline_outlined,
                    color: colorScheme.primary,
                    size: 20,
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                    "Say Hello",
                    style: textTheme.headline1!.copyWith(fontSize: 10.sp),
                  )
                ],
              )),
              SizedBox(
                width: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  child: Center(
                    child: Icon(
                      Icons.group_add_outlined,
                      color: colorScheme.onSurface,
                    ),
                  ),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 1),
                      shape: BoxShape.circle),
                ),
              )
            ],
          )
        ]),
      ],
    );
  }
}
