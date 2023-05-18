import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:location/location.dart';
// import 'package:permission_handler/permission_handler.dart';

class Home_location extends StatefulWidget {
  // const Home_location({super.key, required this.title});

  // final String title;

  @override
  State<Home_location> createState() => _Home_locationState();
}

class _Home_locationState extends State<Home_location> {
  late String lat;
  late String long;
  String l = 'Location';
  List students = [
    {"name": "Youssof Ahmed", "ID": "120190502"},
    {"name": "Islam", "ID": "120190503"},
    {"name": "Ziad", "ID": "120190504"},
    {"name": "Mina", "ID": "120190505"},
    {"name": "Hossam", "ID": "120190502"},
    {"name": "Mohamed", "ID": "120190502"},
    {"name": "Abdo", "ID": "120190502"},
  ];
  Future<Position> getposition() async {
    bool srvices;
    srvices = await Geolocator.isLocationServiceEnabled();
    if (!srvices) {
      return Future.error("Location services are disabled");
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("Location services are denied");
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we can not request permission');
    }
    return await Geolocator.getCurrentPosition();
  }

  Future liveLocation() async {

    LocationSettings locationSettings =
       const LocationSettings(accuracy: LocationAccuracy.high ,distanceFilter: 100);
    Geolocator.getPositionStream(locationSettings: locationSettings)
        .listen((Position position) {
      lat = position.latitude.toString();
      long = position.longitude.toString();

      setState(() {
        l = "Latitude: $lat , Longitude : $long";
      });
    });
    // List<Placemark> placemarks = await placemarkFromCoordinates(lat, 6.9437819);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Homepage"),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: ListView.separated(
              itemBuilder: (context, i) {
                return ListTile(
                  title: Text("${students[i]['name']}"),
                  trailing: Text("ID: ${students[i]["ID"]}"),
                  subtitle: Row(
                    children: [
                      Text("Location : "),
                      MaterialButton(
                        color: Colors.blue,
                        onPressed: () {
                          buttomsheet();
                        },
                        child: Text("location"),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, i) {
                return Divider(
                  thickness: 2,
                  color: Colors.teal,
                );
              },
              itemCount: students.length),
        ));
  }

  buttomsheet() {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Location",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(l),
                MaterialButton(
                  color: Colors.green,
                  onPressed: () {
                    getposition().then((value) {
                      lat = '${value.latitude}';
                      long = '${value.longitude}';
                      setState(() {
                        l = "Latitude: $lat , Longitude : $long";
                      });
                      liveLocation();
                    });
                  },
                  child: Text("Get Location"),
                ),
                MaterialButton(
                  color: Color(0xFF674AEF),
                  onPressed: () {
                    Navigator.of(context).pushNamed("home_sub");
                  },
                  child: Text("Go to home subjects"),
                ) //27.189959,31.169882  // 27.167315,31.193480
              ],
            ),
          );
        });
  }
}
