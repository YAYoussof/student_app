import 'package:flutter/material.dart';

class Home_subj extends StatefulWidget {
  // Home_subj ({Key key} ) : super(key: key);

  @override
  State<Home_subj> createState() => _Home_subjState();
}

class _Home_subjState extends State<Home_subj> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF674AEF),
        title: Text("Homepage_Subjects"),
      ),
      body: Container(
        child: Stack(
          children: [
            Stack(children: [
              Container(
                height: 350,
                decoration: BoxDecoration(
                  color: Colors.white,
                  // borderRadius:
                  //     BorderRadius.only(bottomRight: Radius.circular(70)
                  // )
                ),
              ),
              Container(
                height: 410,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Color(0xFF674AEF),
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(70))),
                child: Center(
                  child: Image.asset(
                    "images/stem-science-technology-engineering-math-vector-31629025.webp",
                    scale: 0.1,
                    fit: BoxFit.fill,
                    width: 300,
                    height: 250,
                  ),
                ),
              ),
            ]),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height / 2.666,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xFF674AEF),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height / 2.666,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(top: 80, bottom: 30),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(70))),
                child: Column(
                  children: [
                    Text(
                      textAlign: TextAlign.center,
                      "The Best place to learn programming",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Material(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xFF674AEF),
                      child: InkWell(
                        onTap: () {  Navigator.of(context).pushNamed("subject");},
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 80, vertical: 10),
                          child: Text(
                            "Subjects",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
