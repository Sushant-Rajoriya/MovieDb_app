import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:movie_db_app/my_tmdb_api/keys.dart';
import 'package:movie_db_app/screens/home_screen/my_widgets/movie_widget.dart';
import 'package:movie_db_app/screens/home_screen/my_widgets/top_bar.dart';
import 'package:movie_db_app/screens/movie_details/movie_details_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List trendingMovies = [];
  // late TMDB tmDbWithLogsConfig;
  @override
  void initState() {
    loadMovie();
    super.initState();
  }

  Future<void> loadMovie() async {
    /* tmDbWithLogsConfig = TMDB(
      ApiKeys(Keys.apiKey, Keys.readAccessToken),
      logConfig: ConfigLogger(
        showLogs: true,
        showErrorLogs: true,
      ),
    );
    Map trendingResult = await tmDbWithLogsConfig.v3.trending.getTrending();
    Map trendingResult1 =
        await tmDbWithLogsConfig.v3.search.queryMovies("Free Guy");
    // print(trendingResult1);
*/
    var trendingResult = await http.get(
      Uri.parse('${Keys.tmDbBasicPath}trending/all/day?api_key=${Keys.apiKey}'),
    );
    setState(() {
      trendingMovies = json.decode(trendingResult.body)['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopBar(name: "Shaan"),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Text(
                  "Feature Movies",
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                        color: Colors.white, letterSpacing: .5, fontSize: 20),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(8),
                scrollDirection: Axis.vertical,
                itemCount: trendingMovies.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MovieDetailsScreen(
                                movieName:
                                    trendingMovies[index]['title'] != null
                                        ? trendingMovies[index]['title']
                                        : 'Loading',
                                movieDiscP:
                                    trendingMovies[index]['overview'] != null
                                        ? trendingMovies[index]['overview']
                                        : 'Loading',
                                imagePath: Keys.imageBasicPath +
                                    trendingMovies[index]['poster_path'],
                                rating: trendingMovies[index]['vote_average']
                                    .toString(),
                              )));
                    },
                    child: MovieWidget(
                      imagePath: Keys.imageBasicPath +
                          trendingMovies[index]['poster_path'],
                      rating: trendingMovies[index]['vote_average'].toString(),
                      movieName: trendingMovies[index]['title'] != null
                          ? trendingMovies[index]['title']
                          : 'Loading',
                      deckP: trendingMovies[index]['overview'] != null
                          ? trendingMovies[index]['overview']
                          : 'Loading',
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
