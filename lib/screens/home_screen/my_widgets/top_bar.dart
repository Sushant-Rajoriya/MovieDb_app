import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_db_app/screens/search_screen/search_screen.dart';

class TopBar extends StatelessWidget {
  final String name;

  const TopBar({
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Hello $name !",
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      color: Colors.white, letterSpacing: .5, fontSize: 20),
                ),
              ),
              Text(
                "Welcome to MovieDB app",
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      color: Colors.white60, letterSpacing: .5, fontSize: 14),
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SearchScreen()));
            },
            child: Hero(
              tag: "search",
              child: Icon(
                Icons.search,
                color: Colors.white60,
                size: 28.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
