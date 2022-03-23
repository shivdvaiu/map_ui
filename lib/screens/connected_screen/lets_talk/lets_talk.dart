import 'package:flutter/material.dart';
import 'package:map_ui/assets.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:sizer/sizer.dart';

class LetsTalkScreen extends StatelessWidget {
  const LetsTalkScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        padding: EdgeInsets.only(bottom: 15),
        child: FloatingActionButton(
          backgroundColor: colorScheme.onPrimary,
          onPressed: () {
            showMaterialModalBottomSheet(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15))),
              context: context,
              builder: (context) => Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.graphic_eq_outlined,
                            color: colorScheme.onPrimary,
                            size: 40,
                          ),
                          Icon(
                            Icons.graphic_eq_outlined,
                            color: colorScheme.onPrimary,
                            size: 40,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 18,),
                    Padding(
                      padding:EdgeInsets.symmetric(horizontal: 40),
                      child: Center(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.grey.withOpacity(0.6),
                                      width: 1),
                                  borderRadius: BorderRadius.circular(27)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                    
                                    children: [
                                           SizedBox(width: 3,),
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: (){

                                            Navigator.pop(context);
                                          },
                                          child: Container(
                                            color: Colors.transparent,
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.clear,
                                                  color: colorScheme.primary
                                                      .withOpacity(0.8),
                                                ),
                                                SizedBox(width: 10,),
                                                Text(
                                                  "Cancel",
                                                  style: textTheme.bodyText1!
                                                      .copyWith(
                                                          color: colorScheme.primary
                                                              .withOpacity(0.8)),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 100,),
                                      Expanded(
                                        child: Row(
                                          children: [
                                            
                                            Text(
                                              "Send",
                                              style: textTheme.bodyText1!
                                                  .copyWith(
                                                      color: colorScheme.primary
                                                          .withOpacity(0.8)),
                                            ),
                                              SizedBox(width: 10,),
                                            Icon(Icons.send,
                                                color: colorScheme.primary
                                                    .withOpacity(0.8)),
                                                         SizedBox(width: 10,),
                                          ],
                                        ),
                                      ),
                                       
                                    ]),
                              ),
                            ),
                            FloatingActionButton(
                              backgroundColor: colorScheme.onPrimary,
                              onPressed: () {},
                              child: Icon(
                                Icons.mic_none_outlined,
                                color: colorScheme.onSurface,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                      SizedBox(height: 38,),
                  ],
                ),
              
              ),
            );
          },
          child: Icon(
            Icons.mic_none_outlined,
            color: colorScheme.onSurface,
          ),
        ),
      ),
      bottomNavigationBar: Container(
          child: Container(
        height: 70,
        margin: EdgeInsets.only(bottom: 25, left: 10, right: 10),
        child: CustomPaint(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.attach_file_outlined,
                      color: colorScheme.surface,
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.keyboard_outlined,
                        color: colorScheme.surface,
                      )),
                ]),
          ),
          size: Size(MediaQuery.of(context).size.width, 80),
          painter: RPSCustomPainter(),
        ),
      )),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(children: [
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text("8:24 PM",
                  style: textTheme.bodyText1!.copyWith(
                    color: Colors.grey,
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            _voiceMessageCard(colorScheme, textTheme,
                EdgeInsets.only(left: 20, right: 80), "0:10"),
            SizedBox(
              height: 25,
            ),
            _voiceMessageCard(colorScheme, textTheme,
                EdgeInsets.only(left: 80, right: 20), "0:37"),
            SizedBox(
              height: 25,
            ),
            _voiceMessageCard(colorScheme, textTheme,
                EdgeInsets.only(left: 20, right: 100), "0:06",
                image: AssetsPath.girl),
            SizedBox(
              height: 25,
            ),
            _lightTitle(textTheme, "9:00 PM"),
            SizedBox(
              height: 25,
            ),
            _voiceMessageCard(colorScheme, textTheme,
                EdgeInsets.only(left: 80, right: 20), "0:37"),
            SizedBox(
              height: 25,
            ),
            _voiceMessageCardPlay(colorScheme, textTheme,
                EdgeInsets.only(left: 20, right: 80), "1:24"),
            SizedBox(height: 25),
            _voiceMessageCard(colorScheme, textTheme,
                EdgeInsets.only(left: 80, right: 20), "0:37"),
            SizedBox(
              height: 25,
            ),
            _voiceMessageCard(colorScheme, textTheme,
                EdgeInsets.only(left: 20, right: 100), "0:06",
                image: AssetsPath.girl),
            SizedBox(
              height: 25,
            ),
            _lightTitle(textTheme, "9:00 PM"),
            SizedBox(
              height: 25,
            ),
            _voiceMessageCard(colorScheme, textTheme,
                EdgeInsets.only(left: 80, right: 20), "0:37"),
            SizedBox(
              height: 25,
            ),
          ]),
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Clara Hazel",
          style: textTheme.headline1!
              .copyWith(color: colorScheme.onSurface, fontSize: 14.sp),
        ),
        elevation: 0,
        backgroundColor: colorScheme.primary,
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
                    color: colorScheme.onSurface,
                    size: 16,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      backgroundColor: colorScheme.primary,
    );
  }

  Container _voiceMessageCard(
      ColorScheme colorScheme, TextTheme textTheme, margin, String text,
      {image = AssetsPath.userTwo}) {
    return Container(
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        SizedBox(
          width: 20,
        ),
        Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image:
                  DecorationImage(image: AssetImage(image), fit: BoxFit.fill),
            )),
        Icon(
          Icons.play_arrow,
          color: colorScheme.onSurface,
          size: 30,
        ),

        Expanded(
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              Container(
                height: 5,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(12)),
              ),
              Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                      color: colorScheme.onPrimary, shape: BoxShape.circle)),
            ],
          ),
        ),
        SizedBox(
          width: 20,
        ),
        // Slider(
        //   inactiveColor: Colors.grey.withOpacity(0.3),
        //   thumbColor: colorScheme.onPrimary,
        //   min: 0.0,
        //   max: 100.0,
        //   value: 10,
        //   onChanged: (value) {},
        // ),
        _lightTitle(textTheme, text),
        SizedBox(
          width: 20,
        )
      ]),
      height: 70,
      margin: margin,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(35)),
    );
  }

  Container _voiceMessageCardPlay(
      ColorScheme colorScheme, TextTheme textTheme, margin, String text,
      {image = AssetsPath.userTwo}) {
    return Container(
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        SizedBox(
          width: 20,
        ),
        Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image:
                  DecorationImage(image: AssetImage(image), fit: BoxFit.fill),
            )),
        Icon(
          Icons.pause_outlined,
          color: colorScheme.onSurface,
          size: 30,
        ),

        Expanded(
          child: Row(children: [
            Icon(
              Icons.graphic_eq_outlined,
              color: colorScheme.onPrimary,
              size: 40,
            ),
            Icon(
              Icons.graphic_eq_outlined,
              color: colorScheme.onSurface,
              size: 40,
            ),
            Icon(
              Icons.graphic_eq_outlined,
              color: colorScheme.onSurface,
              size: 40,
            ),
            Expanded(
              child: Icon(
                Icons.graphic_eq_outlined,
                color: colorScheme.onSurface,
                size: 40,
              ),
            ),
          ]),
        ),
        SizedBox(
          width: 20,
        ),
        // Slider(
        //   inactiveColor: Colors.grey.withOpacity(0.3),
        //   thumbColor: colorScheme.onPrimary,
        //   min: 0.0,
        //   max: 100.0,
        //   value: 10,
        //   onChanged: (value) {},
        // ),
        _lightTitle(textTheme, text),
        SizedBox(
          width: 20,
        )
      ]),
      height: 70,
      margin: margin,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(35)),
    );
  }

  Text _lightTitle(TextTheme textTheme, String text) {
    return Text(text,
        style: textTheme.bodyText1!.copyWith(
          color: Colors.grey,
        ));
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(0, size.height * 0.4938272);
    path_0.cubicTo(0, size.height * 0.2210938, size.width * 0.04775627, 0,
        size.width * 0.1066667, 0);
    path_0.lineTo(size.width * 0.2500000, 0);
    path_0.cubicTo(size.width * 0.2500000, 0, size.width * 0.2500000, 0,
        size.width * 0.2500000, 0);
    path_0.cubicTo(size.width * 0.2500000, 0, size.width * 0.2885893, 0,
        size.width * 0.3486853, 0);
    path_0.cubicTo(
        size.width * 0.4087787,
        0,
        size.width * 0.4060160,
        size.height * 0.4015630,
        size.width * 0.4981200,
        size.height * 0.4015630);
    path_0.cubicTo(size.width * 0.5902267, size.height * 0.4015630,
        size.width * 0.5949813, 0, size.width * 0.6550747, 0);
    path_0.cubicTo(size.width * 0.7151680, 0, size.width * 0.7500000, 0,
        size.width * 0.7500000, 0);
    path_0.cubicTo(size.width * 0.7500000, 0, size.width * 0.7500000, 0,
        size.width * 0.7500000, 0);
    path_0.lineTo(size.width * 0.8933333, 0);
    path_0.cubicTo(size.width * 0.9522427, 0, size.width,
        size.height * 0.2210938, size.width, size.height * 0.4938272);
    path_0.lineTo(size.width, size.height * 0.5061728);
    path_0.cubicTo(size.width, size.height * 0.7789062, size.width * 0.9522427,
        size.height, size.width * 0.8933333, size.height);
    path_0.lineTo(size.width * 0.1066667, size.height);
    path_0.cubicTo(size.width * 0.04775627, size.height, 0,
        size.height * 0.7789062, 0, size.height * 0.5061728);
    path_0.lineTo(0, size.height * 0.4938272);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Colors.white;
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
