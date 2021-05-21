import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
var locationMessage="";
  void getLocation() async{
    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    var lastPosition = await Geolocator().getLastKnownPosition();
  print(lastPosition);
  setState(() {
    locationMessage = "$position.latitude, $position.position.longitude";
  });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.blueAccent,
              primary: Colors.white,
            ),
            onPressed: () {
              getLocation();
            },
          child: Text("Get Location"),
          ),
          Text("Position: $locationMessage"),
        ],
      ),
    );
  }
}
