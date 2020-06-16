import 'package:app_navigation/app/locator.dart';
import 'package:app_navigation/map/datamodel/user_location.dart';
import 'package:app_navigation/map/service/location_service.dart';
import 'package:app_navigation/map/service/map_service.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stacked/stacked.dart';

class MapViewModel extends FutureViewModel<UserLocation> {

  var _mapService = locator<MapService>();
  final _locationService = locator<LocationService>();


//  Future<GoogleMap> getMap() async {
//    GoogleMap result = await _mapService.getMap();
//    return result;
//  }

  Future<UserLocation> getLocation() async {
    return await _locationService.getLocation();
  }

  Future<Set<Marker>> getMarkers() async{
    return _mapService.markers;
  }

  @override
  Future<UserLocation> futureToRun() =>  getLocation();

  @override
  void onError(error) {}
}