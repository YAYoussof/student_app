import 'package:fire_auth_koko/login_pade.dart';
import 'package:fire_auth_koko/regesterpage.dart';
import 'package:flutter/material.dart';

class Authpage extends StatefulWidget {
  final VoidCallback showRegisterpage;
  const Authpage({Key? key, required this.showRegisterpage}) : super(key: key);

  @override
  State<Authpage> createState() => _AuthpageState();
}

class _AuthpageState extends State<Authpage> {
  bool showLoginpage = true;
  void togglescreens(){
    setState(() {
      showLoginpage = !showLoginpage; 
    });

  }

  @override
  Widget build(BuildContext context) {
    if (showLoginpage) {
      return LoginPage(showRegisterpage: togglescreens);
    } else {
      return Registerpage(showLoginpage:togglescreens);
    }
  }
}
