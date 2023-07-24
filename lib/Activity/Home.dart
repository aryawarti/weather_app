import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:weather_icons/weather_icons.dart';
import 'Loading.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController = new TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("I am in initstate");
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("Widget distroyed");
  }

  @override
  Widget build(BuildContext context) {
    Map? info = ModalRoute.of(context)?.settings.arguments as Map?;

    dynamic tempuValue = info?["tempu_value"];
    String temp = (tempuValue).toString();
    dynamic airValue = info?["air_speed_value"];
    String air = (airValue).toString();
    if (temp == "NA") {
      print("NA");
    } else {
      dynamic tempuValue = info?["tempu_value"];
      String temp = (tempuValue).toString().substring(0, 4);
      dynamic airValue = info?["air_speed_value"];
      String air = (airValue).toString().substring(0, 4);
    }
    dynamic iconValue = info?["icon_value"];
    String icon = iconValue;
    dynamic cityValue = info?["city_value"];
    String getCity = cityValue;
    dynamic humValue = info?["hum_value"];
    String hum = humValue;

    dynamic desValue = info?["des_value"];
    String des = desValue;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Colors.blue,
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.blue.shade800,
                Colors.blue.shade300,
              ],
            )),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  margin: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if ((searchController.text).replaceAll(" ", "") ==
                              "") {
                            print("Blank search");
                          } else {
                            Navigator.pushReplacementNamed(context, "/loading",
                                arguments: {
                                  "searchText": searchController.text,
                                });
                          }
                        },
                        child: Container(
                          child: Icon(Icons.search, color: Colors.blue),
                          margin: EdgeInsets.fromLTRB(3, 0, 7, 0),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                            controller: searchController,
                            decoration: InputDecoration(
                              hintText: "Search City",
                              border: InputBorder.none,
                            )),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white.withOpacity(0.5),
                        ),
                        padding: EdgeInsets.all(26),
                        margin: EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                          children: [
                            Image.network(
                                "https://openweathermap.org/img/wn/$icon@2x.png"),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              children: [
                                Text(
                                  "$des",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text("In $getCity",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.white.withOpacity(0.5),
                          ),
                          padding: EdgeInsets.all(26),
                          margin: EdgeInsets.symmetric(
                              horizontal: 25, vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                WeatherIcons.thermometer,
                                size: 40,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    " $temp",
                                    style: TextStyle(
                                      fontSize: 85,
                                    ),
                                  ),
                                  Icon(
                                    WeatherIcons.celsius,
                                    size: 50,
                                  )
                                ],
                              )
                            ],
                          )),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white.withOpacity(0.5),
                        ),
                        padding: EdgeInsets.all(26),
                        margin: EdgeInsets.fromLTRB(20, 0, 10, 0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  WeatherIcons.day_windy,
                                  size: 30,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              "$air",
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "km/hr",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white.withOpacity(0.5),
                        ),
                        padding: EdgeInsets.all(26),
                        margin: EdgeInsets.fromLTRB(10, 0, 20, 0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  WeatherIcons.humidity,
                                  size: 30,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              "$hum",
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(Icons.percent)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 85,
                ),
                Container(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Made by RCI Private Limited"),
                      Text("Data Provided by Openweathermap.org"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
