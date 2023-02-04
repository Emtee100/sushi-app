import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/sushi_model.dart';

class SushiSalmon extends StatefulWidget {
  const SushiSalmon({super.key});

  @override
  State<SushiSalmon> createState() => _SushiSalmonState();
}

class _SushiSalmonState extends State<SushiSalmon> {
  List categories = [
    {"icon": FontAwesomeIcons.fish, "name": "Salmon"},
    {"icon": FontAwesomeIcons.fishFins, "name": "Caviar"},
    {"icon": FontAwesomeIcons.bowlRice, "name": "Rice"},
  ];

  List<int> quantity = [6, 12, 24];
  bool liked = false;
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 5),
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
                    onTap: () => print("Options clicked"),
                    child: Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: FaIcon(
                        FontAwesomeIcons.heart,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 30.0),
            //title, subtitle and rating
            Text(
              topSushi[1].title,
              style: GoogleFonts.montserrat(
                  fontSize: 25, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 10),
            Text(
              topSushi[1].description,
              style: GoogleFonts.montserrat(fontWeight: FontWeight.w500),
            ),
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
            Image.asset(topSushi[1].imageUrl),
            // quantity
            SizedBox(
              height: 25.0,
            ),
            Text(
              "Choose the quantity:",
              style: GoogleFonts.montserrat(
                fontSize: 15,
              ),
            ),
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
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
              margin: const EdgeInsets.symmetric(horizontal: 25.0),
              height: 110,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "\$${quantity[_selectedIndex] * 4}.00",
                          style: GoogleFonts.montserrat(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 31, 39, 53),
                          ),
                        ),
                        Text(
                          "Total Price",
                          style: GoogleFonts.montserrat(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () => print("Order placed"),
                      child: Container(
                          padding: EdgeInsets.all(20.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35.0),
                            color: Color.fromARGB(255, 31, 39, 53),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Place Order  ",
                                style: GoogleFonts.montserrat(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                              FaIcon(
                                FontAwesomeIcons.boxesPacking,
                                color: Colors.white,
                              )
                            ],
                          )),
                    )
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
