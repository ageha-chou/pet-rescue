import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pet_rescue/modules/report/report_pet_controller.dart';
import 'package:pet_rescue/shared/constants/color.dart';
import 'package:pet_rescue/shared/shared.dart';

class MyGoogleMap extends StatefulWidget {
  @override
  _MyGoogleMapState createState() => _MyGoogleMapState();
}

class _MyGoogleMapState extends State<MyGoogleMap> {
  late Position _currentPosition;
  // late String _currentAddress;
  late GoogleMapController mapController;

  late GoogleMapController _controller;
  LatLng _initialCameraPosition = LatLng(10.762622, 106.660172);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppLogo(),
        title: Text(
          'Location of abandoned pet',
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
        actions: [
          IconButton(
            onPressed: () => Get.back(),
            icon: Icon(Icons.clear),
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: GoogleMap(
          initialCameraPosition:
              CameraPosition(target: _initialCameraPosition, zoom: 15),
          mapType: MapType.normal,
          onMapCreated: _onMapCreated,
          myLocationEnabled: true,
          zoomControlsEnabled: false,
        ),
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).primaryColor),
          borderRadius: BorderRadius.all(
            Radius.circular(70),
          ),
        ),
        height: 70,
        width: 70,
        child: FittedBox(
          child: FloatingActionButton(
            child: Text(
              'Choose',
              style: TextStyle(
                color: ColorConstants.black,
                fontSize: 13,
              ),
            ),
            backgroundColor: Theme.of(context).primaryColor,
            onPressed: () async {
              String address = "";
              await _getCurrentPosition().then((value) => address = value);
              final ReportPetController controller = Get.find();
              controller.locationController.text = address;
              Get.back();
            },
          ),
        ),
      ),
    );
  }

  Future<String> _getCurrentPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    _currentPosition = await Geolocator.getCurrentPosition();

    List<Placemark> placemarks = await placemarkFromCoordinates(
        _currentPosition.latitude, _currentPosition.longitude);
    Placemark place = placemarks[0];

    return '${place.street}, ${place.locality}, ${place.postalCode}, ${place.country}';
  }

  void _onMapCreated(GoogleMapController _cntlr) {
    _controller = _cntlr;
    // _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
    //     target: LatLng(_currentPosition.latitude, _currentPosition.latitude))));
  }
}
