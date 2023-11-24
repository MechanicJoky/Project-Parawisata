import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_pariwisata/view/homepage.dart';

class detailpageDestinations extends StatelessWidget {
  const detailpageDestinations({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaqueryHeight = MediaQuery.of(context).size.height;
    final mediaqueryWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          _arrowBack(context),
          _contentImage(mediaqueryHeight, mediaqueryWidth),
          _namePlace(),
          _address(),
          _description(),
          Divider(
            indent: 20,
            endIndent: 20,
            color: Colors.black,
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 5),
              height: mediaqueryHeight,
              width: mediaqueryWidth,
              decoration: BoxDecoration(
                color: Colors.amber.shade500,
              ),
              child: Text("It is a long establis"),
            ),
          )
        ],
      )),
    );
  }

  Row _description() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 30),
          child: Text(
            "Description",
            style:
                GoogleFonts.alegreya(fontSize: 18, fontWeight: FontWeight.w700),
          ),
        )
      ],
    );
  }

  Row _address() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 5),
          child: Text(
            "Address",
            style:
                GoogleFonts.alegreya(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }

  Row _namePlace() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 20),
          child: Text(
            "Name Place",
            style: GoogleFonts.alegreya(
                fontSize: 28, fontWeight: FontWeight.w700, color: Colors.black),
          ),
        ),
      ],
    );
  }

  Container _contentImage(double mediaqueryHeight, double mediaqueryWidth) {
    return Container(
      margin: EdgeInsets.only(left: 20, top: 20, right: 20),
      height: mediaqueryHeight / 2,
      width: mediaqueryWidth,
      decoration: BoxDecoration(
        color: Colors.grey.shade400,
        image: DecorationImage(
            image: NetworkImage(
              topdestinations[0].image.toString(),
            ),
            fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(25),
      ),
    );
  }

  Row _arrowBack(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(left: 20),
          child: IconButton(
              alignment: Alignment.bottomLeft,
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(FeatherIcons.arrowLeftCircle)),
        ),
      ],
    );
  }
}
