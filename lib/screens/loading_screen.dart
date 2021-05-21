import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
var locationMessage="";
  void getLocation() async{
   //LocationPermission permission = await Geolocator.checkPermission();
   //  LocationPermission permission = await Geolocator.requestPermission();
    var position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    //var lastPosition = await Geolocator().getLastKnownPosition();
  print(position);

  setState(() {
    locationMessage = "$position.latitude, $position.position.longitude";
  });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.blueAccent,
            primary: Colors.white,
          ),
          onPressed: () {
            getLocation();
          },
          child: Text(locationMessage),
        ),
      ),
    );
  }
}
