import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:youtap/services/movie_service.dart';

import '../model/movie_model.dart';

class MovieDetailPage extends StatefulWidget {

  final String imageBg;
  final String imagePoster;
  final String title;
  final String overview;
  final String release_date;
  final String vote_average;
  final int id;

  MovieDetailPage({
    required this.imageBg,
    required this.imagePoster,
    required this.title,
    required this.overview,
    required this.release_date,
    required this.vote_average,
    required this.id,
  });

  @override
  MovieDetailState createState() {
    return MovieDetailState();
  }
}

class MovieDetailState extends State<MovieDetailPage> {

  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  List<dynamic> reviews = [];


  void getDetailMovie() async {

    await MovieService()
        .getDetailMovie(widget.id).then((value) {
      Movie movie = value.value;
      print(movie.results);
      setState(() {
        reviews = movie.results;
      });
    });

  }

  @override
  void initState() {
    super.initState();
    getDetailMovie();
  }



  @override
  Widget build(BuildContext context) {

    Widget getReviews(){
      List<Widget> list = <Widget>[];
      int count = 0;
      if(reviews.length < 5){
        count = reviews.length;
      }else{
        count = 5;
      }
      for(var i = 0; i < count; i++){
        list.add(
            Container(
              padding: EdgeInsets.only(top:10.0, bottom: 10.0),

              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        MdiIcons.accountCircle,
                        size: 50, //Icon Size
                        color: Color(0xFF1caed4),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            reviews[i]['author_details']['username'],
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w500
                            ),
                          ),
                          Text(
                            'Rating: ${reviews[i]['author_details']['rating'].toString()}',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w300
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Text(
                    reviews[i]['content'],
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w300
                    ),
                  ),
                ],
              ),
            )
        );
      }
      if(reviews.length != 0){
        return Column(children: list);
      }else{
        return Text(
          "There's no someone review yet!",
          textAlign: TextAlign.justify,
          style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w300
          ),
        );
      }
    }

    Widget widgetNya(){
      return Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Row(
                      children: [
                        Icon(
                          MdiIcons.chevronLeft,
                          size: 22, //Icon Size
                          color: Colors.black,
                        ),
                        Text(
                          'Back',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
            Container(
              constraints: BoxConstraints(
                  minHeight: 210, minWidth: double.infinity),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://image.tmdb.org/t/p/w1280${widget.imageBg}'),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.network(
                    'https://image.tmdb.org/t/p/w1280${widget.imagePoster}',
                    height: 200.0,
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    height: 200,
                    width: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w700
                          ),
                        ),
                        Text(
                          'Release Date: ${widget.release_date}',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w300
                          ),
                        ),
                        Text(
                          'Rating: ${widget.vote_average}',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w300
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
            Container(
                width: double.infinity,
                padding: EdgeInsets.all(10.0),
                color: Color(0xFF1caed4),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Overview:',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500
                      ),
                    ),
                    Text(
                      widget.overview != '' ? widget.overview : "There's no overview",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w300
                      ),
                    ),
                  ],
                )
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Reviews:',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  getReviews(),
                ],
              ),
            )

          ],
        ),

      );
    }

    if(reviews.length != 0){
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: SingleChildScrollView(
              child: widgetNya(),
            ),
          ),
        ),
      );
    }else{
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: widgetNya(),
          ),
        ),
      );
    }


  }
}

