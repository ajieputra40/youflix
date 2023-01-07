import 'dart:convert';
import 'dart:ffi';
import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:youtap/model/tv_model.dart';
import 'package:youtap/pages/tv_detail_page.dart';
import 'package:youtap/services/tv_service.dart';



class TvPage extends StatefulWidget {
  @override
   createState() {
    return TvState();
  }
}

class TvState extends State<TvPage> {

  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  List<dynamic> otaTV = [];
  List<dynamic> popularTV = [];
  bool isLoading = false;

  @override
  void initState(){
    super.initState();
    getTv();
  }

  void getTv() async {
    setState(() {
      isLoading = true;
    });
    await TvService()
        .getOtaTv().then((value) {
      Tv tv = value.value;
      setState(() {
        otaTV = tv.results;
        isLoading = false;
      });
    });

    await TvService()
        .getPopularTv().then((value) {
      Tv tv = value.value;
      setState(() {
        popularTV = tv.results;
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
                      'On The Air',
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
                    items: otaTV.map((i) {
                      var imageBg = i['backdrop_path'];
                      if(imageBg == null){
                        imageBg = '';
                      }
                      return GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    TvDetailPage(
                                        imageBg: imageBg,
                                        imagePoster: i['poster_path'],
                                        title: i['name'],
                                        overview: i['overview'],
                                        release_date: i['first_air_date'],
                                        vote_average: i['popularity'].toString(),
                                        id: i['id']
                                    ),
                              ),
                            );
                          },
                          child: i['backdrop_path'] != null ? Container(
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
                          )
                        :
                        Container(
                          constraints: BoxConstraints(
                              minHeight: 210, minWidth: double.infinity),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/bg_null.jpeg'),
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
                      items: popularTV.map((i) {
                        var imageBg = i['backdrop_path'];
                        if(imageBg == null){
                          imageBg = '';
                        }
                        return GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    TvDetailPage(
                                        imageBg: imageBg,
                                        imagePoster: i['poster_path'],
                                        title: i['name'],
                                        overview: i['overview'],
                                        release_date: i['first_air_date'],
                                        vote_average: i['popularity'].toString(),
                                        id: i['id']
                                    ),
                              ),
                            );
                          },
                          child: i['backdrop_path'] != null ? Container(
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
                          )
                              :
                          Container(
                            constraints: BoxConstraints(
                                minHeight: 210, minWidth: double.infinity),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/bg_null.jpeg'),
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
        ],
      ),
    );
  }
}
