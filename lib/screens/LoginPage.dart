import 'package:diet_plus/screens/HomeScreen.dart';
import 'package:diet_plus/screens/SignupPage.dart';
import 'package:diet_plus/services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool _creating = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: Builder(
        builder: (context) =>
            Container(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Text(
                              "Login",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Login to your account",
                              style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 40),
                          child: Column(
                            children: <Widget>[
                              makeInput(label: "Email", controller: _emailController),
                              makeInput(label: "Password", controller: _passwordController, obscureText: true),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 40),
                          child: Container(
                            padding: EdgeInsets.only(top: 1, left: 1),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border(
                                    bottom: BorderSide(color: Colors.black),
                                    top: BorderSide(color: Colors.black),
                                    left: BorderSide(color: Colors.black),
                                    right: BorderSide(color: Colors.black))),
                            child: !_creating ? MaterialButton(
                              minWidth: double.infinity,
                              height: 60,
                              onPressed: () async {
                                setState(() => _creating = true);
                                if (_emailController.text.isNotEmpty && _passwordController.text.isNotEmpty) {
                                  final authService = AuthService();
                                  final user = await authService.login(email: _emailController.text, password: _passwordController.text);

                                  if (user != false) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => HomeScreen()));
                                  } else {
                                    Scaffold.of(context).showSnackBar(SnackBar(
                                      content: Text("Incorrect login details"),
                                    ));
                                  }
                                } else {
                                  Scaffold.of(context).showSnackBar(SnackBar(
                                    content: Text("Please fill login details"),
                                  ));
                                }
                                setState(() => _creating = false);
                              },
                              color: Colors.redAccent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              child: Text("Login",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600, fontSize: 18)),
                            ) :
                            CupertinoActivityIndicator(animating: true, radius: 10,),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("Don't have an account?"),
                            RichText(text: TextSpan(
                                text: "Sign Up",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black),
                                recognizer: TapGestureRecognizer()..onTap = () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignupPage()));
                                }
                            ),)
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
      ),
    );
  }

  Widget makeInput({label, controller, obscureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
        ),
        SizedBox(
          height: 2,
        ),
        TextField(
          obscureText: obscureText,
          controller: controller,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[400])),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[400]))),
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
