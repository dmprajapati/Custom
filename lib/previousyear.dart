import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app5/main.dart';



import 'package:http/http.dart' as http;
import 'dart:ui';
import 'package:shared_preferences/shared_preferences.dart';

class previousyear extends StatefulWidget {
  @override
  _previousyear createState() => _previousyear();
}

class _previousyear extends State<previousyear> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int _selectedIndex=0;
  String id2= " ";
  List<dynamic> res;
  bool loading=true;
  void getFreePackages() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString('token');
    String id = pref.getString('id');
    final response = await http.post(
        "http://owlbridge.in/quiz/apis/test_free_exam",
        headers: {
          "Authorizations":"berer "+token,
          "id": id,
        }
    );

    print(json.decode(response.body));
    if (response.statusCode == 200) {

      res=json.decode(response.body);
      setState(() {
        loading=false;
      });

    }
    else{
      print("hi");
    }

  }


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  void showImfo2(double h,double w,int index){


    showDialog(
        context: context,
        builder: (context) {
          return Align(
            alignment: FractionalOffset.center,
            child:Container(
              height: 270,
              width: 300,
              margin: EdgeInsets.fromLTRB(0,h/13, 0, 0),
              child:Card(
                elevation: 5,
                child: Column(
                  children: [
                    // Center(child: Text("Previous 25 Year ",style: TextStyle(color: Colors.black,fontSize: 10,fontWeight:FontWeight.w400, fontFamily: 'design.graffiti.comicsansms'),),),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 0.5, 20, 0.5),
                      child:Center(
                        child: Text("id:"+res[index]['Exam']['id'].toString(),style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'design.graffiti.comicsansms'),),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 0.5, 20, 0.5),
                      child:Center(
                        child: Text("type:"+res[index]['Exam']['type'].toString(),style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'design.graffiti.comicsansms'),),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 0.5, 20, 0.5),
                      child:Center(
                        child: Text("name:"+res[index]['Exam']['name'].toString(),style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'design.graffiti.comicsansms'),),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 0.5, 20, 0.5),
                      child:Center(
                        child: Text("start_date:"+res[index]['Exam']['start_date'].toString(),style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'design.graffiti.comicsansms'),),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 0.5, 20, 0.5),
                      child:Center(
                        child: Text("end_date:"+res[index]['Exam']['end_date'].toString(),style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'design.graffiti.comicsansms'),),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 0.5, 20, 0.5),
                      child:Center(
                        child: Text("paid_exam:"+res[index]['Exam']['paid_exam'].toString(),style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'design.graffiti.comicsansms'),),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 0.5, 20, 0.5),
                      child:Center(
                        child: Text("amount:"+res[index]['Exam']['amount'].toString(),style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'design.graffiti.comicsansms'),),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 0.5, 20, 0.5),
                      child:Center(
                        child: Text("attempt_count:"+res[index]['Exam']['attempt_count'].toString(),style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'design.graffiti.comicsansms'),),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 0.5, 20, 0.5),
                      child:Center(
                        child: Text("attempt_count:"+res[index]['Exam']['attempt_count'].toString(),style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'design.graffiti.comicsansms'),),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 0.5, 20, 0.5),
                      child:Center(
                        child: Text("expiry:"+res[index]['Exam']['expiry'].toString(),style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'design.graffiti.comicsansms'),),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 0.5, 20, 0.5),
                      child:Center(
                        child: Text("attempt:"+res[index]['Exam']['attempt'].toString(),style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'design.graffiti.comicsansms'),),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 0.5, 20, 0.5),
                      child:Center(
                        child: Text("attempt_order:"+res[index]['Exam']['attempt_order'].toString(),style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'design.graffiti.comicsansms'),),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 0.5, 20, 0.5),
                      child:Center(
                        child: Text("fexpiry_date:"+res[index]['Exam']['fexpiry_date'].toString(),style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'design.graffiti.comicsansms'),),
                      ),
                    ),


                  ],
                ),
              ),
            ),
          );
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
  int t=0;
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

    if(t==0){
      getFreePackages();
      t=t+1;
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

        body: loading==false?Container(
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
                        child: Text(res.length.toString() +" Years Previous Papers",style: TextStyle(color: Colors.black, fontSize: 15,fontFamily: 'design.graffiti.comicsansms'),),

                      ),
                      Expanded(
                        child:Text(" "),
                      ),
                    ],
                  ),
                ),




                    Container(

                      width: width,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: res.length,
                        itemBuilder: (BuildContext context,int index) {
                          return Container(
                            child: Expanded(

                                    child:Column(
                                      children: [
                                        Container(
                                          height: 40,
                                          width: 60,
                                          margin: EdgeInsets.all(0.1),
                                          child: GestureDetector(
                                            onTap: () {
                                              showImfo2(hight,width,index);
                                            },
                                            child: Card(
                                              color: Colors.blue,
                                              child: Container(
                                                child: Center(
                                                  child:Text(res[index]['Exam']['name'],style: TextStyle(color: Colors.white,fontSize: 15,fontWeight:FontWeight.w400, fontFamily: 'design.graffiti.comicsansms'),),),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),

                            ),
                          );
                        }
                        ),
                    ),
                    /*Expanded(
                      child: Container(
                        height: 40,
                        margin: EdgeInsets.all(0.1),
                        child: GestureDetector(
                          onTap: () {
                            showImfo2(hight,width);
                          },
                          child: Card(
                            color: Colors.blue,
                            child: Container(
                              child: Center(
                                child:Text("2017",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight:FontWeight.w400, fontFamily: 'design.graffiti.comicsansms'),),),
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
                                child:Text("2018",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight:FontWeight.w400, fontFamily: 'design.graffiti.comicsansms'),),),
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
                                child:Text("2019",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight:FontWeight.w400, fontFamily: 'design.graffiti.comicsansms'),),),
                            ),
                          ),
                        ),
                      ),
                    ),*/




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

        ):Container(
          child:Text('Please wait..'),
        ),
      ),
    );
  }
}