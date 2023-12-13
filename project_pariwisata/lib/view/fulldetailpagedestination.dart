import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FullDetailPageDestinations extends StatelessWidget {
  final String descriptions;

  const FullDetailPageDestinations({super.key, required this.descriptions});

  @override
  Widget build(BuildContext context) {
    final mediaqueryWidth = MediaQuery.of(context).size.width;
    final mediaqueryHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: _appbarDescription(),
      body: _fullfillDescription(mediaqueryHeight, mediaqueryWidth),
    );
  }

  Container _fullfillDescription(
      double mediaqueryHeight, double mediaqueryWidth) {
    return Container(
      margin: const EdgeInsets.all(20),
      height: mediaqueryHeight,
      width: mediaqueryWidth,
      decoration: BoxDecoration(
          color: Colors.grey.shade200,
          //border: Border.all(color: Colors.grey, width: 1),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade500,
                offset: const Offset(3, 6),
                blurRadius: 10,
                blurStyle: BlurStyle.outer)
          ]),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            textAlign: TextAlign.justify,
            descriptions,
            style: GoogleFonts.alegreya(
                wordSpacing: 1, fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }

  AppBar _appbarDescription() {
    return AppBar(
      centerTitle: true,
      title: Text(
        'Description',
        style: GoogleFonts.alegreya(
            fontSize: 25, fontWeight: FontWeight.w700, color: Colors.black),
      ),
    );
  }
}
