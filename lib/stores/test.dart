import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String currentAddress = 'My Address';
  double? dis;
  Position? currentposition;

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Fluttertoast.showToast(msg: 'Please enable Your Location Service');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Fluttertoast.showToast(msg: 'Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      Fluttertoast.showToast(
          msg:
              'Location permissions are permanently denied, we cannot request permissions.');
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);

      Placemark place = placemarks[0];

      setState(() {
        currentposition = position;
        dis = Geolocator.distanceBetween(21.177075, 81.6972067, 21.177075, 81.5067);
        currentAddress =
            "${place.locality}, ${place.postalCode}, ${place.country}, ${place.street}";
      });
    } catch (e) {
      print(e);
    }
    return position;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Location'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(currentAddress),
            currentposition != null
                ? Text('Latitude = ${currentposition!.latitude}')
                : Container(),
            Text(currentAddress),
            currentposition != null ? Text('dis = $dis') : Container(),
            currentposition != null
                ? Text('Longitude = ${currentposition!.longitude}')
                : Container(),
            TextButton(
              onPressed: () {
                _determinePosition();
              },
              child: Text('Locate me'),
            ),
          ],
        ),
      ),
    );
  }
}
