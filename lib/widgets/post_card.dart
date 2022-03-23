import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:map_ui/assets.dart';
import 'package:map_ui/constants/constants.dart';
import 'package:map_ui/widgets/glassmorphism.dart';
import 'package:map_ui/widgets/network_image_avatar.dart';
import 'package:sizer/sizer.dart';

class PostCard extends StatelessWidget {
 final  String quote, type, icon,imageUrl;

  PostCard({required this.quote, required this.type, required this.icon,required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var textTheme = Theme.of(context).textTheme;
    return Container(
      height: 50.h,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(19),
              child: Image.network(
                imageUrl,
                fit: BoxFit.fill,
                colorBlendMode: BlendMode.overlay,
              )),
          ClipRRect(
            borderRadius: BorderRadius.circular(19),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  gradient: LinearGradient(
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomRight,
                      colors: [
                        Colors.black.withOpacity(0.5),
                        colorScheme.primary.withOpacity(0.5),
                      ],
                      stops: [
                        0.0,
                        1.0
                      ])),
            ),
          ),
          Positioned(
              left: 10,
              bottom: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 70.w,
                    child: Text(
                      quote,
                      style: textTheme.bodyText1!
                          .copyWith(color: Colors.white, fontSize: 15.sp),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      NetworkImageAvatar(url: Constants.user),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Miranda Kehlani",
                            style: textTheme.bodyText1!
                                .copyWith(color: Colors.white, fontSize: 10.sp),
                          ),
                          Text(
                            "New Jersy,US",
                            style: textTheme.bodyText1!.copyWith(
                                color: Colors.white.withOpacity(0.4),
                                fontSize: 10.sp),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              )),
          Positioned(
            top: 15,
            left: 15,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(22),
              child: GlassMorphism(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(children: [
                      Image.asset(
                        icon,
                        height: 20,
                        width: 20,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        type,
                        style: textTheme.bodyText2,
                      )
                    ]),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(26),
                    bottomLeft: Radius.circular(26),
                  ),
                  child: GlassMorphism(
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              ClipOval(
                                child: GlassMorphism(
                                  child: Container(
                                    child: Icon(Icons.thumb_up_alt_outlined,
                                        color: colorScheme.onSurface),
                                    height: 50,
                                    width: 50,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 14,
                              ),
                              Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: GlassMorphism(
                                      child: Container(
                                        height: 30,
                                        width: 2,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  ClipOval(
                                    child: GlassMorphism(
                                      child: Container(
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Image.asset(
                                              AssetsPath.speechBubbleTwo,
                                              height: 25,
                                            ),
                                          ],
                                        ),
                                        height: 50,
                                        width: 50,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 14,
                              ),
                              ClipOval(
                                child: GlassMorphism(
                                  child: Container(
                                    child: Icon(
                                      Icons.more_horiz_outlined,
                                      color: colorScheme.onSurface,
                                    ),
                                    height: 50,
                                    width: 50,
                                  ),
                                ),
                              ),
                            ]),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
