import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class searchBar extends StatelessWidget {
  const searchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 8,
                          spreadRadius: 3,
                          offset: Offset(1, 8))
                    ],
                    color: Colors.white,
                  ),
                  child: TextField(
                    style: GoogleFonts.montserrat(),
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: "Search your sushi",
                        hintStyle: GoogleFonts.montserrat(),
                        border: InputBorder.none),
                  ),
                ));
  }
}