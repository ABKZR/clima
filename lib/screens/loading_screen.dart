import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';

const apiKey='c6a71a019c9db440efaa10eed6d8dd72';
class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}
class _LoadingScreenState extends State<LoadingScreen> {
 double latitude;
 double longitude;
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

void getLocationData() async{
    Location location = Location();
    await location.getCorrentLocation();
    latitude= (location.latitude);
    longitude=(location.longitude);
 Uri url = Uri.parse('http://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');
    NetworkHelper networkHelper = NetworkHelper(url);

var weatherData = await networkHelper.getData();

 Navigator.push(context, MaterialPageRoute(builder: (_)=>LocationScreen()));

}




 
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
