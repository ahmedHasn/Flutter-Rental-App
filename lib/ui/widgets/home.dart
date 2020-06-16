import 'dart:async';

import 'package:app_navigation/map/view/map_view.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeWidget extends StatelessWidget {

//  // Initial location of the Map view
//  CameraPosition _initialLocation = CameraPosition(target: LatLng(45.521563, -122.677433) , zoom: 12.0);
//
//// For controlling the view of the Map
//  GoogleMapController mapController;

//  Completer<GoogleMapController> _controller = Completer();
//  static const LatLng _center = const LatLng(45.521563, -122.677433);
//
//  void _onMapCreated(GoogleMapController controller) {
//    _controller.complete(controller);
//  }

  @override
  Widget build(BuildContext context) {

    // Determining the screen width & height
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
      height: height,
      width: width,
      child: MapView()
//      child: MapView(),

    );
  }
}
