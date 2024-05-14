import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';

class ATMBranch extends StatefulWidget {
  const ATMBranch({super.key});
  @override
  State<ATMBranch> createState() => _ATMBranchState();
}

class _ATMBranchState extends State<ATMBranch> {
  var t = DateFormat('EEEE').format(DateTime.now());
  String tc = 'Friday';
  late String h;
  late StreamSubscription<Position> positionstream;
  late Position cl;
  var lat, long;
  late CameraPosition? _kGooglePlex;
  late GoogleMapController gmc;
  Marker sharqiaPMark = Marker(
      markerId: const MarkerId('my_mark'),
      infoWindow: const InfoWindow(title: "Ash sharqia branch"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      position: const LatLng(30.5886639, 31.5085403));
  Marker sharqiaAMark = Marker(
      markerId: const MarkerId('my_mark'),
      infoWindow: const InfoWindow(title: "Ash sharqia ATM"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      position: const LatLng(30.5886639, 31.5085403));
  Marker cairoPMark = Marker(
      markerId: const MarkerId('my_mark'),
      infoWindow: const InfoWindow(title: "Cairo branch"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      position: const LatLng(30.033333, 31.233334));
  Marker cairoAMark = Marker(
      markerId: const MarkerId('my_mark'),
      infoWindow: const InfoWindow(title: "Cairo ATM"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      position: const LatLng(30.033333, 31.233334));
  Marker alexPMark = Marker(
      markerId: const MarkerId('my_mark'),
      infoWindow: const InfoWindow(title: "Alex Branch"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      position: const LatLng(34.7386, 36.7064));
  Marker alexAMark = Marker(
      markerId: const MarkerId('my_mark'),
      infoWindow: const InfoWindow(title: "Alex ATM"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      position: const LatLng(34.7386, 36.7064));
  Marker aswanPMark = Marker(
      markerId: const MarkerId('my_mark'),
      infoWindow: const InfoWindow(title: "Aswan Branch"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      position: const LatLng(24.088938, 32.899830));
  Marker aswanAMark = Marker(
      markerId: const MarkerId('my_mark'),
      infoWindow: const InfoWindow(title: "Aswan ATM"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      position: const LatLng(24.088938, 32.899830));
  Marker? myMarker = Marker(
      markerId: const MarkerId('My'),
      infoWindow: const InfoWindow(title: "null"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      position: const LatLng(55, 55));

  changeMarker(newlat, newlong) {
    setState(() {
      gmc.moveCamera(CameraUpdate.newLatLng(LatLng(newlat, newlong)));
    });
    setState(() {
      newlat;
      newlong;
    });
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
    });
    print(
        '================================$_kGooglePlex===================================');

    setState(() {
      myMarker = Marker(
          markerId: const MarkerId('my_mark'),
          infoWindow: const InfoWindow(title: "your location"),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
          position: LatLng(lat, long));
    });
  }

  @override
  void initState() {
    getPosition();
    getLatAndLong();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (t == tc) {
      setState(() {
        h = 'Holiday';
      });
    } else {
      setState(() {
        h = 'avilable from 8 AM to 2 BM';
      });
    }

    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            'BRANCH/ATM LOCATION',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _kGooglePlex == null
                  ? SizedBox(
                      width: screenwidth,
                      height: screenheight,
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: Colors.black,
                        ),
                      ),
                    )
                  : Container(
                      height: screenheight,
                      color: Colors.yellow[100],
                      padding: const EdgeInsets.all(5),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            height: screenheight / 1.8,
                            child: GoogleMap(
                              markers: {
                                myMarker!,
                                sharqiaPMark,
                                sharqiaAMark,
                                cairoAMark,
                                cairoPMark,
                                aswanAMark,
                                aswanPMark,
                                alexPMark,
                                alexAMark
                              },
                              mapType: MapType.hybrid,
                              initialCameraPosition: _kGooglePlex!,
                              onMapCreated: (GoogleMapController controller) {
                                gmc = controller;
                              },
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            height: screenheight / 3,
                            child: ListView(
                              children: [
                                InkWell(
                                  child: BranchA('Ash sharqia  branch', h,
                                      'bilbase-sad-zaglol-str'),
                                  onTap: () {
                                    setState(() {
                                      LatLng latlng =
                                          const LatLng(30.5886639, 31.5085403);
                                      gmc.moveCamera(
                                          CameraUpdate.newLatLng(latlng));
                                    });
                                  },
                                ),
                                const Divider(
                                    thickness: 2, color: Colors.black),
                                InkWell(
                                  child: BranchA(
                                      'Ash sharqia  ATM',
                                      'available 24 hr',
                                      'bilbase-sad-zaglol-str'),
                                  onTap: () {
                                    setState(() {
                                      LatLng latlng =
                                          const LatLng(30.5886639, 31.5085403);
                                      gmc.moveCamera(
                                          CameraUpdate.newLatLng(latlng));
                                    });
                                  },
                                ),
                                const Divider(
                                    thickness: 2, color: Colors.black),
                                InkWell(
                                  child: BranchA('Cairo branch', h,
                                      'maady-elhoria-square-109str'),
                                  onTap: () {
                                    setState(() {
                                      //
                                      LatLng latlng =
                                          const LatLng(30.033333, 31.233334);
                                      gmc.moveCamera(
                                          CameraUpdate.newLatLng(latlng));
                                    });
                                  },
                                ),
                                const Divider(
                                    thickness: 2, color: Colors.black),
                                InkWell(
                                  child: BranchA('Cairo ATM', 'available 24 hr',
                                      'maady-elhoria-square-109str'),
                                  onTap: () {
                                    setState(() {
                                      LatLng latlng =
                                          const LatLng(30.033333, 31.233334);
                                      gmc.moveCamera(
                                          CameraUpdate.newLatLng(latlng));
                                    });
                                  },
                                ),
                                const Divider(
                                    thickness: 2, color: Colors.black),
                                InkWell(
                                  child: BranchA('Alexandria branch', h,
                                      'khalid-ibn-elwalid-san-stefano-mall'),
                                  onTap: () {
                                    LatLng latlng =
                                        const LatLng(34.7386, 36.7064);
                                    gmc.moveCamera(
                                        CameraUpdate.newLatLng(latlng));
                                  },
                                ),
                                const Divider(
                                    thickness: 2, color: Colors.black),
                                InkWell(
                                  child: BranchA(
                                      'Alexandria ATM',
                                      'available 24 hr',
                                      'khalid-ibn-elwalid-san-stefano-mall'),
                                  onTap: () {
                                    setState(() {
                                      LatLng latlng =
                                          const LatLng(34.7386, 36.7064);
                                      gmc.moveCamera(
                                          CameraUpdate.newLatLng(latlng));
                                    });
                                  },
                                ),
                                const Divider(
                                    thickness: 2, color: Colors.black),
                                InkWell(
                                  child: BranchA('Aswan branch', h,
                                      'infront-of-nubian-musiam'),
                                  onTap: () {
                                    setState(() {
                                      //Aswan branch action
                                      LatLng latlng =
                                          const LatLng(24.088938, 32.899830);
                                      gmc.moveCamera(
                                          CameraUpdate.newLatLng(latlng));
                                    });
                                  },
                                ),
                                const Divider(
                                    thickness: 2, color: Colors.black),
                                InkWell(
                                  child: BranchA('Aswan ATM', 'available 24 hr',
                                      'infront-of-nubian-musiam'),
                                  onTap: () {
                                    LatLng latlng =
                                        const LatLng(24.088938, 32.899830);
                                    gmc.moveCamera(
                                        CameraUpdate.newLatLng(latlng));
                                  },
                                ),
                                const Divider(
                                    thickness: 2, color: Colors.black),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
            ],
          ),
        ));
  }
}

class BranchA extends StatelessWidget {
  late String governorate; //محافظة
  late String available; //متاح ولالا
  late String address; // عنوان

  BranchA(this.governorate, this.available, this.address, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            governorate,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 3,
          ),
          Text(
            available,
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 5),
          Text(
            address,
            style: const TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
