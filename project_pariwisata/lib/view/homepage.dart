import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_pariwisata/model/model_topdestination.dart';
import 'package:project_pariwisata/view/detailpagedestination.dart';


String image1 = "assets/images/forest.png";
String image2 = "assets/images/camp.png";
String image3 = "assets/images/hiking.png";
String image4 = "assets/images/mountain.png";
String image5 = "assets/images/beach.png";
List<String> image = [image1, image2, image3, image4, image5];

var numberbottomnavigationBar = 0;

/*List<topDestinations> topdestinations =
    List.generate(destinationsList.length, (index) {
  return topDestinations(
      address: destinationsList[index],
      description: destinationsList[index],
      imageUrl: destinationsList[index],
      placeName: destinationsList[index]);
});*/

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final mediaqueryWidth = MediaQuery.of(context).size.width;
    final mediaqueryHeight = MediaQuery.of(context).size.height;

    List<dynamic> showPage = [
      _homePage(mediaqueryHeight, mediaqueryWidth),
      _userPage(mediaqueryHeight, mediaqueryWidth)
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: showPage[numberbottomnavigationBar],
      bottomNavigationBar: _bottomnavigationBar(),
    );
  }

  SafeArea _userPage(double mediaqueryHeight, double mediaqueryWidth) {
    return SafeArea(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(20),
          child: Text("Profile"),
        ),
        Container(
          height: mediaqueryHeight / 15,
          width: mediaqueryWidth,
          decoration: BoxDecoration(color: Colors.blueGrey.shade300),
          child: Row(
            children: [
              Container(
                //margin: EdgeInsets.all(10),
                height: mediaqueryHeight,
                width: mediaqueryWidth / 5,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "https://picsum.photos/seed/picsum/200/300"))),
              ),
              Text(
                "Muhammad Ali",
                style: GoogleFonts.alegreya(
                    fontSize: 18, fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Text(
                "Email",
                style: GoogleFonts.alegreya(
                    fontSize: 14, fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Text(
                "example@gmail.com",
                style: GoogleFonts.alegreya(
                    fontSize: 14, fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Text(
                "Password",
                style: GoogleFonts.alegreya(
                    fontSize: 14, fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Text(
                "12345",
                style: GoogleFonts.alegreya(
                    fontSize: 14, fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
        Expanded(
          child: Align(
            alignment: Alignment.bottomCenter,
            //alignment: Alignment.bottomCenter,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Logout",
                  style: GoogleFonts.alegreya(
                      fontSize: 20, fontWeight: FontWeight.w700),
                )),
          ),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    ));
  }

  BottomNavigationBar _bottomnavigationBar() {
    return BottomNavigationBar(
      selectedItemColor: Colors.blue.shade500,
      unselectedItemColor: Colors.grey.shade600,
      backgroundColor: Colors.white,
      currentIndex: numberbottomnavigationBar,
      items: const [
        BottomNavigationBarItem(icon: Icon(FeatherIcons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(FeatherIcons.user), label: "User")
      ],
      onTap: (value) {
        setState(() {
          //print(value);
          numberbottomnavigationBar = value;
        });
      },
    );
  }

  SafeArea _homePage(double mediaqueryHeight, double mediaqueryWidth) {
    return SafeArea(
      child: SingleChildScrollView(
        child: SizedBox(
          height: mediaqueryHeight,
          width: mediaqueryWidth,
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
        ),
      ),
    );
  }

  Expanded _gridviewtopDestinations(
      double mediaqueryHeight, double mediaqueryWidth) {
    return Expanded(
      child: GridView.builder(
        itemCount: destinationsList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 0, mainAxisSpacing: 25),
        itemBuilder: (context, index) {
          final TopDestinations place = destinationsList[index];
          return Column(
            children: [
              Flexible(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return DetailPageDestinations(
                          place: place,
                        );
                      },
                    ));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    height: mediaqueryHeight / 4,
                    width: mediaqueryWidth,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                          image: NetworkImage(place.imageUrl),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
              ),
              Text(
                place.placeName,
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
          padding: const EdgeInsets.only(left: 20, top: 20, bottom: 23),
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
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      padding: const EdgeInsets.all(5),
      height: mediaqueryHeight / 7,
      width: mediaqueryWidth,
      //color: Colors.amber.shade100,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        CustomDestinationCategory(
          image: image1,
          text: "Forest",
        ),
        CustomDestinationCategory(image: image2, text: "Camping"),
        CustomDestinationCategory(image: image3, text: "Hiking"),
        CustomDestinationCategory(image: image4, text: "Mountain"),
        CustomDestinationCategory(image: image5, text: "Beach")
      ]),
    );
  }

  Container _search() {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 15, 20, 0),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextFormField(
        decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: const Icon(FeatherIcons.search),
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
              const SizedBox(
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
          const SizedBox(
            width: 140,
          ),
          Container(
            //margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
            height: mediaqueryHeight / 10,
            width: mediaqueryWidth / 8,
            decoration: const BoxDecoration(
                color: Colors.amber,
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "https://picsum.photos/seed/picsum/200/300"))),
          )
        ]);
  }
}

class CustomDestinationCategory extends StatelessWidget {
  final String image;
  final String text;
  const CustomDestinationCategory({
    required this.image,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Image(
            image: AssetImage(image),
            height: 45,
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              text,
              style: GoogleFonts.alegreya(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey.shade500),
            ),
          ),
        )
      ],
    );
  }
}
