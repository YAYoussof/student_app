// import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Subjects extends StatefulWidget {
  // Subjects ({Key key} ) : super(key: key);

  @override
  State<Subjects> createState() => _SubjectsState();
}

class _SubjectsState extends State<Subjects> {
  var valu = 10.0;
  List subject = [
    {
      "name": "Operating System",
      "Doctor": "Ibrahim Elsseman",
      "image": "images/os.jpeg"
    },
    {
      "name": "Neural Network",
      "Doctor": "Ibrahim Elsseman",
      "image": "images/nn.jpg"
    },
    {
      "name": "Database",
      "Doctor": "Ibrahim Elsseman",
      "image": "images/data.jpeg"
    },
    {"name": "CPP", "Doctor": "Ibrahim Elsseman", "image": "images/cpp.jpeg"},
    {
      "name": "Network",
      "Doctor": "Ibrahim Elsseman",
      "image": "images/net.jpeg"
    },
  ];
  List student = [
    {""}
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF674AEF),
        title: Text("Subjects"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: 400,
            padding: EdgeInsets.all(10),
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: subject.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1, mainAxisSpacing: 20),
              itemBuilder: (context, i) {
                return Container(
                  margin: EdgeInsets.all(10),
                  // height: 0,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Color(0xFF674AEF),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: ListTile(
                    isThreeLine: true,
                    title: Text("${subject[i]["name"]}"),
                    leading: Image.asset(
                      subject[i]['image'],
                      // height: 60,
                      // width: 60,
                    ),
                    subtitle: Text("Doctor: ${subject[i]['Doctor']}"),
                  ),
                );
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Color(0xFF674AEF),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            margin: EdgeInsets.only(top: 70),
            child: MaterialButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed("first_page");
              },
              child: Text(
                "Go To HomePage",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
