import 'package:app_navigation/map/viewmodels/map_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stacked/stacked.dart';

class MapView extends StatelessWidget {
  // Initial location of the Map view
  CameraPosition _initialLocation =
      CameraPosition(target: LatLng(45.521563, -122.677433), zoom: 12.0);
  // For controlling the view of the Map
  GoogleMapController mapController;

  Position position;

  void getCurrentLocation() async {
    position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }

  @override
  Widget build(BuildContext context) {
    // Determining the screen width & height
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return ViewModelBuilder<MapViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
            appBar: AppBar(
                title: Center(
                    child: Text('DaLLiSo App',
                        style: TextStyle(color: Colors.indigoAccent))),
                backgroundColor: Colors.white),
            body: Container(
                height: height,
                width: width,
                child: model.isBusy
                    ? Center(child: CircularProgressIndicator())
                    : GoogleMap(
                        mapType: MapType.normal,
                        initialCameraPosition: CameraPosition(
                            target: LatLng(
                                model.data.latitude, model.data.longitude),
                            zoom: 12.0),
                        markers: [
                          Marker(
                              markerId: MarkerId('home'),
                              position: LatLng(
                                  model.data.latitude, model.data.longitude),
                              icon: BitmapDescriptor.defaultMarker,
                              infoWindow: InfoWindow(title: 'Home')),
                        ].toSet(),
                        onMapCreated: (GoogleMapController controller) {
                          mapController = controller;
                        },
                      ))),
        viewModelBuilder: () => MapViewModel());
  }
}
