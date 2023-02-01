import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi_app/models/sushi_model.dart';

class SushiOcto extends StatefulWidget {
  const SushiOcto({super.key});

  @override
  State<SushiOcto> createState() => _SushiOctoState();
}

class _SushiOctoState extends State<SushiOcto> {
  List categories = [
    {"icon": FontAwesomeIcons.fish, "name": "Salmon"},
    {"icon": FontAwesomeIcons.fishFins, "name": "Caviar"},
    {"icon": FontAwesomeIcons.bowlRice, "name": "Rice"},
  ];

  List<int> quantity = [6, 12, 24];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //bars icon
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: GestureDetector(
                    onTap: (() {
                      Navigator.pop(context);
                    }),
                    child: Container(
                      padding: const EdgeInsets.all(14),
                      decoration: const BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: const FaIcon(FontAwesomeIcons.arrowLeft),
                    ),
                  ),
                ),

                //heart icon
                Padding(
                  padding: const EdgeInsets.only(right: 25),
                  child: GestureDetector(
                    onTap: (() {
                      print("Options clicked");
                    }),
                    child: Container(
                      padding: EdgeInsets.all(14),
                      decoration: BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: FaIcon(FontAwesomeIcons.heart),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 30.0),
            //title, subtitle and rating
            Text(topSushi[0].title),
            SizedBox(height: 10),
            Text(topSushi[0].description),
            //rating
            SizedBox(height: 25),
            Text("⭐⭐⭐⭐"),

            // composition
            SizedBox(height: 25.0),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 35.0),
              height: 70.0,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(8, 12, 8, 8),
                          margin: const EdgeInsets.symmetric(horizontal: 28),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                          child: FaIcon(categories[index]["icon"],
                              color: Color.fromARGB(255, 31, 39, 53)),
                        ),
                        Text(categories[index]["name"]),
                      ],
                    );
                  }),
            ),

            // image
            SizedBox(
              height: 20.0,
            ),
            Image.asset(topSushi[0].imageUrl),
            // quantity
            SizedBox(
              height: 25.0,
            ),
            Text("Choose the quantity"),
            SizedBox(
              height: 20.0,
            ),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 25.0),
              height: 50.0,
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: quantity.length,
                  itemBuilder: ((context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 15.0),
                        padding: EdgeInsets.fromLTRB(12, 15, 10, 15),
                        decoration: BoxDecoration(
                            color: _selectedIndex == index
                                ? Color.fromARGB(255, 31, 39, 53)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(25.0)),
                        child: Text(
                          "${quantity[index]} units",
                          style: GoogleFonts.montserrat(
                              color: _selectedIndex == index
                                  ? Colors.white
                                  : Color.fromARGB(255, 31, 39, 53),
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    );
                  })),
            ),
            //place order
            SizedBox(
              height: 25.0,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(15)),
              margin: const EdgeInsets.symmetric(horizontal: 25.0),
              height: 110,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                Column(
                  children: [
                    Text("${quantity[_selectedIndex] * 4}.00"),
                    Text("Total Price")
                  ],
                ),
                Container(
                  decoration:
                      BoxDecoration(color: Color.fromARGB(255, 31, 39, 53)),
                  child: Text("Place Order"),
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
