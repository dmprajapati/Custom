import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:flutter_app5/ResetPassword.dart';
import 'package:flutter_app5/main.dart';


import 'package:http/http.dart' as http;
import 'dart:ui';

import 'package:shared_preferences/shared_preferences.dart';
class yearupsc extends StatefulWidget {
  @override
  _yearupsc createState() => _yearupsc();
}

class _yearupsc extends State<yearupsc> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int _selectedIndex=0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  Future<void> cencal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('intval');
    prefs.remove('id');
    prefs.remove('token');
  }
  void showImfo(double h,double w){
    showDialog(
        context: context,
        builder: (context) {
          return Align(
            alignment: FractionalOffset.topRight,
            child:Container(
              height: 160,
              width: 250,
              margin: EdgeInsets.fromLTRB(0,h/13, 0, 0),
              child:Card(
                elevation: 5,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 0.5, 20, 0.5),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2),
                        ),
                        onPressed:(){

                        },
                        color: Colors.blue,
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child:Center(
                          child: Text("Myprofile",style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'design.graffiti.comicsansms'),),
                        ),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.fromLTRB(20, 0.5, 20, 0.5),

                      child: RaisedButton(

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2),
                        ),
                        onPressed:(){

                        },
                        color: Colors.blue,
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child:

                        Center(

                          child:  Text("CHANGE PASSWORD",style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'design.graffiti.comicsansms'),),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 0.5, 20, 0.5),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2),
                        ),
                        onPressed:(){

                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text('Aleart'),
                                  content: Text('Do you want to Logout'),
                                  actions: <Widget>[
                                    new FlatButton(
                                      child: new Text('Yes'),
                                      onPressed: () {
                                        cencal();
                                        Navigator.push(context, MaterialPageRoute(builder: (context){
                                          return MyApp();

                                        }));
                                      },
                                    ),
                                    new FlatButton(
                                      child: new Text('No'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    )
                                  ],
                                );
                              });

                        },
                        color: Colors.blue,
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child:Center(

                          child: Text("LOG OUT",style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'design.graffiti.comicsansms'),),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
  TextEditingController semail =TextEditingController();
  String get _semail=> semail.text;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery. of(context). size. width;
    double hight = MediaQuery. of(context). size. height;
    double space;
    double space_up;
    space = width / hight;
    space_up = space;
    if (hight < width) {
      space_up = space / 6;
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading:IconButton(icon: Icon(Icons.menu,color: Colors.black),
            tooltip: "Drawer",
            onPressed: () {
              _scaffoldKey.currentState.openDrawer();
            },
          ) ,
          title: Row(
            children: <Widget>[
              Image.asset('assets/final.png',
                height: 30,),
              SizedBox(width: 15),

            ],
          ),
          elevation: defaultTargetPlatform == TargetPlatform.android ? 5.0 : 5.0,

          actions: <Widget>[
            IconButton(
              onPressed:(){
              },
              icon: Icon(Icons.person,color: Colors.black),

            ),

            IconButton(
              onPressed:(){
                showImfo(hight,width);
              },
              icon: Icon(Icons.arrow_drop_down,color: Colors.black),
            )
          ],
        ),
        drawer:new Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(child: Container(
                child: Column(
                  children: <Widget>[
                    Material(
                      child: Container(
                        margin:EdgeInsets.fromLTRB(10, 10, 0, 0),
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: new AssetImage('assets/2.png'),
                                      fit: BoxFit.cover)
                              ),
                            ),
                            Text(" "),
                            Center(child: Text("Previous 25 Year ",style: TextStyle(color: Colors.black,fontSize: 10,fontWeight:FontWeight.w400, fontFamily: 'design.graffiti.comicsansms'),),),
                            Center(child: Text("Question Papers",style: TextStyle(color: Colors.black,fontSize: 10,fontWeight:FontWeight.w400, fontFamily: 'design.graffiti.comicsansms'),),),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),),

              ListTile(
                leading: Icon(Icons.home_outlined),
                title: Text("HOME"),
                trailing: Icon(Icons.keyboard_arrow_right_outlined),
              ),
              ListTile(
                leading: Icon(Icons.home_outlined),
                title: Text("DASHBOARD"),
                trailing: Icon(Icons.keyboard_arrow_right_outlined),
              ),
              ListTile(
                leading: Icon(Icons.shopping_cart),
                title: Text("BUY EXAM PACKAGES"),
                trailing: Icon(Icons.keyboard_arrow_right_outlined),
              ),
              ListTile(
                leading: Icon(Icons.event),
                title: Text("EXAM PACKAGES"),
                trailing: Icon(Icons.keyboard_arrow_right_outlined),
              ),
              ListTile(
                leading: Icon(Icons.home_outlined),
                title: Text("MY RESULT"),
                trailing: Icon(Icons.keyboard_arrow_right_outlined),
              ),
              ListTile(
                leading: Icon(Icons.subdirectory_arrow_left),
                title: Text("SUMMARY"),
                trailing: Icon(Icons.keyboard_arrow_right_outlined),
              ),
              ListTile(
                leading: Icon(Icons.bookmark),
                title: Text("BOOKMARKED QUESTIONS"),
                trailing: Icon(Icons.keyboard_arrow_right_outlined),
              ),
              ListTile(
                leading: Icon(Icons.event),
                title: Text("INCORRECT QUESTIONS"),
                trailing: Icon(Icons.keyboard_arrow_right_outlined),
              ),
              ListTile(
                leading: Icon(Icons.payment),
                title: Text("PAYMENT DETAILS"),
                trailing: Icon(Icons.keyboard_arrow_right_outlined),
              ),
              ListTile(
                leading: Icon(Icons.help_outline),
                title: Text("HELP"),
                trailing: Icon(Icons.keyboard_arrow_right_outlined),
              ),
              ListTile(
                leading: Icon(Icons.people),
                title: Text("ABOUT"),
                trailing: Icon(Icons.keyboard_arrow_right_outlined),
              ),
            ],
          ),
        ),
        bottomNavigationBar:  BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.unarchive,color:Colors.black),
              title: Text('Exam'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.payment,color:Colors.black),
              title: Text('Payment'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home,color:Colors.black),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.laptop,color:Colors.black),
              title: Text('Result'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.help_outline,color:Colors.black),
              title: Text('Help'),
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.deepPurpleAccent,
          onTap: _onItemTapped,
        ),

        body: Container(
          child: SingleChildScrollView(
            child: Column(
                children: <Widget> [
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 20, 20,5),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child:Text(" "),
                        ),
                        GestureDetector(
                          onTap: () {
                          },
                          child: Text("PRATIBHA UPSC CIVILS PRE-APP",style: TextStyle(color: Colors.black, fontSize: 17,fontFamily: 'design.graffiti.comicsansms'),),
                        ),
                        Expanded(
                          child:Text(" "),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 5, 20,20),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child:Text(""),
                        ),
                        GestureDetector(
                          onTap: () {
                          },
                          child: Text("(PREVIOUS 25 YEARS QUESTION PAPERS)",style: TextStyle(color: Colors.black, fontSize: 15,fontFamily: 'design.graffiti.comicsansms'),),
                        ),
                        Expanded(
                          child:Text(" "),
                        ),
                      ],
                    ),
                  ),
                  Row(
                  children: <Widget>[
                    Text("  "),
                    Expanded(
                      child: Container(
                        height: 40,
                        margin: EdgeInsets.all(0.1),
                        child: GestureDetector(
                          onTap: () {
                          },
                          child: Card(
                            color: Colors.blue,
                            child: Container(
                              child: Center(
                                child:Text("1995",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight:FontWeight.w400, fontFamily: 'design.graffiti.comicsansms'),),),
                            ),
                          ),
                        ),
                      ),
                    ),

                    Expanded(
                      child: Container(
                        height: 40,
                        margin: EdgeInsets.all(0.1),
                        child: GestureDetector(
                          onTap: () {
                          },
                          child: Card(
                            color: Colors.blue,
                            child: Container(
                              child: Center(
                                child:Text("1995",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight:FontWeight.w400, fontFamily: 'design.graffiti.comicsansms'),),),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 40,
                        margin: EdgeInsets.all(0.1),
                        child: GestureDetector(
                          onTap: () {
                          },
                          child: Card(
                            color: Colors.blue,
                            child: Container(
                              child: Center(
                                child:Text("1995",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight:FontWeight.w400, fontFamily: 'design.graffiti.comicsansms'),),),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 40,
                        margin: EdgeInsets.all(0.1),
                        child: GestureDetector(
                          onTap: () {
                          },
                          child: Card(
                            color: Colors.blue,
                            child: Container(
                              child: Center(
                                child:Text("1995",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight:FontWeight.w400, fontFamily: 'design.graffiti.comicsansms'),),),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 40,
                        margin: EdgeInsets.all(0.1),
                        child: GestureDetector(
                          onTap: () {
                          },
                          child: Card(
                            color: Colors.blue,
                            child: Container(
                              child: Center(
                                child:Text("1995",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight:FontWeight.w400, fontFamily: 'design.graffiti.comicsansms'),),),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 40,
                        margin: EdgeInsets.all(0.1),
                        child: GestureDetector(
                          onTap: () {
                          },
                          child: Card(
                            color: Colors.blue,
                            child: Container(
                              child: Center(
                                child:Text("1995",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight:FontWeight.w400, fontFamily: 'design.graffiti.comicsansms'),),),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Text("  "),
                  ],
              ),
                  Row(
                    children: <Widget>[
                      Text("  "),
                      Expanded(
                        child: Container(
                          height: 40,
                          margin: EdgeInsets.all(0.1),
                          child: GestureDetector(
                            onTap: () {
                            },
                            child: Card(
                              color: Colors.blue,
                              child: Container(
                                child: Center(
                                  child:Text("1995",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight:FontWeight.w400, fontFamily: 'design.graffiti.comicsansms'),),),
                              ),
                            ),
                          ),
                        ),
                      ),

                      Expanded(
                        child: Container(
                          height: 40,
                          margin: EdgeInsets.all(0.1),
                          child: GestureDetector(
                            onTap: () {
                            },
                            child: Card(
                              color: Colors.blue,
                              child: Container(
                                child: Center(
                                  child:Text("1995",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight:FontWeight.w400, fontFamily: 'design.graffiti.comicsansms'),),),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 40,
                          margin: EdgeInsets.all(0.1),
                          child: GestureDetector(
                            onTap: () {
                            },
                            child: Card(
                              color: Colors.blue,
                              child: Container(
                                child: Center(
                                  child:Text("1995",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight:FontWeight.w400, fontFamily: 'design.graffiti.comicsansms'),),),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 40,
                          margin: EdgeInsets.all(0.1),
                          child: GestureDetector(
                            onTap: () {
                            },
                            child: Card(
                              color: Colors.blue,
                              child: Container(
                                child: Center(
                                  child:Text("1995",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight:FontWeight.w400, fontFamily: 'design.graffiti.comicsansms'),),),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 40,
                          margin: EdgeInsets.all(0.1),
                          child: GestureDetector(
                            onTap: () {
                            },
                            child: Card(
                              color: Colors.blue,
                              child: Container(
                                child: Center(
                                  child:Text("1995",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight:FontWeight.w400, fontFamily: 'design.graffiti.comicsansms'),),),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 40,
                          margin: EdgeInsets.all(0.1),
                          child: GestureDetector(
                            onTap: () {
                            },
                            child: Card(
                              color: Colors.blue,
                              child: Container(
                                child: Center(
                                  child:Text("1995",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight:FontWeight.w400, fontFamily: 'design.graffiti.comicsansms'),),),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Text("  "),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text("  "),
                      Expanded(
                        child: Container(
                          height: 40,
                          margin: EdgeInsets.all(0.1),
                          child: GestureDetector(
                            onTap: () {
                            },
                            child: Card(
                              color: Colors.blue,
                              child: Container(
                                child: Center(
                                  child:Text("1995",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight:FontWeight.w400, fontFamily: 'design.graffiti.comicsansms'),),),
                              ),
                            ),
                          ),
                        ),
                      ),

                      Expanded(
                        child: Container(
                          height: 40,
                          margin: EdgeInsets.all(0.1),
                          child: GestureDetector(
                            onTap: () {
                            },
                            child: Card(
                              color: Colors.blue,
                              child: Container(
                                child: Center(
                                  child:Text("1995",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight:FontWeight.w400, fontFamily: 'design.graffiti.comicsansms'),),),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 40,
                          margin: EdgeInsets.all(0.1),
                          child: GestureDetector(
                            onTap: () {
                            },
                            child: Card(
                              color: Colors.blue,
                              child: Container(
                                child: Center(
                                  child:Text("1995",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight:FontWeight.w400, fontFamily: 'design.graffiti.comicsansms'),),),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 40,
                          margin: EdgeInsets.all(0.1),
                          child: GestureDetector(
                            onTap: () {
                            },
                            child: Card(
                              color: Colors.blue,
                              child: Container(
                                child: Center(
                                  child:Text("1995",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight:FontWeight.w400, fontFamily: 'design.graffiti.comicsansms'),),),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 40,
                          margin: EdgeInsets.all(0.1),
                          child: GestureDetector(
                            onTap: () {
                            },
                            child: Card(
                              color: Colors.blue,
                              child: Container(
                                child: Center(
                                  child:Text("1995",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight:FontWeight.w400, fontFamily: 'design.graffiti.comicsansms'),),),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 40,
                          margin: EdgeInsets.all(0.1),
                          child: GestureDetector(
                            onTap: () {
                            },
                            child: Card(
                              color: Colors.blue,
                              child: Container(
                                child: Center(
                                  child:Text("1995",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight:FontWeight.w400, fontFamily: 'design.graffiti.comicsansms'),),),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Text("  "),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text("  "),
                      Expanded(
                        child: Text(" "),
                      ),

                      Expanded(
                        child: Container(
                          height: 40,
                          margin: EdgeInsets.all(0.1),
                          child: GestureDetector(
                            onTap: () {
                            },
                            child: Card(
                              color: Colors.blue,
                              child: Container(
                                child: Center(
                                  child:Text("1995",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight:FontWeight.w400, fontFamily: 'design.graffiti.comicsansms'),),),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 40,
                          margin: EdgeInsets.all(0.1),
                          child: GestureDetector(
                            onTap: () {
                            },
                            child: Card(
                              color: Colors.blue,
                              child: Container(
                                child: Center(
                                  child:Text("1995",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight:FontWeight.w400, fontFamily: 'design.graffiti.comicsansms'),),),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 40,
                          margin: EdgeInsets.all(0.1),
                          child: GestureDetector(
                            onTap: () {
                            },
                            child: Card(
                              color: Colors.blue,
                              child: Container(
                                child: Center(
                                  child:Text("1995",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight:FontWeight.w400, fontFamily: 'design.graffiti.comicsansms'),),),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 40,
                          margin: EdgeInsets.all(0.1),
                          child: GestureDetector(
                            onTap: () {
                            },
                            child: Card(
                              color: Colors.blue,
                              child: Container(
                                child: Center(
                                  child:Text("1995",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight:FontWeight.w400, fontFamily: 'design.graffiti.comicsansms'),),),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(" "),
                      ),
                      Text("  "),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 5, 20,20),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child:Text(""),
                        ),
                        GestureDetector(
                          onTap: () {
                          },
                          child: Text("*CLICK ON YEAR TO START YOUR EXAM",style: TextStyle(color: Colors.black, fontSize: 15,fontFamily: 'design.graffiti.comicsansms'),),
                        ),
                        Expanded(
                          child:Text(" "),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 140,
                    height: 140,
                    margin: EdgeInsets.fromLTRB(20, 5, 20,20),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child:Text(""),
                        ),
                        GestureDetector(
                          onTap: () {
                          },
                          child: Image.asset("assets/trophy.jpg")
                        ),
                        Expanded(
                          child:Text(" "),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 0.5, 20, 0.5),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2),
                      ),
                      onPressed:(){

                      },
                      color: Colors.blue,
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child:Center(
                        child: Text("Create Your Own Question Paper",style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'design.graffiti.comicsansms'),),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 0.5, 20, 0.5),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2),
                      ),
                      onPressed:(){

                      },
                      color: Colors.blue,
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child:Center(
                        child: Text("Crete Practice Session",style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'design.graffiti.comicsansms'),),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 0.5, 20, 0.5),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2),
                      ),
                      onPressed:(){

                      },
                      color: Colors.blue,
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child:Center(
                        child: Text("Review Your Performance",style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'design.graffiti.comicsansms'),),
                      ),
                    ),
                  ),
               ],
            ),
          ),

        ),
      ),
    );
  }
}