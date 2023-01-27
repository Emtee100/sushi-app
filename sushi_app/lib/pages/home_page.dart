import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi_app/pages/util/search_bar.dart';

import '../models/sushi_model.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List categories = [
    {"icon": FontAwesomeIcons.fish, "name": "Salmon"},
    {"icon": FontAwesomeIcons.fishFins, "name": "Caviar"},
    {"icon": FontAwesomeIcons.bowlRice, "name": "Rice"},
    {"icon": FontAwesomeIcons.octopusDeploy, "name": "Octopus"},
    {"icon": FontAwesomeIcons.shrimp, "name": "Shrimp"},
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: SafeArea(
            child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            // options button
            SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: GestureDetector(
                onTap: (() {
                  print("Options clicked");
                }),
                child: Container(
                  padding: EdgeInsets.all(14),
                  decoration: BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: FaIcon(FontAwesomeIcons.bars),
                ),
              ),
            ),

            SizedBox(height: 20),
            // greeting

            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Text(
                '👋Hi, Angel!',
                style: GoogleFonts.montserrat(
                    fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),

            SizedBox(height: 20),

            // main greeting
            Padding(
              padding: EdgeInsets.only(left: 25),
              child: Text(
                'What is your favorite sushi?',
                style: GoogleFonts.montserrat(
                    fontSize: 30, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(height: 20),

            // Search bar
            searchBar(),

            SizedBox(height: 20),
            // categories
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Categories",
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      fontSize: 25,
                    ),
                  ),
                  TextButton(
                      onPressed: () => print("See all"),
                      child: Text(
                        "See all",
                        style:
                            GoogleFonts.montserrat(fontWeight: FontWeight.w400),
                      ))
                ],
              ),
            ),
            SizedBox(height: 15),

            Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                height: 75.0,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedIndex = index;
                              });
                              print(_selectedIndex);
                            },
                            child: Container(
                              padding: const EdgeInsets.fromLTRB(8, 12, 8, 8),
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _selectedIndex == index
                                    ? Color.fromARGB(255, 31, 39, 53)
                                    : Colors.white,
                              ),
                              child: FaIcon(categories[index]["icon"],
                                  color: _selectedIndex == index
                                      ? Colors.white
                                      : Color.fromARGB(255, 31, 39, 53)),
                            ),
                          ),
                          Text(categories[index]["name"]),
                        ],
                      );
                    })),

            //top Sushi
            SizedBox(height: 15),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Top Sushi",
                      style: GoogleFonts.montserrat(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      )),
                  TextButton(
                      onPressed: () => print("See all"),
                      child: Text("See all",
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w400,
                          )))
                ],
              ),
            ),

            SizedBox(height: 2),

            Container(
              height: 215,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: topSushi.length,
                  itemBuilder: ((context, i) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      height: 215,
                      width: 154,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(topSushi[i].imageUrl),
                          Text(topSushi[i].title,
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w600,
                            fontSize: 15.0,
                            color: Color.fromARGB(255, 31, 39, 53)),
                          ),
                          Text(topSushi[i].description),
                          Text(topSushi[i].price),
                        ],
                      ),
                    );
                  })),
            )
          ]),
        )));
  }
}
