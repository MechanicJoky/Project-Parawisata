import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_pariwisata/model/model_topdestination.dart';
import 'package:project_pariwisata/view/detailpagedestinations.dart';

String image1 = "assets/images/forest.png";
String image2 = "assets/images/camp.png";
String image3 = "assets/images/hiking.png";
String image4 = "assets/images/mountain.png";
String image5 = "assets/images/beach.png";
List<String> image = [image1, image2, image3, image4, image5];

List imagetopDestinations = [
  "https://picsum.photos/id/10/200/300",
  "https://picsum.photos/id/11/200/300",
  "https://picsum.photos/id/12/200/300",
  "https://picsum.photos/id/13/200/300",
  "https://picsum.photos/id/14/200/300",
  "https://picsum.photos/id/15/200/300",
  "https://picsum.photos/id/16/200/300",
  "https://picsum.photos/id/17/200/300",
];

List placenametopDestinations = [
  "Danau Laut Tawar",
  "Pantan Terong",
  "Burni Telong",
  "Pantai Menye",
  "Dermaga Lukup Panalan",
  "Gua Puteri Pukes",
  "Air Terjun Mangaya",
  "Bur Telege",
];

var numberbottomnavigationBar = 0;

List<topDestinations> topdestinations =
    List.generate(placenametopDestinations.length, (index) {
  return topDestinations(
      image: imagetopDestinations[index],
      placeName: placenametopDestinations[index]);
});

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /*List<topDestinations> topdestinations =
      List.generate(placenametopDestinations.length, (index) {
    return topDestinations(
        image: imagetopDestinations[index],
        placeName: placenametopDestinations[index]);
  });*/

  @override
  Widget build(BuildContext context) {
    final mediaqueryWidth = MediaQuery.of(context).size.width;
    final mediaqueryHeight = MediaQuery.of(context).size.height;
    List<dynamic> showPage = [
      _homePage(mediaqueryHeight, mediaqueryWidth),
      const Center(
        child: Text("Page Map"),
      ),
      const Center(
        child: Text("Page Profile"),
      ),
    ];
    return Scaffold(
      body: showPage[numberbottomnavigationBar],
      bottomNavigationBar: _bottomnavigationBar(),
    );
  }

  BottomNavigationBar _bottomnavigationBar() {
    return BottomNavigationBar(
      selectedItemColor: Colors.blue.shade500,
      unselectedItemColor: Colors.grey.shade600,
      backgroundColor: Colors.white,
      currentIndex: numberbottomnavigationBar,
      items: [
        BottomNavigationBarItem(icon: Icon(FeatherIcons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(FeatherIcons.map), label: "Map"),
        BottomNavigationBarItem(icon: Icon(FeatherIcons.user), label: "User")
      ],
      onTap: (value) {
        setState(() {
          print(value);
          numberbottomnavigationBar = value;
        });
      },
    );
  }

  SafeArea _homePage(double mediaqueryHeight, double mediaqueryWidth) {
    return SafeArea(
      child: Column(
        children: [
          _topBarr(mediaqueryHeight, mediaqueryWidth),
          _pointofInterest(),
          _search(),
          _destinationCategory(mediaqueryHeight, mediaqueryWidth),
          _topDestinations(),
          _gridviewtopDestinations(mediaqueryHeight, mediaqueryWidth)
        ],
      ),
    );
  }

  Expanded _gridviewtopDestinations(
      double mediaqueryHeight, double mediaqueryWidth) {
    return Expanded(
      child: GridView.builder(
        itemCount: 8,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 0, mainAxisSpacing: 25),
        itemBuilder: (context, index) {
          return Column(
            children: [
              Flexible(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return detailpageDestinations();
                      },
                    ));
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    height: mediaqueryHeight / 4,
                    width: mediaqueryWidth,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                          image: NetworkImage(
                              topdestinations[index].image.toString()),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
              ),
              Text(
                topdestinations[index].placeName.toString(),
                style: GoogleFonts.alegreya(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
            ],
          );
        },
      ),
    );
  }

  Row _topDestinations() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
          child: Text(
            "Top Destinations",
            style: GoogleFonts.alegreya(
                fontSize: 24, fontWeight: FontWeight.w700, color: Colors.black),
          ),
        )
      ],
    );
  }

  Container _destinationCategory(
      double mediaqueryHeight, double mediaqueryWidth) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
      padding: EdgeInsets.all(5),
      height: mediaqueryHeight / 8,
      width: mediaqueryWidth,
      //color: Colors.amber.shade100,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        _customdestinationCategory(
          image: image1,
          text: "Forest",
        ),
        _customdestinationCategory(image: image2, text: "Camping"),
        _customdestinationCategory(image: image3, text: "Hiking"),
        _customdestinationCategory(image: image4, text: "Mountain"),
        _customdestinationCategory(image: image5, text: "Beach")
      ]),
    );
  }

  Container _search() {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 15, 20, 0),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextFormField(
        decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(FeatherIcons.search),
            hintText: "Search area",
            hintStyle: GoogleFonts.roboto(color: Colors.grey.shade500)),
      ),
    );
  }

  Row _pointofInterest() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            "Point Of Interest",
            style: GoogleFonts.alegreya(
                fontSize: 28, fontWeight: FontWeight.w700, color: Colors.black),
          ),
        ),
      ],
    );
  }

  Row _topBarr(double mediaqueryHeight, double mediaqueryWidth) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              SizedBox(
                height: 10,
              ),
              RichText(
                text: TextSpan(
                  text: "Welcome Back",
                  style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              ),
              RichText(
                text: TextSpan(
                  text: "Muhammad Ali",
                  style: GoogleFonts.alegreya(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 140,
          ),
          Container(
            //margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
            height: mediaqueryHeight / 10,
            width: mediaqueryWidth / 8,
            decoration: BoxDecoration(
                color: Colors.amber,
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(
                        "https://picsum.photos/seed/picsum/200/300"))),
          )
        ]);
  }
}

class _customdestinationCategory extends StatelessWidget {
  final String image;
  final String text;
  const _customdestinationCategory({
    required this.image,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(
          image: AssetImage(image),
          height: 45,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Text(
            text,
            style: GoogleFonts.alegreya(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Colors.grey.shade500),
          ),
        )
      ],
    );
  }
}
