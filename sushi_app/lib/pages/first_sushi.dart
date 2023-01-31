import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sushi_app/models/sushi_model.dart';

class SushiOcto extends StatelessWidget {
  SushiOcto({super.key});
  List categories = [
    {"icon": FontAwesomeIcons.fish, "name": "Salmon"},
    {"icon": FontAwesomeIcons.fishFins, "name": "Caviar"},
    {"icon": FontAwesomeIcons.bowlRice, "name": "Rice"},
  ];
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
                      padding: EdgeInsets.all(14),
                      decoration: BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: FaIcon(FontAwesomeIcons.arrowLeft),
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
            SizedBox(height: 20.0,),
            Image.asset(topSushi[0].imageUrl),
            // quantity

            //place order
          ],
        ),
      ),
    );
  }
}
