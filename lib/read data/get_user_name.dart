import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetUsername extends StatelessWidget {
  final String documentId;
  GetUsername({required this.documentId});
  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;

          return Text("${data['firstname']} " +
              "   " +
              "${data['lastname']} " +
              "   " +
              ", ${data['age']} years old");
        }
        return Text('loading..');
      },
    );
  }
}
