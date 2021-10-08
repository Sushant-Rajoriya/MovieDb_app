import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie_db_app/my_tmdb_api/keys.dart';
import 'package:movie_db_app/screens/movie_details/movie_details_screen.dart';
import 'package:movie_db_app/screens/search_screen/search_movie_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List searchedMovie = [];

  Future<void> searchMovie(String name) async {
    var searchResult = await http.get(
      Uri.parse(
          '${Keys.tmDbBasicPath}search/movie?api_key=${Keys.apiKey}&query=$name'),
    );

    setState(() {
      searchedMovie = json.decode(searchResult.body)['results'];
      print(searchedMovie);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Hero(
                    tag: "search",
                    child: Icon(
                      Icons.arrow_back_ios_sharp,
                      color: Colors.black,
                      size: 28.0,
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      onSubmitted: (value) {
                        searchMovie(value);
                      },
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Enter Movie Name',
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  scrollDirection: Axis.vertical,
                  itemCount: searchedMovie.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => MovieDetailsScreen(
                                  movieName:
                                      searchedMovie[index]['title'] != null
                                          ? searchedMovie[index]['title']
                                          : 'Loading',
                                  movieDiscP:
                                      searchedMovie[index]['overview'] != null
                                          ? searchedMovie[index]['overview']
                                          : 'Loading',
                                  imagePath: Keys.imageBasicPath +
                                      searchedMovie[index]['poster_path'],
                                  rating: searchedMovie[index]['vote_average']
                                      .toString(),
                                )));
                      },
                      child: SearchMovieWidget(
                        imagePath: Keys.imageBasicPath +
                            searchedMovie[index]['poster_path'],
                        rating: searchedMovie[index]['vote_average'].toString(),
                        movieName: searchedMovie[index]['title'] != null
                            ? searchedMovie[index]['title']
                            : 'Loading',
                        deckP: searchedMovie[index]['overview'] != null
                            ? searchedMovie[index]['overview']
                            : 'Loading',
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
