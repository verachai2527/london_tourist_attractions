import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_flutter_web/google_maps_flutter_web.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  // double screenHeight = 0, screenWidth = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    findLatLong();
  }

  Future<Null> findLatLong() async {
    bool locationService;
    LocationPermission locationPermission;
    locationService = await Geolocator.isLocationServiceEnabled();
    if (locationService) {
      print('service location open');
    } else {
      print('service location close');
    }
  }

  @override
  Widget build(BuildContext context) {
    // screenHeight = MediaQuery.of(context).size.height;
    // screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              color: Color.fromARGB(255, 249, 223, 162),
              child: Text('LONDON MAP', style: TextStyle(fontSize: 50)),
            ),
            buildMap(),
          ],
        ),
      ),
    );
  }

  Container buildMap() => Container(
        height: 1000,
        child: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(51.509865, -0.118092),
            zoom: 16,
          ),
          mapType: MapType.normal,
          onMapCreated: (controller) => {},
        ),
      );
}
