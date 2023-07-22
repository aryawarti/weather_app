import 'package:flutter/material.dart';
import 'package:mausam_app/Worker/worker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  late String city="Delhi";
  late String tempu;
  late String hum;
  late String air_speed;
  late String des;
  late String main;
  late String icon;

  void start(String city) async {
    Worker instance = Worker(location: city);
    await instance.getData();
    tempu = instance.temp;
    hum = instance.humidity;
    air_speed = instance.airSpeed;
    des = instance.descripton;
    main = instance.main;
    icon=instance.icon;
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        "tempu_value": tempu,
        "hum_value": hum,
        "air_speed_value": air_speed,
        "des_value": des,
        "main_value": main,
        "icon_value":icon,
        "city_value": city,
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  Widget build(BuildContext context) {
    Map? search = ModalRoute.of(context)?.settings.arguments as Map?;
      if(search?.isNotEmpty ?? false){
        city=search?['searchText'];

      }
    start(city);
    return Scaffold(
      backgroundColor: Colors.blue[300],
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
               SizedBox(height: 180,),
              Image.asset(
                "images/favpng_cloud-sunlight-clip-art.png",
                height: 240,
                width: 240,
              ),
              Text(
                "Mausam App",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Made by RCI Private Limited',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SpinKitWave(
                color: Colors.white,
                size: 50.0,
              ),
            ],
          ),
        ),
      ),

    );
  }
}
