import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_pariwisata/model/model_topdestination.dart';
import 'package:project_pariwisata/view/fulldetailpagedestination.dart';


bool isFavorite = false;

class DetailPageDestinations extends StatefulWidget {
  final TopDestinations place;
  const DetailPageDestinations({super.key, required this.place});

  @override
  State<DetailPageDestinations> createState() => _DetailPageDestinationsState();
}

class _DetailPageDestinationsState extends State<DetailPageDestinations> {
  @override
  Widget build(BuildContext context) {
    final mediaqueryHeight = MediaQuery.of(context).size.height;
    final mediaqueryWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: SizedBox(
          height: mediaqueryHeight,
          width: mediaqueryWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _arrowBack(context),
              _contentImage(mediaqueryHeight, mediaqueryWidth),
              _favoritebutton(),
              _namePlace(),
              _address(),
              _description(),
              const Divider(
                indent: 20,
                endIndent: 20,
                color: Colors.black,
              ),
              _fillDescription(mediaqueryHeight, mediaqueryWidth, context)
            ],
          ),
        ),
      )),
    );
  }

  Expanded _favoritebutton() {
    return Expanded(
      flex: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: IconButton(
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite;
              });
            },
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border_outlined,
              size: 30,
              color: Colors.red,
            )),
      ),
    );
  }

  Expanded _fillDescription(
      double mediaqueryHeight, double mediaqueryWidth, BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 0),
        height: mediaqueryHeight,
        width: mediaqueryWidth,
        decoration: const BoxDecoration(
            //color: Colors.amber.shade500,
            ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Text(
                textAlign: TextAlign.justify,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                widget.place.description,
                style: GoogleFonts.alegreya(
                    fontWeight: FontWeight.w500, fontSize: 14),
              ),
            ),
            Expanded(
                child: TextButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return FullDetailPageDestinations(
                    descriptions: widget.place.description,
                  );
                }));
              },
              child: Text(
                "Read More ...",
                style: GoogleFonts.alegreya(
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    color: Colors.blue.shade500),
              ),
            )),
          ],
        ),
      ),
    );
  }

  Row _description() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, top: 15),
            child: Text(
              "Description",
              style: GoogleFonts.alegreya(
                  fontSize: 18, fontWeight: FontWeight.w700),
            ),
          ),
        )
      ],
    );
  }

  Row _address() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, top: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Address",
                  style: GoogleFonts.alegreya(
                      fontSize: 14, fontWeight: FontWeight.w800),
                ),
                Text(
                  overflow: TextOverflow.ellipsis,
                  widget.place.address,
                  style: GoogleFonts.alegreya(
                      fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Row _namePlace() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              widget.place.placeName,
              style: GoogleFonts.alegreya(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }

  Expanded _contentImage(double mediaqueryHeight, double mediaqueryWidth) {
    return Expanded(
      flex: 4,
      child: Container(
        margin: const EdgeInsets.only(left: 20, top: 10, right: 20),
        height: mediaqueryHeight / 2.3,
        width: mediaqueryWidth,
        decoration: BoxDecoration(
          color: Colors.grey.shade400,
          image: DecorationImage(
              image: NetworkImage(widget.place.imageUrl), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }

  Row _arrowBack(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 20),
            child: IconButton(
                alignment: Alignment.bottomLeft,
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(FeatherIcons.arrowLeftCircle)),
          ),
        ),
      ],
    );
  }
}
