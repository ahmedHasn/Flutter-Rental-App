import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapService {

  Set<Marker> markers;


  Future<Set<Marker>> _createMarker() async {
    try{

      markers.add( Marker
        (
        markerId: MarkerId('home'),
        icon: BitmapDescriptor.defaultMarker,
        infoWindow: InfoWindow(title: 'Home')
      )
      );

    }catch(e){

    }
    return markers;
  }

//  Position position;
//  _getCurrentLocation() async {
//     position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//  }
//
//  Future<GoogleMap> getMap() async{
//    // For controlling the view of the Map
//    GoogleMapController _controller;
//
//    return GoogleMap(
//              scrollGesturesEnabled: true,
//              tiltGesturesEnabled: true,
//              trafficEnabled: false,
//              indoorViewEnabled: true,
//              compassEnabled: true,
//              rotateGesturesEnabled: true,
//              myLocationEnabled: true,
//              zoomGesturesEnabled: true,
//              mapType: MapType.normal,
//              initialCameraPosition: CameraPosition(
//                target: LatLng(22.5726, 88.3639),
//                zoom: 12.0
//              ),
//              onMapCreated: (GoogleMapController controller) {
//                _controller = controller;
//              },
//          );
//      }

}