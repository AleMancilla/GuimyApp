import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class LocationBody extends StatefulWidget {
  @override
  _LocationBodyState createState() => _LocationBodyState();
}

class _LocationBodyState extends State<LocationBody> {
  Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);
      
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.orange,
      child: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 70.0,),
            Container(
              width: size.width,
              height: (size.height/10)*6.5,
              child: GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: _kGooglePlex,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
            ),
            FloatingActionButton.extended(
              onPressed: _goToTheLake,
              label: Text('To the lake!'),
              icon: Icon(Icons.directions_boat),
            ),
            // SizedBox(height: 100.0,),
          ],
        ),
      ),
    );
  }



  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}