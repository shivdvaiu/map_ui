import 'dart:developer';

import 'package:flutter/material.dart';

import 'dart:async';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_ui/assets.dart';
import 'package:map_ui/constants/constants.dart';
import 'package:map_ui/services/routes/routes.dart';
import 'package:sizer/sizer.dart';

class GoogleMapsView extends StatefulWidget {
  GoogleMapsView();
  @override
  _GoogleMapsViewState createState() => _GoogleMapsViewState();
}

class _GoogleMapsViewState extends State<GoogleMapsView> {
  Completer<GoogleMapController> _controller = Completer();
  CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();

  List<LatLng> latLongs = [
    LatLng(27.804696, 78.6262358),
    LatLng(27.9514684, 78.4636473),
  ];

  Set markers = {};
  BitmapDescriptor? iconOne;
  BitmapDescriptor? iconTwo;
  List<BitmapDescriptor> bitMapIcons = [];

  @override
  void initState() {
    super.initState();
    getIcon();
    // setState(() {
    //   markers = Iterable.generate(latLongs.length, (index) async {
    //     return Marker(
    //         onTap: () {
    //           _customInfoWindowController.addInfoWindow!(
    //               ClipPath(
    //                   clipper: _InfoWidgetClipper(),
    //                   child: Container(
    //                     child: Row(
    //                       children: [
    //                         SizedBox(
    //                           width: 10,
    //                         ),
    //                       ],
    //                     ),
    //                     color: Colors.white,
    //                   )),
    //               LatLng(latLongs[index].latitude, latLongs[index].longitude));
    //         },
    //         icon: icon!,
    //         markerId: MarkerId('${index.toString()}'),
    //         position:
    //             LatLng(latLongs[index].latitude, latLongs[index].longitude));
    //   });
    // });
  }

  getIcon() async {
    iconOne = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(10, 10)), 'assets/images/boy.png');

    iconTwo = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(10, 10)), 'assets/images/girl.png');
  }

  @override
  void dispose() {
    _customInfoWindowController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return Stack(
      children: [
        GoogleMap(
          // cameraTargetBounds: CameraTargetBounds(LatLngBounds(
          //     northeast: LatLng(43.15719344, -55.24372861),
          //     southwest: LatLng(40.15719344, -74.24372861))),
          onCameraMove: (position) {
            _customInfoWindowController.onCameraMove!();
          },
          onTap: (lat) {
            _customInfoWindowController.hideInfoWindow!();
          },
          mapType: MapType.normal,
          initialCameraPosition:
              CameraPosition(target: LatLng(27.804696, 78.6262358), zoom: 10),
          onMapCreated: (GoogleMapController controller) {
            _customInfoWindowController.googleMapController = controller;

            _controller.complete(controller);

            markers.add(Marker(
                onTap: () {

                 
                  _customInfoWindowController.addInfoWindow!(
                      _infoWindow(context, colorScheme),
                      LatLng(latLongs[0].latitude, latLongs[0].longitude));

                       Future.delayed(Duration(seconds: 1),(){

                    Navigator.pushNamed(context, Routes.connected_screen);
                  });
                },
                markerId: MarkerId('${4}'),
                position: LatLng(latLongs[0].latitude, latLongs[0].longitude)));
            markers.add(Marker(
                onTap: () {
                  _customInfoWindowController.addInfoWindow!(
                      _infoWindow(context, colorScheme),
                      LatLng(latLongs[1].latitude, latLongs[1].longitude));
                      Future.delayed(Duration(seconds: 1),(){

                    Navigator.pushNamed(context, Routes.connected_screen);
                  });
                },
                markerId: MarkerId('${6}'),
                position: LatLng(latLongs[1].latitude, latLongs[1].longitude)));
            setState(() {});
          },
          markers: Set.from(markers),
        ),
        CustomInfoWindow(
          controller: _customInfoWindowController,
          height: 46,
          width: 230,
          offset: 50,
        ),
      ],
    );
  }

  Stack _infoWindow(BuildContext context, ColorScheme colorScheme) {
    return Stack(
      fit: StackFit.expand,
      alignment: Alignment.center,
      children: [
        Container(
            margin: EdgeInsets.only(bottom: 5),
            child: Container(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(Icons.sensors_outlined, color: Colors.white),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                    "Connect with",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: Colors.white),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                    "Clara",
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(color: Colors.white, fontSize: 10.sp),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Image.asset(AssetsPath.handWave, height: 20)
                ],
              ),
              decoration: BoxDecoration(
                  color: colorScheme.primary,
                  borderRadius: BorderRadius.circular(25)),
            )),
        Positioned(
          bottom: 0,
          child: Container(
            child: Stack(alignment: Alignment.center, children: [
              Container(
                  height: 8,
                  width: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ))
            ]),
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        )
      ],
    );
  }
}
