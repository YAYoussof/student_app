import 'dart:async';

import 'package:fire_auth_koko/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Verify_message extends StatefulWidget {
  // final VoidCallback showRegisterpage;
  // const Verify_message({Key? key, required this.showRegisterpage}) : super(key: key);

  @override
  State<Verify_message> createState() => _Verify_messageState();
}

class _Verify_messageState extends State<Verify_message> {
  bool isMailverified = false;
  bool canResendmail = false;
  Timer? timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isMailverified = FirebaseAuth.instance.currentUser!.emailVerified;
    if (!isMailverified) {
      sendverificationemail();

      timer = Timer.periodic(
        Duration(seconds: 3),
        (_) => checkEmailveriried,
      );
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future checkEmailveriried() async {
    await FirebaseAuth.instance.currentUser!.reload();
    setState(() {
      isMailverified = FirebaseAuth.instance.currentUser!.emailVerified;
    });
    if (isMailverified) timer?.cancel();
  }

  Future sendverificationemail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();
      setState(() => canResendmail = false);
      await Future.delayed(Duration(seconds: 5));
      setState(() => canResendmail = true);
    } on FirebaseAuthException catch (e) {
      // Utils.showSnackBar(e.toString());
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) => isMailverified
      ? Homepage()
      : Scaffold(
          appBar: AppBar(
            title: Text("verify email"),
          ),
          body: Padding(
            padding: EdgeInsets.all(16),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Center(
                child: Text(
                  "A Verificaton email has been sent",
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 24,
              ),
              ElevatedButton.icon(
                  onPressed: canResendmail ? sendverificationemail : null,
                  icon: Icon(
                    Icons.email,
                    size: 32,
                  ),
                  label: Text("Resent Email")),
              SizedBox(
                height: 10,
              ),
              Container(
                color: Colors.blue,
                child: TextButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size.fromHeight(50)),
                  child: Text(
                    "Cancel",
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                  onPressed: () => FirebaseAuth.instance.signOut(),
                ),
              ),
            ]),
          ),
        );
}
