import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Reset_pass extends StatefulWidget {
  final VoidCallback showRegisterpage;
  const Reset_pass({Key? key, required this.showRegisterpage})
      : super(key: key);

  @override
  State<Reset_pass> createState() => _Reset_passState();
}

class _Reset_passState extends State<Reset_pass> {
  final emailcontroller = TextEditingController();

  @override
  void dispose() {
    emailcontroller.dispose();
    super.dispose();
  }

  Future passwordreset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailcontroller.text.trim());
          showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(content: Text("password reset Check your email"),);
        },
      );
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(content: Text(e.message.toString()),);
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[200],
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Enter your email"),
            SizedBox(
              height: 40,
            ),
            TextFormField(
              controller: emailcontroller,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                  labelText: "Email",
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12))),
            ),
            SizedBox(
              height: 40,
            ),
            MaterialButton(
              color: Colors.deepPurple[200],
              onPressed: passwordreset,
              child: Text("Reset password"),
            )
          ],
        ),
      ),
    );
  }
}
