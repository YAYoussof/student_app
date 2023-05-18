import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Registerpage extends StatefulWidget {
  final VoidCallback showLoginpage;
  const Registerpage({Key? key, required this.showLoginpage}) : super(key: key);

  @override
  State<Registerpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final firstnamecontroller = TextEditingController();
  final lastnamecontroller = TextEditingController();
  final agecontroller = TextEditingController();
  final academicnumcontroller = TextEditingController();

  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    firstnamecontroller.dispose();
    lastnamecontroller.dispose();
    agecontroller.dispose();
    academicnumcontroller.dispose();
    super.dispose();
  }

  Future signup() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailcontroller.text.trim(),
        password: passwordcontroller.text.trim());

    addUserDetails(
        firstnamecontroller.text.trim(),
        lastnamecontroller.text.trim(),
        int.parse(agecontroller.text.trim()) ,
        emailcontroller.text.trim(),
        int.parse(academicnumcontroller.text.trim()));
  }

  Future addUserDetails(String Firstname, String Lastname, int Age,
      String Email, int Academicnum) async {
    await FirebaseFirestore.instance.collection('users').add({
      'firstname': Firstname,
      'lastname': Lastname,
      'age': Age,
      'email': Email,
      'academnum': Academicnum,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Register"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                          // autovalidateMode: AutovalidateMode.onUserInteraction,
                          // validator: (email) => 
                          // email != null && EmailValidator.validate(email) ?
                          // 'Enter a valid email' : null ,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: passwordcontroller,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                      labelText: "Password",
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12))),
                  obscureText: true,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) => 
                          value != null && value.length < 6 ?
                          'Enter min 6 char' : null ,
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: firstnamecontroller,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      labelText: "Firstname",
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12))),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: lastnamecontroller,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      labelText: "Lastname",
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12))),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: agecontroller,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      labelText: "Age",
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12))),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: academicnumcontroller,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      labelText: "Academicnumber",
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12))),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size.fromHeight(50)),
                  icon: Icon(
                    Icons.lock_open,
                    size: 32,
                  ),
                  label: Text(
                    "Sign up",
                    style: TextStyle(fontSize: 24),
                  ),
                  onPressed: signup,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("I am a member"),
                    MaterialButton(
                      onPressed: widget.showLoginpage,
                      child: Text(
                        "Login now",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
