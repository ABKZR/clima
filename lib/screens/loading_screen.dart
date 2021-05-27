import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
    getLocation();
  }

void getLocation() async{
    Location location = Location();
    await location.getCorrentLocation();
    latitude= (location.latitude);
    longitude=(location.longitude);
    getData();
}
 void getData() async{
 //http://api.openweathermap.org/data/2.5/weather?lat=26.1412378&lon=68.2692395&appid=$apiKey
 final queryParameters = {'lat':'$latitude','lon':'$longitude', 'appid':'$apiKey'};
 final uri = Uri.https('api.openweathermap.org', '/data/2.5/weather',queryParameters);
 http.Response response = await http.get(uri);
 if(response.statusCode == 200){
   String data = response.body;
   var decodeData = jsonDecode(data);
   double temperature = decodeData['main']['temp'];
   int conditon = decodeData['weather'][0]['id'];
   String cityName = decodeData['name'];
   print(temperature);
   print(conditon);
   print(cityName);

 }else{
   print(response.statusCode);
 }

 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
