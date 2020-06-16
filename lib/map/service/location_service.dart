
import 'package:app_navigation/map/datamodel/user_location.dart';
import 'package:geolocator/geolocator.dart';

class LocationService {

  UserLocation _currentLLocation;
//  Position position;

  Future<UserLocation> getLocation() async {
    try {
      var userLocation = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      _currentLLocation = UserLocation(
        latitude: userLocation.latitude,
        longitude: userLocation.longitude
      );
      print('Current location is: -----------> ${userLocation.latitude}  ${userLocation.longitude}');
    }on Exception catch(e){
      print('Could not get location: ${e.toString()}');
    }
    return _currentLLocation;
  }
}