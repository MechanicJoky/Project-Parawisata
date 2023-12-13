import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_pariwisata/view/loginpage.dart';

import 'package:project_pariwisata/view/signuppage.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaqueryWidth = MediaQuery.of(context).size.width;
    final mediaqueryHeight = MediaQuery.of(context).size.height;
    double getSmallDiameter = MediaQuery.of(context).size.width * 2 / 3;

    return Scaffold(
      body: Stack(
        children: [
          Stack(
            children: [
              _smallcircle(getSmallDiameter),
            ],
          ),
          Column(
            children: [
              _welcometext(),
              _buttongetstarted(context, mediaqueryHeight, mediaqueryWidth),
              _haveaccount(mediaqueryHeight, mediaqueryWidth, context)
            ],
          )
        ],
      ),
    );
  }

  SizedBox _haveaccount(
      double mediaqueryHeight, double mediaqueryWidth, BuildContext context) {
    return SizedBox(
      height: mediaqueryHeight / 15,
      width: mediaqueryWidth,
      //color: Colors.amber,
      child: Row(
        children: [
          const Flexible(
            child: Align(
              alignment: Alignment(4, 0),
              child: Text.rich(
                TextSpan(
                  text: "Already have a account?",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Flexible(
            child: Align(
              alignment: const Alignment(-0.15, 0),
              child: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return LinearGradient(colors: [
                    Colors.green.shade300,
                    Colors.lightBlue.shade300
                  ]).createShader(bounds);
                },
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return const LoginPage();
                      },
                    ));
                  },
                  child: const Text.rich(
                    TextSpan(
                      text: "Sign in",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Flexible _buttongetstarted(
      BuildContext context, double mediaqueryHeight, double mediaqueryWidth) {
    return Flexible(
      child: Align(
        alignment: const Alignment(0, 0.5),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) {
                return const SignUpPage();
              },
            ));
          },
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
                "Get Started !",
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

  Flexible _welcometext() {
    return Flexible(
      child: Align(
        alignment: const Alignment(0, 0.4),
        child: Text(
          "Welcome !",
          style: GoogleFonts.roboto(
              fontSize: 40, color: Colors.black, fontWeight: FontWeight.w900),
        ),
      ),
    );
  }

  Positioned _smallcircle(double getSmallDiameter) {
    return Positioned(
      //left: -getSmallDiameter / 2,
      right: -getSmallDiameter / 2,
      top: -getSmallDiameter / 3,
      child: Container(
        height: getSmallDiameter,
        width: getSmallDiameter,
        decoration: BoxDecoration(
            //color: Colors.amber,
            shape: BoxShape.circle,
            gradient: LinearGradient(
                colors: [Colors.green.shade300, Colors.lightBlue.shade300],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
      ),
    );
  }
}
