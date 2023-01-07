import 'dart:convert';
import 'dart:ffi';
import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:youtap/pages/movie_detail_page.dart';
import 'package:youtap/services/movie_service.dart';
import '../model/movie_model.dart';
import 'home_page.dart';
import 'package:http/http.dart' as http;



class MoviesPage extends StatefulWidget {
  @override
   createState() {
    return MoviesState();
  }
}

class MoviesState extends State<MoviesPage> {

  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  List<dynamic> upcomingMovies = [];
  List<dynamic> popularMovies = [];
  List<dynamic> nowPlayingMovies = [];

  bool isLoading = false;


  @override
  void initState(){
    super.initState();
    getMovie();
  }

  void getMovie() async {
    setState(() {
      isLoading = true;
    });
    await MovieService()
        .getUpcomingMovie().then((value) {
      Movie movie = value.value;
      setState(() {
        upcomingMovies = movie.results;
        isLoading = false;
      });
    });

    await MovieService()
        .getNowPlayingMovie().then((value) {
      Movie movie = value.value;
      setState(() {
        nowPlayingMovies = movie.results;
      });
    });

    await MovieService()
        .getPopularMovie().then((value) {
      Movie movie = value.value;
      setState(() {
        popularMovies = movie.results;
      });
    });
  }




  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Center(
            child: widgetNya(),
          ),
        )
    );
  }


  Widget widgetNya(){
    return isLoading ? Center(
      child: CircularProgressIndicator(),
    ) : SingleChildScrollView(
      padding: EdgeInsets.only(top:50.0),
      child: Column(
        children: [
          Container(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Now Playing',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 24.0,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w700
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top:30.0, bottom: 30.0),
                  child: CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: true,
                      aspectRatio: 1.5,
                      enlargeCenterPage: true,
                    ),
                    items: nowPlayingMovies.map((i) {
                      return GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    MovieDetailPage(
                                        imageBg: i['backdrop_path'],
                                        imagePoster: i['poster_path'],
                                        title: i['title'],
                                        overview: i['overview'],
                                        release_date: i['release_date'],
                                        vote_average: i['vote_average'].toString(),
                                        id: i['id']
                                    ),
                              ),
                            );
                          },
                          child: Container(
                            constraints: BoxConstraints(
                                minHeight: 210, minWidth: double.infinity),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage('https://image.tmdb.org/t/p/w1280'+i['backdrop_path']),
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                            child: ClipRRect(
                              // make sure we apply clip it properly
                              child: BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                                child: Container(
                                  alignment: Alignment.center,
                                  color: Colors.white.withOpacity(0.1),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.teal,
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black,
                                          blurRadius: 10,
                                          offset: Offset(0, 0), // Shadow position
                                        ),
                                      ],
                                    ),
                                    child: Image.network('https://image.tmdb.org/t/p/w1280'+i['poster_path']),
                                  ),
                                ),
                              ),
                            ),
                          ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            )
          ),
          Container(
            color: Color(0xFF1caed4),
            child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Upcoming',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w700
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top:30.0, bottom: 30.0),
                    child: CarouselSlider(
                      options: CarouselOptions(
                        autoPlay: true,
                        aspectRatio: 1.5,
                        enlargeCenterPage: true,
                      ),
                      items: upcomingMovies.map((i) {
                        return GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    MovieDetailPage(
                                        imageBg: i['backdrop_path'],
                                        imagePoster: i['poster_path'],
                                        title: i['title'],
                                        overview: i['overview'],
                                        release_date: i['release_date'],
                                        vote_average: i['vote_average'].toString(),
                                        id: i['id']
                                    ),
                              ),
                            );
                          },
                          child: Container(
                            constraints: BoxConstraints(
                                minHeight: 210, minWidth: double.infinity),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage('https://image.tmdb.org/t/p/w1280'+i['backdrop_path']),
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                            child: ClipRRect(
                              // make sure we apply clip it properly
                              child: BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                                child: Container(
                                  alignment: Alignment.center,
                                  color: Color(0xFF1caed4).withOpacity(0.1),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.teal,
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black,
                                          blurRadius: 10,
                                          offset: Offset(0, 0), // Shadow position
                                        ),
                                      ],
                                    ),
                                    child: Image.network('https://image.tmdb.org/t/p/w1280'+i['poster_path']),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              )
          ),
          Container(
              // color: Color(0xFF1caed4),
              color: Colors.red,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Popular',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w700
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top:30.0, bottom: 30.0),
                    child: CarouselSlider(
                      options: CarouselOptions(
                        autoPlay: true,
                        aspectRatio: 1.5,
                        enlargeCenterPage: true,
                      ),
                      items: popularMovies.map((i) {
                        return GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    MovieDetailPage(
                                        imageBg: i['backdrop_path'],
                                        imagePoster: i['poster_path'],
                                        title: i['title'],
                                        overview: i['overview'],
                                        release_date: i['release_date'],
                                        vote_average: i['vote_average'].toString(),
                                        id: i['id']
                                    ),
                              ),
                            );
                          },
                          child: Container(
                            constraints: BoxConstraints(
                                minHeight: 210, minWidth: double.infinity),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage('https://image.tmdb.org/t/p/w1280'+i['backdrop_path']),
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                            child: ClipRRect(
                              // make sure we apply clip it properly
                              child: BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                                child: Container(
                                  alignment: Alignment.center,
                                  color: Colors.red.withOpacity(0.1),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.teal,
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black,
                                          blurRadius: 10,
                                          offset: Offset(0, 0), // Shadow position
                                        ),
                                      ],
                                    ),
                                    child: Image.network('https://image.tmdb.org/t/p/w1280'+i['poster_path']),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              )
          ),
        ],
      ),
    );
  }
}
