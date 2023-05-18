import 'package:fire_auth_koko/Resetpass.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterpage;
  const LoginPage({Key? key, required this.showRegisterpage}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  Future signin() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailcontroller.text.trim(),
        password: passwordcontroller.text.trim());
  }

  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
        appBar: AppBar(
          title: Text("Login"),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               CircleAvatar(
              backgroundImage: AssetImage("images/signup.jpeg"),
              radius: 120,
            ),
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
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Forget password"),
                  MaterialButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Reset_pass(showRegisterpage: () {  },);
                      }));
                    },
                    child: Text(
                      "Reset now",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton.icon(
                style:
                    ElevatedButton.styleFrom(minimumSize: Size.fromHeight(50)),
                icon: Icon(
                  Icons.lock_open,
                  size: 32,
                ),
                label: Text(
                  "Sign in",
                  style: TextStyle(fontSize: 24),
                ),
                onPressed: signin,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("I am  not a member"),
                  MaterialButton(
                    onPressed: widget.showRegisterpage,
                    child: Text(
                      "Rigester now",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}








/*body: SingleChildScrollView(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("images/signup.jpeg"),
              radius: 120,
            ),
            SizedBox(
              height: 1,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              // padding: EdgeInsets.all(20),
              child: Form(
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.name,
                      initialValue: "Youssof",
                      decoration: InputDecoration(
                        focusColor: Colors.white,
                        labelText: "User_name",
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 1),
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                          labelText: "Password",
                          prefixIcon: Icon(Icons.key),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 1),
                              borderRadius: BorderRadius.circular(20))),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Row(children: [
                        Text(
                          "If you don not have account ",
                          // style: TextStyle(color: Colors.white),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed("signup");
                          },
                          child: Text(
                            "Click Here",
                            style: TextStyle(color: Colors.blue),
                          ),
                        )
                      ]),
                    ),
                    Container(
                      width: 200,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                      child: MaterialButton(
                          color: Colors.blue,
                          onPressed: () {
                            Navigator.of(context).pushReplacementNamed("home");
                          },
                          child: Text("Login",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)
                              //  TextStyle(color: Colors.white),
                              )),
                    )
                  ],
                ),
              ),
            )
          ],
        )),
      ),*/