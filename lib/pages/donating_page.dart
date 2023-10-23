import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
// import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:video_player/video_player.dart';

import 'Drawer.dart';

class DonatingPage extends StatefulWidget {
  const DonatingPage({super.key});

  @override
  State<DonatingPage> createState() => _DonatingPageState();
}

class _DonatingPageState extends State<DonatingPage> {
  final TextEditingController _donorNameController = TextEditingController();
  final TextEditingController _donorNumberController = TextEditingController();
  final TextEditingController _donorAgeController = TextEditingController();
  final TextEditingController _donorLocationController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String _dropdownValue = "I don't know";
  var _items = [
    "I don't know",
    'A+',
    'A-',
    'B+',
    'B-',
    'AB+',
    'AB-',
    'O+',
    'O-',
  ];

  // String _radioValue = 'male';

  int _radioValue = 1;

  Position? currentPosition;
  bool _loadLocation = false;
  bool _loadingData = false;

  String myLocation = "";
  late String lat;
  late String long;

  // String fileUrl = "";

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    setState(() {
      _loadLocation = true;
    });

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

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    try {
      List<Placemark> placemark =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark place = placemark[0];

      setState(() {
        currentPosition = position;
        myLocation = " ${place.country} ${place.subAdministrativeArea}";
        // print("LLLLLLMMMMMMM ${place}");
      });
    } catch (e) {
      print(e);
    }

    setState(() {
      _loadLocation = false;
    });
    return position;

    // return await Geolocator.getCurrentPosition(
    //   desiredAccuracy: LocationAccuracy.high
    // );
  }

  @override
  void dispose() {
    super.dispose();
    _donorNameController.dispose();
    _donorNumberController.dispose();
    _donorAgeController.dispose();
    _donorLocationController.dispose();
  }

  Future<void> _launchUrl() async {
    final Uri _url = Uri(scheme: 'tel', path: "0280000000");
    if (await canLaunchUrl(_url)) {
      await launchUrl(_url);
    } else {
      throw Exception('Could not launch $_url');
    }
  }

  upLoadDataToDatabase() async {
    if (!_formKey.currentState!.validate()) return;

    print('bbbbbbbbb ${currentPosition?.latitude.toString()}');

    final lat = '${currentPosition?.latitude.toString()}';
    final long = '${currentPosition?.longitude.toString()}';

    String donorName = _donorNameController.value.text.trim();
    String donorNumber = _donorNumberController.value.text.trim();
    String donorAge = _donorAgeController.value.text.trim();
    String donorLocation = _donorLocationController.value.text.trim();

    setState(() {
      _loadingData = true;
    });

    try {
      uploadReportToDatabase(
          gender: _radioValue.toString(),
          locationLat: lat,
          locationLong: long,
          donorAge: donorAge,
          donorLocation: donorLocation,
          donorName: donorName,
          donorPhone: donorNumber,
          dropdownValue: _dropdownValue);
      Fluttertoast.showToast(
          msg: "Report Sent Successfully ",
          // msg: "${e.toString().replaceRange(0, 14, '').split(']')[1]}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
    } catch (e) {
      Fluttertoast.showToast(
          msg: "Please check Your internet connection ",
          // msg: "${e.toString().replaceRange(0, 14, '').split(']')[1]}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }

    setState(() {
      _loadingData = false;
      // _pickFile = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Donating Form"),
      ),
      // drawer: Drawer(
      //   child: MyDrawer(),
      // ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 8,
              ),

              const SizedBox(
                height: 8,
              ),
              const Text(
                "Select Blood Group👇",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 4,
              ),
              Container(
                height: 60,
                width: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade300),
                child: Center(
                  child: DropdownButton(
                    items: _items.map((String item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _dropdownValue = newValue!;
                      });
                    },
                    value: _dropdownValue,
                    borderRadius: BorderRadius.circular(10),
                    iconSize: 50,
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Gender",
                style: TextStyle(fontSize: 20),
              ),
              Row(
                children: [
                  Radio(
                      value: 1,
                      groupValue: _radioValue,
                      onChanged: (value) {
                        setState(() {
                          _radioValue = value!;
                        });
                      }),
                  const Text("Others")
                ],
              ),
              Row(
                children: [
                  Radio(
                      value: 2,
                      groupValue: _radioValue,
                      onChanged: (value) {
                        setState(() {
                          _radioValue = value!;
                        });
                      }),
                  const Text("MALE")
                ],
              ),
              Row(
                children: [
                  Radio(
                      value: 3,
                      groupValue: _radioValue,
                      onChanged: (value) {
                        setState(() {
                          _radioValue = value!;
                        });
                      }),
                  const Text("FEMALE")
                ],
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 8),
                      child: TextFormField(
                        controller: _donorNameController,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length < 6) {
                            return "Please your name is too short ";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Donor Name "),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 8),
                      child: TextFormField(
                        controller: _donorAgeController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please check Your Age ";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Age needed",
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 8),
                      child: TextFormField(
                        controller: _donorNumberController,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length <= 9) {
                            return "Please check Your phone number ";
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Phone Number needed",
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 8),
                      child: TextFormField(
                        controller: _donorLocationController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please Where Do You Stay";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Where Do You Stay",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // currentPosition != null ?  Text("${currentPosition.toString()}") : Text(""),
              const SizedBox(
                height: 8,
              ),
              Text(
                myLocation,
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(
                height: 8,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 10.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13.0)),
                  foregroundColor: Colors.white,
                ),
                child: _loadLocation
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      )
                    : const Text(
                        'Get My Current Location',
                        style: TextStyle(fontSize: 15.0),
                      ),
                onPressed: () {
                  _determinePosition();

                  // print('bbbbbbbbb ${currentPosition?.latitude.toString()}');
                  _determinePosition().then((value) {
                    lat = '${value.latitude}';
                    long = '${value.longitude}';

                    print("lat: $lat, long:$long");
                  });
                },
              ),
              _loadLocation
                  ? Container()
                  : ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 10.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        foregroundColor: Colors.white,
                      ),
                      child: _loadingData
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            )
                          : const Text(
                              'Send',
                              style: TextStyle(fontSize: 20.0),
                            ),
                      onPressed: () {
                        upLoadDataToDatabase();
                      },
                    ),
              const SizedBox(
                height: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> uploadReportToDatabase({
  required String donorName,
  required String donorPhone,
  required String donorLocation,
  required String donorAge,
  required String gender,
  required String locationLat,
  required String locationLong,
  required String dropdownValue,
}) async {
  CollectionReference users = FirebaseFirestore.instance.collection('donating');
  FirebaseAuth auth = FirebaseAuth.instance;
  String? uid = auth.currentUser?.uid.toString();
  users.add({
    'donorName': donorName,
    'donorPhone': donorPhone,
    'donorLocation': donorLocation,
    'uid': uid,
    'donorAge': donorAge,
    "LocationLat": locationLat,
    "LocationLong": locationLong,
    "gender": gender,
    'timestamp': FieldValue.serverTimestamp(),
    "bloodGroup": dropdownValue,
  });
  return;
}
