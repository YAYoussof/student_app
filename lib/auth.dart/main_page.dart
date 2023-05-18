import 'package:fire_auth_koko/auth.dart/authpage.dart';
import 'package:fire_auth_koko/home_page.dart';
import 'package:fire_auth_koko/verify_email.dart';
// import 'package:fire_auth_koko/verify_email.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';



class Mainpage extends StatelessWidget {
  const Mainpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Verify_message();
          } else {
            return Authpage(showRegisterpage: () {    },);
          }
        },
      ),
    );
  }
}
