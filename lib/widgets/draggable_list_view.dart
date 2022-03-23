import 'package:flutter/material.dart';
import 'package:map_ui/assets.dart';
import 'package:map_ui/widgets/chip.dart';
import 'package:sizer/sizer.dart';

class DraggableSearchableListView extends StatefulWidget {
  @override
  _DraggableSearchableListViewState createState() =>
      _DraggableSearchableListViewState();
}

class _DraggableSearchableListViewState
    extends State<DraggableSearchableListView> {
  final TextEditingController searchTextController = TextEditingController();
  final ValueNotifier<bool> searchTextCloseButtonVisibility =
      ValueNotifier<bool>(false);
  final ValueNotifier<bool> searchFieldVisibility = ValueNotifier<bool>(false);
  @override
  void dispose() {
    searchTextController.dispose();
    searchTextCloseButtonVisibility.dispose();
    searchFieldVisibility.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var colorScheme = Theme.of(context).colorScheme;

    return NotificationListener<DraggableScrollableNotification>(
      onNotification: (notification) {
        if (notification.extent == 1.0) {
          searchFieldVisibility.value = true;
        } else {
          searchFieldVisibility.value = false;
        }
        return true;
      },
      child: DraggableScrollableActuator(
        child: Stack(
          children: <Widget>[
            DraggableScrollableSheet(
              initialChildSize: 0.30,
              minChildSize: 0.30,
              maxChildSize: 1.0,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.0),
                      topRight: Radius.circular(16.0),
                    ),
                    // boxShadow: [
                    //   BoxShadow(
                    //       color: Colors.grey,
                    //       offset: Offset(1.0, -2.0),
                    //       blurRadius: 4.0,
                    //       spreadRadius: 2.0)
                    // ],
                  ),
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: SingleChildScrollView(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Container(
                                  height: 3,
                                  width: 60,
                                  color: colorScheme.surface.withOpacity(0.3),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "About",
                                style: textTheme.bodyText1!.copyWith(
                                    color:
                                        colorScheme.surface.withOpacity(0.7)),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                  "I am a boy with great sense of humor and easy to go out with.",
                                  style: textTheme.bodyText1!.copyWith(
                                      fontSize: 11.sp,
                                      color: Colors.black.withOpacity(0.8))),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Interest",
                                style: textTheme.bodyText1!.copyWith(
                                    color:
                                        colorScheme.surface.withOpacity(0.7)),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomChip(
                                      itemName: "Football",
                                      path: AssetsPath.footBall,
                                    ),
                                    CustomChip(
                                      itemName: "Travel",
                                      path: AssetsPath.beachImg,
                                    ),
                                    CustomChip(
                                      itemName: "Music",
                                      path: AssetsPath.music,
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
