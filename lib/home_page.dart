import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_auth_koko/read%20data/get_user_name.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  // Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final user = FirebaseAuth.instance.currentUser!;

  // document Ids
  List<String> docIds = [];

  // get document
  Future getdocId() async {
    await FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((snapshot) => snapshot.docs.forEach((document) {
              print(document.reference);
              docIds.add(document.reference.id);
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          user.email!,
          style: TextStyle(fontSize: 16),
        ),
        centerTitle: true,
        actions: [
          InkWell(
              onTap: () {
                FirebaseAuth.instance.signOut();
              },
              child: Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text("Signed  in as " + user.email!),

            Expanded(
                child: FutureBuilder(
              future: getdocId(),
              builder: (context, snapshot) {
                return ListView.builder(
                  itemCount: docIds.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: GetUsername(documentId: docIds[index]),
                        tileColor: Colors.grey[200],
                      ),
                    );
                  },
                );
              },
            )),
            MaterialButton(
              minWidth: 200,
              color: Colors.deepPurple[200],
              onPressed: () {
                Navigator.of(context).pushNamed("location");
              },
              child: Text(
                "Location",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
