import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ProfilePage extends StatefulWidget {
  @override
  ProfileState createState() {
    return ProfileState();
  }
}

class ProfileState extends State<ProfilePage> {

  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    Widget widgetNya(){
      return Container(
        padding: EdgeInsets.only(top: 50.0),
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left:10.0),
                          child: Text('Profile',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w700
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                        padding: EdgeInsets.only(top:20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: 20.0),
                                  child: FittedBox(
                                    fit: BoxFit.contain,
                                    alignment: Alignment.center,
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xFF1caed4),
                                      ),
                                      padding: EdgeInsets.all(15.0),
                                      child: Text('AP', style: TextStyle(color: Colors.white)),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 200,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding: EdgeInsets.only(top: 10.0),
                                            child: Text('Ajie Putra',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18.0,
                                                  fontFamily: 'Montserrat',
                                                  fontWeight: FontWeight.w700
                                              ),
                                            ),
                                          )
                                      ),
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child:Padding(
                                            padding: EdgeInsets.only(top: 10.0),
                                            child: Text('+6287821790323',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14.0,
                                                  fontFamily: 'Montserrat',
                                                  fontWeight: FontWeight.w300
                                              ),
                                            ),
                                          )
                                      ),
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding: EdgeInsets.only(top: 10.0),
                                            child: Text('ajieputra40@gmail.com',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14.0,
                                                  fontFamily: 'Montserrat',
                                                  fontWeight: FontWeight.w300
                                              ),
                                            ),
                                          )
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            InkWell(
                              splashColor: Colors.blue,
                              onTap: (){
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) =>
                                //   ),
                                // );
                              },
                              child: Icon(
                                MdiIcons.pencilOutline,
                                size: 22, //Icon Size
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        )
                    ),
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: LinearPercentIndicator(
                        animation: true,
                        lineHeight: 20.0,
                        animationDuration: 1000,
                        percent: 1.0,
                        center: Text(
                          "${90.0}%",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.0,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500
                          ),
                        ),
                        linearStrokeCap: LinearStrokeCap.roundAll,
                        progressColor: Color(0xFF1caed4),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: Colors.transparent,
                      minimumSize: const Size.fromHeight(50),
                      side: BorderSide(
                          width: 1.0,
                          color: Colors.red
                      ),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(4.0),
                      ),
                    ),
                    onPressed: (){

                    },
                    child: Text(
                      'Sign Out from My Account',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.red
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
      );
    }

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
