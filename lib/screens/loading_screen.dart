import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }
  void getData(){
    get(api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key})
  }
void getLocation() async{
    Location location = Location();
    await location.getCorrentLocation();
    print(location.latitude);
    print(location.longitude);
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    );
  }
}
