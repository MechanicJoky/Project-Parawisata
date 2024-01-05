import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_pariwisata/model/model_topdestination.dart';
import 'package:project_pariwisata/view/detailpagedestination.dart';

class DetailDestinationCategoryMountain extends StatelessWidget {
  const DetailDestinationCategoryMountain({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaqueryWidth = MediaQuery.of(context).size.width;
    final mediaqueryHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _arrowback(context),
          _mountain(),
          const SizedBox(
            height: 5,
          ),
          Divider(
            color: Colors.grey.shade500,
            height: 15,
            indent: 20,
            thickness: 2,
          ),
          Expanded(
            child: SizedBox(
              height: mediaqueryHeight,
              width: mediaqueryWidth,
              // color: Colors.amber.shade100,
              child: ListView.builder(
                itemCount: destinationsList.length,
                itemBuilder: (context, index) {
                  final TopDestinations place = destinationsList[index];
                  return GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          DetailPageDestinations(place: place),
                    )),
                    child: Container(
                      height: mediaqueryHeight / 4.5,
                      width: 100,
                      decoration: const BoxDecoration(
                          //color: Colors.green
                          ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              _imagecontent(place),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _nameplace(place),
                                    _textaddress(),
                                    _filltextaddress(place)
                                  ],
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Divider(
                            color: Colors.grey.shade500,
                            height: 15,
                            indent: 20,
                            thickness: 2,
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      )),
    );
  }

  Text _filltextaddress(TopDestinations place) {
    return Text(
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      place.address,
      style: GoogleFonts.alegreya(fontSize: 14, fontWeight: FontWeight.w500),
    );
  }

  Padding _textaddress() {
    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: Text(
        "Address",
        style: GoogleFonts.alegreya(fontSize: 14, fontWeight: FontWeight.w800),
      ),
    );
  }

  Padding _nameplace(TopDestinations place) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0),
      child: Text(
        place.placeName,
        style: GoogleFonts.alegreya(
            fontSize: 24, fontWeight: FontWeight.w700, color: Colors.black),
      ),
    );
  }

  Container _imagecontent(TopDestinations place) {
    return Container(
      margin: const EdgeInsets.only(left: 20, top: 20),
      height: 150,
      width: 150,
      child: Image(fit: BoxFit.cover, image: NetworkImage(place.imageUrl)),
    );
  }

  Padding _mountain() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 20, left: 20, right: 20),
      child: Text(
        "Mountain",
        style: GoogleFonts.dmSerifDisplay(
            fontSize: 35, fontWeight: FontWeight.w900, color: Colors.black),
      ),
    );
  }

  IconButton _arrowback(BuildContext context) {
    return IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: const Icon(FeatherIcons.arrowLeft));
  }
}
