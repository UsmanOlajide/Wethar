import 'package:geolocator/geolocator.dart';

//* this class handles getting the current location of the user
//* this class holds the get current location logic and my lat & long
class CurrentLocation {
  late double latitude;
  late double longitude;

  Future<void> getCurrentLocation() async {
    try {
      final locationService = await Geolocator.isLocationServiceEnabled();

      if (!locationService) {
        return Future.error('Device Location not enabled');
      }

      var permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return Future.error('Location permissions are denied');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
      }

      final currentPositon = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);

      latitude = currentPositon.latitude;
      longitude = currentPositon.longitude;
      
    } catch (e) {
      print(e);
    }
  }
}
