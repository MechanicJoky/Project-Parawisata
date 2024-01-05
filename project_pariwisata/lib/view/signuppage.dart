import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:project_pariwisata/view/loginpage.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaqueryWidth = MediaQuery.of(context).size.width;
    final mediaqueryHeight = MediaQuery.of(context).size.height;
    double getSmallDiameter = MediaQuery.of(context).size.width * 2 / 3;
    return Scaffold(
      body: Stack(children: [
        Stack(
          children: [
            _smallcircle(getSmallDiameter),
          ],
        ),
        _arrowback(context),
        _createaccount(),
        _inputusername(),
        _inputemail(),
        _inputpassword(),
        _buttonsignup(context, mediaqueryHeight, mediaqueryWidth),
      ]),
    );
  }

  Positioned _buttonsignup(BuildContext context, double mediaqueryHeight, double mediaqueryWidth) {
    return Positioned(
        left: 100,
        right: 100,
        top: 680,
        child: Align(
          alignment: const Alignment(0, 0.5),
          child: GestureDetector(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const LoginPage(),
            )),
            child: Container(
              height: mediaqueryHeight / 15,
              width: mediaqueryWidth / 2.5,
              decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(30),
                  gradient: LinearGradient(colors: [
                    Colors.green.shade300,
                    Colors.lightBlue.shade300
                  ])),
              child: Center(
                child: Text(
                  "SIGN UP",
                  style: GoogleFonts.roboto(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w900),
                ),
              ),
            ),
          ),
        ),
      );
  }

  Positioned _inputpassword() {
    return Positioned(
        left: 30,
        right: 65,
        top: 530,
        child: TextField(
          obscureText: false,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]')),
          ],
          decoration: const InputDecoration(
            icon: Icon(FeatherIcons.lock, color: Colors.grey),
            hintText: "PASSWORD",
            border: UnderlineInputBorder(),
            hintStyle: TextStyle(
                fontSize: 16,
                color: Colors.grey,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal),
          ),
        ),
      );
  }

  Positioned _inputemail() {
    return Positioned(
        left: 30,
        right: 65,
        top: 450,
        //margin: EdgeInsets.symmetric(horizontal: 60),
        child: TextField(
          inputFormatters: [
            FilteringTextInputFormatter.allow(
                RegExp(r'[a-zA-Z0-9!@#\$%^&*().]'))
          ],
          decoration: const InputDecoration(
            icon: Icon(FeatherIcons.mail, color: Colors.grey),
            hintText: "EMAIL",
            border: UnderlineInputBorder(),
            hintStyle: TextStyle(
                fontSize: 16,
                color: Colors.grey,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal),
          ),
        ),
      );
  }

  Positioned _inputusername() {
    return Positioned(
        left: 30,
        right: 65,
        top: 370,
        //margin: EdgeInsets.symmetric(horizontal: 60),
        child: TextField(
          inputFormatters: [
            FilteringTextInputFormatter.allow(
                RegExp(r'[a-zA-Z0-9!@#\$%^&*().]'))
          ],
          decoration: const InputDecoration(
            icon: Icon(FeatherIcons.user, color: Colors.grey),
            hintText: "USERNAME",
            border: UnderlineInputBorder(),
            hintStyle: TextStyle(
                fontSize: 16,
                color: Colors.grey,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal),
          ),
        ),
      );
  }

  Positioned _createaccount() {
    return Positioned(
        left: 16.0,
        right: 16.0,
        height: 800,
        child: Align(
          alignment: const Alignment(0, -0.3),
          child: Text(
            "Create Account",
            style: GoogleFonts.roboto(
                fontSize: 40,
                color: Colors.black,
                fontWeight: FontWeight.w900),
          ),
        ),
      );
  }

  Positioned _arrowback(BuildContext context) {
    return Positioned(
        top: 50,
        child: Align(
          alignment: const Alignment(-1, -0.85),
          child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                FeatherIcons.arrowLeft,
                size: 25,
              )),
        ),
      );
  }

  Positioned _smallcircle(double getSmallDiameter) {
    return Positioned(
            right: -getSmallDiameter / 2,
            top: -getSmallDiameter / 3,
            child: Container(
              height: getSmallDiameter,
              width: getSmallDiameter,
              decoration: BoxDecoration(
                  //color: Colors.amber,
                  shape: BoxShape.circle,
                  gradient: LinearGradient(colors: [
                    Colors.green.shade300,
                    Colors.lightBlue.shade300
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
            ),
          );
  }
}
