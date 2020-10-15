
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app5/main.dart';
import 'package:flutter_app5/previousyear.dart';
import 'package:flutter_app5/yearupsc.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {


  String email = " ",name = " ";

  void usergetdata() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString('token');
    String id = pref.getString('id');
    final response = await http.get(
        "http://owlbridge.in/mobile/apis/getUser",
        headers: {
          "Authorizations":"berer "+token,
          "id": id,
        }

    );
    print(json.decode(response.body));
    if (response.statusCode == 200) {
      Map<String, dynamic> res=json.decode(response.body);
      setState(() {
        email = res["email"].toString();
        name = res["name"].toString();
      });
      print(email);
      print(name);
    }
    else{
      print("hi");
    }
  }
  Future<void> cencal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('intval');
    prefs.remove('id');
    prefs.remove('token');
  }






  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int _selectedIndex=0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
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
  int t = 0;

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
    if(t == 0){
      usergetdata();

      t= t+1;
    }
    return WillPopScope(

      onWillPop: () async {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Aleart'),
                content: Text('Do you want to Exit'),
                actions: <Widget>[
                  new FlatButton(
                    child: new Text('Yes'),
                    onPressed: () {
                      SystemNavigator.pop();
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

        return false;
      },
      child:MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          key: _scaffoldKey,
          backgroundColor: Colors.white,
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
          drawer: new Drawer(
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
                              Text(". "),
                              Center(child: Text(email,style: TextStyle(color: Colors.black,fontSize: 10,fontWeight:FontWeight.w400, fontFamily: 'design.graffiti.comicsansms'),),),
                              Center(child: Text(name,style: TextStyle(color: Colors.black,fontSize: 10,fontWeight:FontWeight.w400, fontFamily: 'design.graffiti.comicsansms'),),),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),),

                ListTile(
                  leading: Icon(Icons.home),
                  title: Text("HOME"),
                  trailing: Icon(Icons.arrow_right),
                ),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text("DASHBOARD"),
                  trailing: Icon(Icons.arrow_right),
                ),
                ListTile(
                  leading: Icon(Icons.shopping_cart),
                  title: Text("BUY EXAM PACKAGES"),
                  trailing: Icon(Icons.arrow_right),
                ),
                ListTile(
                  leading: Icon(Icons.event),
                  title: Text("EXAM PACKAGES"),
                  trailing: Icon(Icons.arrow_right),
                ),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text("MY RESULT"),
                  trailing: Icon(Icons.arrow_right),
                ),
                ListTile(
                  leading: Icon(Icons.subdirectory_arrow_left),
                  title: Text("SUMMARY"),
                  trailing: Icon(Icons.arrow_right),
                ),
                ListTile(
                  leading: Icon(Icons.bookmark),
                  title: Text("BOOKMARKED QUESTIONS"),
                  trailing: Icon(Icons.arrow_right),
                ),
                ListTile(
                  leading: Icon(Icons.event),
                  title: Text("INCORRECT QUESTIONS"),
                  trailing: Icon(Icons.arrow_right),
                ),
                ListTile(
                  leading: Icon(Icons.payment),
                  title: Text("PAYMENT DETAILS"),
                  trailing: Icon(Icons.arrow_right),
                ),
                ListTile(
                  leading: Icon(Icons.help_outline),
                  title: Text("HELP"),
                  trailing: Icon(Icons.arrow_right),
                ),
                ListTile(
                  leading: Icon(Icons.people),
                  title: Text("ABOUT"),
                  trailing: Icon(Icons.arrow_right),
                ),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
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

          body:Container(
            width: width,
            color: Colors.grey[200],
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0,10),
                    child:CarouselSlider(items: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0.0),
                          image: DecorationImage(image: AssetImage('assets/n1.png'),fit: BoxFit.cover),
                        ),),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0.0),
                          image: DecorationImage(image: AssetImage('assets/o1.png'),fit: BoxFit.cover),
                        ),),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0.0),
                          image: DecorationImage(image: AssetImage('assets/p1.png'),fit: BoxFit.cover),
                        ),),
                    ],
                        options: CarouselOptions(aspectRatio: 16/9,height: hight/3,autoPlay: true,autoPlayCurve: Curves.fastLinearToSlowEaseIn,enableInfiniteScroll: true,autoPlayAnimationDuration: Duration(milliseconds: 800),viewportFraction: 1)),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          height: 110,
                          margin: EdgeInsets.all(3),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return previousyear();
                              }));
                            },
                            child: Card(
                              child: Container(
                                margin:EdgeInsets.all(10),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: new AssetImage('assets/1.png'),
                                              fit: BoxFit.cover)
                                      ),
                                    ),
                                    Text(" "),
                                    Center(child: Text("3 year UPSC ",style: TextStyle(color: Colors.black,fontSize: 10,fontWeight:FontWeight.w400, fontFamily: 'design.graffiti.comicsansms'),),),
                                    Center(child: Text("Questions Papers",style: TextStyle(color: Colors.black,fontSize: 10,fontWeight:FontWeight.w400, fontFamily: 'design.graffiti.comicsansms'),),),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 110,
                          margin: EdgeInsets.all(3),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return yearupsc();
                              }));
                            },
                            child: Card(
                              child: Container(
                                margin:EdgeInsets.all(10),
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
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 110,
                          margin: EdgeInsets.all(3),
                          child: GestureDetector(
                            onTap: () {
                            },
                            child: Card(
                              child: Container(
                                margin:EdgeInsets.all(10),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: new AssetImage('assets/3.png'),
                                              fit: BoxFit.cover)
                                      ),
                                    ),
                                    Text(" "),
                                    Center(child: Text("All India Mock",style: TextStyle(color: Colors.black,fontSize: 10,fontWeight:FontWeight.w400, fontFamily: 'design.graffiti.comicsansms'),),),
                                    Center(child: Text("Test",style: TextStyle(color: Colors.black,fontSize: 10,fontWeight:FontWeight.w400, fontFamily: 'design.graffiti.comicsansms'),),),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          height: 110,
                          margin: EdgeInsets.all(3),
                          child: GestureDetector(
                            onTap: () {
                            },
                            child: Card(
                              child: Container(
                                margin:EdgeInsets.all(10),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: new AssetImage('assets/4.png'),
                                              fit: BoxFit.cover)
                                      ),
                                    ),
                                    Text(" "),
                                    Center(child: Text("Review",style: TextStyle(color: Colors.black,fontSize: 10,fontWeight:FontWeight.w400, fontFamily: 'design.graffiti.comicsansms'),),),
                                    Center(child: Text("Bookmarks",style: TextStyle(color: Colors.black,fontSize: 10,fontWeight:FontWeight.w400, fontFamily: 'design.graffiti.comicsansms'),),),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 110,
                          margin: EdgeInsets.all(3),
                          child: GestureDetector(
                            onTap: () {
                            },
                            child: Card(
                              child: Container(
                                margin:EdgeInsets.all(10),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: new AssetImage('assets/5.png'),
                                              fit: BoxFit.cover)
                                      ),
                                    ),
                                    Text(" "),
                                    Center(child: Text("Attempt Incorrect",style: TextStyle(color: Colors.black,fontSize: 10,fontWeight:FontWeight.w400, fontFamily: 'design.graffiti.comicsansms'),),),
                                    Center(child: Text("Questions",style: TextStyle(color: Colors.black,fontSize: 10,fontWeight:FontWeight.w400, fontFamily: 'design.graffiti.comicsansms'),),),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 110,
                          margin: EdgeInsets.all(3),
                          child: GestureDetector(
                            onTap: () {
                            },
                            child: Card(
                              child: Container(
                                margin:EdgeInsets.all(10),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: new AssetImage('assets/6.png'),
                                              fit: BoxFit.cover)
                                      ),
                                    ),
                                    Text(" "),
                                    Center(child: Text("Perfomance",style: TextStyle(color: Colors.black,fontSize: 10,fontWeight:FontWeight.w400, fontFamily: 'design.graffiti.comicsansms'),),),
                                    Center(child: Text("Summery",style: TextStyle(color: Colors.black,fontSize: 10,fontWeight:FontWeight.w400, fontFamily: 'design.graffiti.comicsansms'),),),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child:Text(" "),
                      ),
                      Container(
                        width: (width-18)/3,
                        height: 110,
                        margin: EdgeInsets.all(3),
                        child: GestureDetector(
                          onTap: () {
                          },
                          child: Card(
                            child: Container(
                              margin:EdgeInsets.all(10),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: new AssetImage('assets/7.png'),
                                            fit: BoxFit.cover)
                                    ),
                                  ),
                                  Text(" "),
                                  Center(child: Text("Critical Thinking ",style: TextStyle(color: Colors.black,fontSize: 10,fontWeight:FontWeight.w400, fontFamily: 'design.graffiti.comicsansms'),),),
                                  //Center(child: Text("Questions Papers",style: TextStyle(color: Colors.black,fontSize: 10,fontWeight:FontWeight.w400, fontFamily: 'design.graffiti.comicsansms'),),),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: (width-18)/3,
                        height: 110,
                        margin: EdgeInsets.all(3),
                        child: GestureDetector(
                          onTap: () {
                          },
                          child: Card(
                            child: Container(
                              margin:EdgeInsets.all(10),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: new AssetImage('assets/8.png'),
                                            fit: BoxFit.cover)
                                    ),
                                  ),
                                  Text(" "),
                                  Center(child: Text("Review Problems",style: TextStyle(color: Colors.black,fontSize: 10,fontWeight:FontWeight.w400, fontFamily: 'design.graffiti.comicsansms'),),),
                                  //Center(child: Text("Question Papers",style: TextStyle(color: Colors.black,fontSize: 10,fontWeight:FontWeight.w400, fontFamily: 'design.graffiti.comicsansms'),),),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child:Text(" "),
                      ),


                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

  }
}