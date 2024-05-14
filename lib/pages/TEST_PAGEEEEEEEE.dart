import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class test extends StatefulWidget {
  const test({super.key});
  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  late StreamSubscription<Position> positionstream;
  late Position cl;
  var lat, long;
  late CameraPosition? _kGooglePlex;
  late GoogleMapController gmc;
  Set<Marker> mymarker = {};
  changeMarker(newlat, newlong) {
    setState(() {
      mymarker.remove(const Marker(markerId: MarkerId('1')));
      mymarker.add(Marker(
          markerId: const MarkerId('1'), position: LatLng(newlat, newlong)));

      gmc.moveCamera(CameraUpdate.newLatLng(LatLng(newlat, newlong)));
    });
    setState(() {});
  }

  Future getPosition() async {
    bool service;
    LocationPermission per = LocationPermission.denied;
    service = await Geolocator.isLocationServiceEnabled();
    if (service == false) {
      per = await Geolocator.checkPermission();
      if (per == LocationPermission.denied) {
        per = await Geolocator.requestPermission();
        if (per == LocationPermission.whileInUse) {
          setState(() {
            getLatAndLong();
          });
        }
        return per;
      }
    }
  }

  Future<void> getLatAndLong() async {
    cl = await Geolocator.getCurrentPosition().then((value) => value);
    lat = cl.latitude;
    long = cl.longitude;
    setState(() {
      _kGooglePlex = CameraPosition(
        target: LatLng(lat, long),
        zoom: 470.4746,
      );
      mymarker.add(
          Marker(markerId: const MarkerId('1'), position: LatLng(lat, long)));
    });
    print(
        '================================$_kGooglePlex===================================');

    setState(() {});
  }

  @override
  void initState() {
    positionstream = Geolocator.getPositionStream().listen((Position position) {
      changeMarker(position.latitude, position.longitude);
    });
    getPosition();
    getLatAndLong();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _kGooglePlex == null
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(3),
                  width: 400,
                  height: 600,
                  child: GoogleMap(
                    markers: mymarker,
                    mapType: MapType.satellite,
                    initialCameraPosition: _kGooglePlex!,
                    onMapCreated: (GoogleMapController controller) {
                      gmc = controller;
                    },
                  ),
                ),
                Row(
                  children: [
                    TextButton(
                      child: const Text(
                        'Hospital Location',
                        style: TextStyle(fontSize: 30),
                      ),
                      onPressed: () async {
                        LatLng latlng = const LatLng(30.033333, 31.233334);
                        gmc.moveCamera(CameraUpdate.newLatLng(latlng));
                      },
                    ),
                    TextButton(
                      onPressed: () async {
                        LatLng latlng = LatLng(lat, long);
                        gmc.moveCamera(CameraUpdate.newLatLng(latlng));
                      },
                      child: const Text(
                        'data',
                        style: TextStyle(fontSize: 30),
                      ),
                    )
                  ],
                )
              ],
            ),
    );
  }
}
