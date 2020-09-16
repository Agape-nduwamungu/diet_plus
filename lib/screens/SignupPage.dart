import 'package:diet_plus/screens/LoginPage.dart';
import 'package:diet_plus/services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  String _emailMsg = '';
  String _passwordMsg = '';
  String _cPasswordMsg = '';

  bool _emailGood = false;
  bool _passwordGood = false;
  bool _confirmPasswordGood = false;
  bool _creating = false;

  @override
  void initState() {
    // TODO: implement initState
    _passwordController.addListener(checkPassword);
    _confirmPasswordController.addListener(confirmPassword);
    _emailController.addListener(validateEmail);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
    SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Create an account for free",
                    style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  email(label: "Email", controller: _emailController,  message: _emailMsg),
                  makeInput(label: "Password", controller: _passwordController, obscureText: true, message: _passwordMsg),
                  makeInput(label: "Confirm Password", controller: _confirmPasswordController, obscureText: true, message: _cPasswordMsg),
                ],
              ),
              Column(
                children: <Widget>[
                  Container(
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
                        if (_passwordGood == true && _confirmPasswordGood == true && _emailGood == true) {
                          final authService = AuthService();
                          final user = await authService.signUpWithEmailAndPassword(email: _emailController.text, password: _passwordController.text);
                          if (user == false) {
                            Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text("Error creating user please try again"),
                            ));
                          } else {
                            Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text("Successful"),
                            ));
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()));
                          }
                        } else {
                          Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text("Incorrect sign up details"),
                          ));
                        }
                        setState(() => _creating = false);
                      },
                      color: Colors.orangeAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      child: Text("Sign up",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18)),
                    ) :
                    CupertinoActivityIndicator(animating: true, radius: 10,),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Already have an account?"),
                      RichText(text: TextSpan(
                          text: "Login",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black),
                          recognizer: TapGestureRecognizer()..onTap = () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()));
                          }
                      ),)
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }

  Widget makeInput({@required label, @required controller, obscureText = false, message}) {
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
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              errorText: message == '' ? null : message == 'Passwords match' ? null: message,
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

  Widget email({@required label, @required controller,  message}) {
    String _message;

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
        TextFormField(
          controller: controller,
          validator: (text) {
            bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(text);
            print(text);
            if (emailValid == false) {
              _message = 'Invalid Email';
            } else {
              _message = 'Valid Email';
            }
            return _message;
          },
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              errorText:  message == '' ? null : message == 'Valid Email' ? null: message,
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
  bool validateEmail () {
    bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(_emailController.text);

    if (emailValid == false) {
      print(_emailController.text);
      setState(() {
        _emailGood = false;
        _emailMsg = 'Invalid Email';
      });
    } else {
      print(_emailController.text);
      setState(() {
        _emailGood = true;
        _emailMsg = 'Valid Email';
      });
    }
    return emailValid;
  }

  bool checkPassword() {

    if (_confirmPasswordController.text == null || _confirmPasswordController.text == "") {
      setState(() {
        _passwordGood = true;
        _passwordMsg = 'Passwords match';
      });
      return true;
    } else if (_confirmPasswordController.text != null && _confirmPasswordController.text == _passwordController.text) {
      setState(() {
        _passwordGood = true;
        _passwordMsg = 'Passwords match';
      });
      return true;
    }

    setState(() {
      _passwordGood = false;
      _passwordMsg = 'Passwords do not match';
    });
    return false;
  }

  bool confirmPassword() {
   if (_confirmPasswordController.text != null && _confirmPasswordController.text == _passwordController.text) {
      setState(() {
        _passwordGood = true;
        _confirmPasswordGood = true;
        _cPasswordMsg = 'Passwords match';
      });
      print("Match");
      return true;
    }

   print("No Match");
    setState(() {
      _passwordGood = false;
      _confirmPasswordGood = false;
      _cPasswordMsg = 'Passwords do not match';
    });
    return false;
    return false;
  }
}
