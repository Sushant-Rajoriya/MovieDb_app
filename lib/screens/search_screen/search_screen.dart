import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          child: Row(
            children: [
              Hero(
                tag: "search",
                child: Icon(
                  Icons.search,
                  color: Colors.black,
                  size: 28.0,
                ),
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter Movie Name',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
