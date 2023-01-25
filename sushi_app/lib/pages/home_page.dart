import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi_app/pages/util/search_bar.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    List categories =[
    
  ];

  // Widget _buildCategory(int index) {
  //   return Container(
  //     height: 60.0,
  //     width: 60.0,
  //     decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
  //     child: Icon(categories[index]),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: SafeArea(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // options button
          SizedBox(height: 35),

          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: GestureDetector(
              onTap: (() {
                print("Options clicked");
              }),
              child: Container(
                padding: EdgeInsets.all(14),
                decoration:
                    BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                child: FaIcon(FontAwesomeIcons.bars),
              ),
            ),
          ),

          SizedBox(height: 25),
          // greeting

          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Text(
              '👋Hi, Angel!',
              style: GoogleFonts.montserrat(
                  fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ),

          SizedBox(height: 25),

          // main greeting
          Padding(
            padding: EdgeInsets.only(left: 25),
            child: Text(
              'What is your favorite sushi?',
              style: GoogleFonts.montserrat(
                  fontSize: 35, fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(height: 25),

          // Search bar
          searchBar(),

          SizedBox(height: 25),
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

          Row(
            children: [
              Container(
                decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                child: FaIcon(FontAwesomeIcons.fish),
              )
            ],
          )

          //top Sushi
        ])));
  }
}
