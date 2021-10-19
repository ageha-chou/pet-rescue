import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pet_rescue/modules/volunteer_report/report_form.dart';
import 'package:pet_rescue/modules/volunteer_report/volunteer_report_controller.dart';
import 'package:pet_rescue/routes/app_pages.dart';
import 'package:pet_rescue/shared/constants/color.dart';

class ReporterRoute extends StatefulWidget {
  const ReporterRoute({Key? key}) : super(key: key);

  @override
  _ReporterRoute createState() => _ReporterRoute();
}

class _ReporterRoute extends State<ReporterRoute> {
  final controller = Get.find<VolunteerReportController>();
  final LatLng _volunteerLat = LatLng(10.782470184547625, 106.6790621573682); //
  final LatLng _currentLat = LatLng(10.786496594215222, 106.67168185806077); //
  late final GoogleMapController _controller;
  Map<MarkerId, Marker> markers = {};
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();
  String googleApiKey = dotenv.env['GG_API_KEY']!;

  late BitmapDescriptor volunteerDescriptor;
  late BitmapDescriptor petDescriptor;

  @override
  void initState() {
    super.initState();

    init();
  }

  Future<void> setCustomMapPin() async {
    var image = await getBytesFromAsset('assets/images/yrh.png', 170);
    petDescriptor = BitmapDescriptor.fromBytes(image);

    image = await getBytesFromAsset('assets/images/pet-pin.png', 120);
    volunteerDescriptor = BitmapDescriptor.fromBytes(image);
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  void init() async {
    await setCustomMapPin();

    //current marker
    _addMarker(
      _currentLat,
      "current",
      petDescriptor,
    );

    //volunteer marker
    _addMarker(
      _volunteerLat,
      "volunteer",
      volunteerDescriptor,
    );

    _getPolyline();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Reported Pets'),
      ),
      body: Stack(
        children: [
          _buildGoogleMap(),
          _buildContainer(),
        ],
      ),
    );
  }

  Widget _buildContainer() {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.all(0),
        child: _buildCard(
          context,
          onTapHandler: () => Get.to(ReportForm()),
          location: controller.report.location,
          petType: controller.report.petType,
          quantity: controller.report.quantity.toString(),
          healthCondition: controller.report.healCondition,
          volunteer: _buildVolunteer(context,
              volunteerName: 'Reporter Name', subTitle: '2km away'),
        ),
      ),
    );
  }

  Widget _buildGoogleMap() {
    return GoogleMap(
      onMapCreated: onMapCreated,
      initialCameraPosition: CameraPosition(target: _currentLat, zoom: 15.0),
      mapType: MapType.normal,
      myLocationEnabled: true,
      tiltGesturesEnabled: true,
      compassEnabled: true,
      scrollGesturesEnabled: true,
      zoomGesturesEnabled: false,
      markers: Set<Marker>.of(markers.values),
      polylines: Set<Polyline>.of(polylines.values),
    );
  }

  void onMapCreated(GoogleMapController controller) {
    _controller = controller;
  }

  _addMarker(LatLng position, String id, BitmapDescriptor descriptor) {
    MarkerId markerId = MarkerId(id);
    Marker marker =
        Marker(markerId: markerId, icon: descriptor, position: position);
    markers[markerId] = marker;
  }

  _addPolyLine() {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
        polylineId: id,
        color: Colors.orange,
        width: 3,
        points: polylineCoordinates);
    polylines[id] = polyline;
    setState(() {});
  }

  _getPolyline() async {
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleApiKey,
      PointLatLng(_currentLat.latitude, _currentLat.longitude),
      PointLatLng(_volunteerLat.latitude, _volunteerLat.longitude),
      travelMode: TravelMode.driving,
      // wayPoints: [PolylineWayPoint(location: "Sabo, Yaba Lagos Nigeria")],
    );

    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }
    _addPolyLine();
  }

  Widget _buildCard(BuildContext context,
      {required String location,
      required String petType,
      required String quantity,
      required String healthCondition,
      Widget? volunteer,
      Widget? acceptWidget,
      VoidCallback? onTapHandler}) {
    return InkWell(
      onTap: onTapHandler,
      child: Card(
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(10.0),
        // ),
        elevation: 5.0,
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  if (volunteer == null) ...[
                    const SizedBox(height: 8),
                    ..._buildLocation(context, location),
                    _buildPopupMenu(),
                  ],
                  // Spacer(),
                ],
              ),
              if (volunteer != null) ...[
                volunteer,
                Divider(),
              ],
              if (volunteer != null)
                Row(
                  children: _buildLocation(context, location),
                ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(
                    FontAwesomeIcons.paw,
                    size: 22,
                    color: ColorConstants.red,
                  ),
                  const SizedBox(width: 10),
                  Flexible(
                    child: Text(
                      petType,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    FontAwesomeIcons.calculator,
                    size: 22,
                    color: ColorConstants.red,
                  ),
                  const SizedBox(width: 5),
                  const SizedBox(width: 5),
                  Flexible(
                    child: Text(
                      quantity,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(
                    FontAwesomeIcons.notesMedical,
                    size: 22,
                    color: ColorConstants.red,
                  ),
                  const SizedBox(width: 10),
                  Flexible(
                    child: Text(
                      healthCondition,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  Spacer(),
                  if (controller.report.emergencyCase)
                    Container(
                      height: 40,
                      child: Chip(
                        backgroundColor: Colors.deepOrange,
                        label: Text(
                          'Emergency',
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        avatar: Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 5.0,
                          ),
                          child: Icon(
                            Icons.warning_amber_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              if (volunteer == null) ...[
                Divider(),
                Row(
                  children: [
                    AnimatedTextKit(
                      animatedTexts: [
                        WavyAnimatedText('In coming...'),
                      ],
                      repeatForever: true,
                    ),
                  ],
                ),
              ],
              if (acceptWidget != null) ...[
                Divider(),
                acceptWidget,
              ]
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVolunteer(BuildContext context,
      {required volunteerName, required subTitle}) {
    return Row(
      children: [
        CircleAvatar(
          // child: Icon(Icons.person),
          backgroundImage: AssetImage('assets/images/user_avatar.jpg'),
          // backgroundColor: Theme.of(context).primaryColor,
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              volunteerName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    color: ColorConstants.red,
                  ),
            ),
            Text(
              subTitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ],
        ),
        Spacer(),
        _buildPopupMenu(),
      ],
    );
  }

  List<Widget> _buildLocation(BuildContext context, String location) {
    return [
      Icon(
        Icons.location_pin,
        size: 22,
        color: ColorConstants.red,
      ),
      const SizedBox(width: 10),
      Flexible(
        child: Text(
          location,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    ];
  }

  Widget _buildPopupMenu() {
    return PopupMenuButton(
      child: Container(
        height: 20,
        margin: EdgeInsets.only(
          left: 5,
        ),
        child: AspectRatio(
          aspectRatio: 1 / 1,
          child: Image.asset('assets/images/kebab_menu.png'),
        ),
      ),
      itemBuilder: (ctx) => [
        const PopupMenuItem(
          child: Text('Cancel'),
        ),
      ],
    );
  }
}
