import 'dart:convert';
import 'package:http/http.dart';

class Worker{
   late String location;
   late String temp;
   late String humidity;
   late String airSpeed;
   late String descripton;
   late String main;
   late String icon;

   // constructor
   Worker({required this.location}){
   location=this.location;
   }
   Future<void> getData() async{
    try{
      Response response=await get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$location&appid=df2ead61e1942792058eed7ba6034772'));
      Map data=jsonDecode(response.body);

      // getting temp and humidity and humidity
      Map tempData=data['main'];
      Map wind=data['wind'];
      double getTemp=tempData['temp']-273.15;  //C
      double getAirSpeed=wind['speed']/0.27777777777778; // Km/h
      String getHumidity=tempData['humidity'].toString(); //%

      // getting Description
      List weatherData=data['weather'];
      Map weatherMainData=weatherData[0];
      String getMainDes=weatherMainData['main'];
      String getDesc=weatherMainData['description'];

      
      // Assigning values
      temp=getTemp.toString().substring(0,4);
      humidity=getHumidity.toString();
      airSpeed=getAirSpeed.toString().substring(0,4);
      descripton=getDesc.toString();
      main=getMainDes.toString();
      icon=weatherMainData["icon"].toString();
    }
    catch(e){
       print(e);
      temp="NA";
      humidity="NA";
      airSpeed="NA";
      descripton="NA";
      main="NA";
      icon="02d";
    }

   }

}