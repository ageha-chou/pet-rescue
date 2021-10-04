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
  Position? _currentPosition;
  // late String _currentAddress;

  GoogleMapController? mapController;
  Completer<GoogleMapController> _controller = new Completer();
  LatLng _initialCameraPosition = LatLng(10.762622, 106.660172);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getCurrentPosition();
    _getCurrentLocation();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
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
              try {
                String address = "";
                await _getCurrentAddress().then((value) => address = value);
                final ReportPetController controller = Get.find();
                controller.locationController.text = address;
                Get.back();
              } catch (error) {
                Get.defaultDialog(
                    title: "Error!",
                    content: Text('Please allow us to access your location!'),
                    onConfirm: () async {
                      await Geolocator.requestPermission();
                      Get.back();
                    });
              }
            },
          ),
        ),
      ),
    );
  }

  Future<Position> _getCurrentPosition() async {
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
    print(">>Permission");
    print(permission);
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<void> _getCurrentLocation() async {
    try {
      _currentPosition = await _getCurrentPosition();
      LatLng position =
          LatLng(_currentPosition!.latitude, _currentPosition!.longitude);
      CameraPosition cameraPosition =
          new CameraPosition(target: position, zoom: 14);
      mapController!
          .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    } catch (error) {
      throw error;
    }
  }

  Future<String> _getCurrentAddress() async {
    await _getCurrentLocation();
    List<Placemark> placemarks = await placemarkFromCoordinates(
        _currentPosition!.latitude, _currentPosition!.longitude);
    Placemark place = placemarks[0];
    print(place);

    return '${place.street}, ${place.thoroughfare}, ${place.subAdministrativeArea}, '
        '${place.administrativeArea}, ${place.country}';
  }

  void _onMapCreated(GoogleMapController _cntlr) {
    _controller.complete(_cntlr);
    mapController = _cntlr;
  }
}
