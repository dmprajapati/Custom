
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dart:convert';
import 'dart:ui';
import 'ForgotPassword.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';


import 'HomePage.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main()async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.black,
    statusBarIconBrightness: Brightness.light,

  ));
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs2 = await SharedPreferences.getInstance();
  var status = prefs2.getInt('intval');
  var token = prefs2.getString('token');
  var id = prefs2.getString('id');
  if(status==1){
    final response = await http.get(
        "http://owlbridge.in/mobile/apis/getUser",
        headers: {
          "Authorizations":"berer "+token,
          "id": id,
        }

    );
    if(response.statusCode == 200){
      String res=json.decode(response.body).toString();
      if(res != "You are not authorized to access this."){
        runApp(MaterialApp( debugShowCheckedModeBanner:false,home:HomePage() ));
        //runApp(HomePage());
      }
      else{
        print('dvycdvg');
        runApp(MaterialApp( debugShowCheckedModeBanner:false,home:MyApp() ));
        //runApp(MyApp());
      }
    }
    print("fvvrrvvrw");
  }else{
    print('dvycdvg');
    runApp(MaterialApp( debugShowCheckedModeBanner:false,home:MyApp() ));
  }

}

/*class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new MyHomePage(),
    );
  }
}*/
class MyApp extends StatefulWidget {
  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  bool signin=true;

  TextEditingController remail =TextEditingController();
  String get _remail => remail.text;

  TextEditingController rname =TextEditingController();
  String get _rname => rname.text;

  TextEditingController rpassword =TextEditingController();
  String get _rpassword => rpassword.text;

  TextEditingController rrepassword =TextEditingController();
  String get _repassword => rrepassword.text;

  TextEditingController rcono =TextEditingController();
  String get _rcono => rcono.text;

  TextEditingController name =TextEditingController();
  String get uname => name.text;

  TextEditingController semail =TextEditingController();
  String get _semail=> semail.text;

  TextEditingController spassword =TextEditingController();
  String get _spassword => spassword.text;



  void insert_studentdata() async {
    final response = await http.post(
        "http://owlbridge.in/quiz/apis/register",
        body: {
          "email": _remail,
          "name":_rname,
          "phone":_rcono,
          //"photo":base64Image,
          "password":_rpassword,
        }
    );
    if (response.statusCode == 200) {
      setState(() {

      });
      print(json.decode(response.body));
      String code=json.decode(response.body);
      var a=code.split(' ');
      email_verification(a[5]);

    }
    else{
    }
  }
  void email_verification(String code) async {
    final response = await http.post(
        "http://owlbridge.in/quiz/apis/verifyEmail",
        body: {
          "reg_code": code.toString(),
        }
    );
    if (response.statusCode == 200) {
      print(json.decode(response.body));
      String data=json.decode(response.body);
      print(data);
      if(data == "Email verified successfully."){
        setState(() {
          signin=true;
        });
      }
    }
    else{
    }
  }
//List <String, dynamic> res=[];
  void login() async {
    final response = await http.post(
        "http://owlbridge.in/quiz/apis/login",
        body: {
          "email":_semail,
          "password":_spassword
        }
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> res=json.decode(response.body);
      /*if(response.body !='"Invalid E-mail or password"'){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return HomePage();
        }));
      }*/
      print(res);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', res["Token"]);
      await prefs.setString('id', res["Id"]);
      await prefs.setInt('intval', 1);
      print(prefs);
      if(prefs != ""){

        Navigator.push(context, MaterialPageRoute(builder: (context){
          return HomePage();
        }));
      }
      //getToken();
    }
    else{
      print("eroor");
    }
  }

  getToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString('token');
    String id = pref.getString('id');
    print(token);
    print(id);
  }


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
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body:Center(
            child:SingleChildScrollView(
              child: Container(
                width: width-50,
                //height: (hight*2)/3,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                ),
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                signin=true;
                              });
                            },
                            child:Container(
                              height: 40,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color:Colors.black,
                                  width: 2,
                                ),
                                color:signin==true? Colors.black:Colors.white,
                              ),
                              child:Center(
                                child:Text("Login",style: TextStyle(color: signin==true?Colors.white:Colors.black,fontSize: 20,fontWeight:FontWeight.w400, fontFamily: 'design.graffiti.comicsansms'),),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                signin=false;
                              });
                            },
                            child:Container(
                              height: 40,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color:Colors.black,
                                  width: 2,
                                ),
                                color:signin==true? Colors.white:Colors.black,
                              ),
                              child:Center(
                                child: Text("Register",style: TextStyle(color: signin==true?Colors.black:Colors.white, fontSize: 20,fontWeight:FontWeight.w400,fontFamily: 'design.graffiti.comicsansms'),),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    signin!=true?Container(
                      child:Column(
                        children: <Widget>[
                          Container(
                            height: hight/16,
                            decoration: new BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              shape: BoxShape.rectangle,
                              color: Colors.white,
                              border: new Border.all(
                                color: Colors.black,
                                width: .2,
                              ),
                            ),
                            margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                            padding: EdgeInsets.all(3),
                            child: Column(
                              children: <Widget>[
                                Expanded(
                                  child:  new TextField(
                                    controller: remail,
                                    textAlign: TextAlign.start,
                                    //textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: hight/45,
                                        //height: hight/50,
                                        color: Colors.black
                                    ),
                                    decoration: new InputDecoration(
                                      hintText: ' * Email',
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: hight/16,
                            decoration: new BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              shape: BoxShape.rectangle,
                              color: Colors.white,
                              border: new Border.all(
                                color: Colors.black,
                                width: .2,
                              ),
                            ),
                            margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                            padding: EdgeInsets.all(3),
                            child: Column(
                              children: <Widget>[
                                Expanded(
                                  child:  new TextField(
                                    controller: rname,
                                    textAlign: TextAlign.start,
                                    //textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: hight/45,
                                        //height: hight/50,
                                        color: Colors.black
                                    ),
                                    decoration: new InputDecoration(
                                      hintText: ' * Name',
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: hight/16,
                            decoration: new BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              shape: BoxShape.rectangle,
                              color: Colors.white,
                              border: new Border.all(
                                color: Colors.black,
                                width: .2,
                              ),
                            ),
                            margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                            padding: EdgeInsets.all(3),
                            child: Column(
                              children: <Widget>[
                                Expanded(
                                  child:  new TextField(
                                    controller: rpassword,
                                    obscureText: true,
                                    textAlign: TextAlign.start,
                                    //textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: hight/45,
                                        //height: hight/50,
                                        color: Colors.black
                                    ),
                                    decoration: new InputDecoration(
                                      hintText: ' * Password',
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: hight/16,
                            decoration: new BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              shape: BoxShape.rectangle,
                              color: Colors.white,
                              border: new Border.all(
                                color: Colors.black,
                                width: .2,
                              ),
                            ),
                            margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                            padding: EdgeInsets.all(3),
                            child: Column(
                              children: <Widget>[
                                Expanded(
                                  child:  new TextField(
                                    controller: rrepassword,
                                    obscureText: true,
                                    textAlign: TextAlign.start,
                                    //textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: hight/45,
                                        //height: hight/50,
                                        color: Colors.black
                                    ),
                                    decoration: new InputDecoration(
                                      hintText: ' * Re-Password',
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: hight/16,
                            decoration: new BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              shape: BoxShape.rectangle,
                              color: Colors.white,
                              border: new Border.all(
                                color: Colors.black,
                                width: .2,
                              ),
                            ),
                            margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                            padding: EdgeInsets.all(3),
                            child: Column(
                              children: <Widget>[
                                Expanded(
                                  child:  new TextField(
                                    controller: rcono,
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.start,
                                    //textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: hight/45,
                                        //height: hight/50,
                                        color: Colors.black
                                    ),
                                    decoration: new InputDecoration(
                                      hintText: ' * Mobile No',
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                            child: Row(
                              children: <Widget>[

                                Expanded(
                                  child: Container(
                                    height: hight/16,
                                    decoration: new BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      shape: BoxShape.rectangle,
                                      color: Colors.white,
                                      border: new Border.all(
                                        color: Colors.white,
                                        width: .2,
                                      ),
                                    ),
                                    child:Center(
                                      child:Text("Image Name"),
                                    ),
                                  ),
                                ),

                                GestureDetector(
                                  onTap: () {

                                  },
                                  child:Container(
                                    height: 40,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color:Colors.black,
                                        width: 2,
                                      ),
                                      color:Colors.black,
                                    ),
                                    child:Center(
                                      child:Text("Choose Image",style: TextStyle(color: Colors.white,fontSize: 13,fontWeight:FontWeight.w400, fontFamily: 'design.graffiti.comicsansms'),),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(20),
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2.0),
                              ),
                              onPressed:(){
                                insert_studentdata();
                              },
                              color: Colors.black,
                              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                              child:Center(
                                child: Text("Submit",style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'design.graffiti.comicsansms'),),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ):Container(
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: hight/16,
                            decoration: new BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              shape: BoxShape.rectangle,
                              color: Colors.white,
                              border: new Border.all(
                                color: Colors.black,
                                width: .2,
                              ),
                            ),
                            margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                            padding: EdgeInsets.all(3),
                            child: Column(
                              children: <Widget>[
                                Expanded(
                                  child:  new TextField(
                                    controller: semail,
                                    textAlign: TextAlign.start,
                                    //textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: hight/45,
                                        //height: hight/50,
                                        color: Colors.black
                                    ),
                                    decoration: new InputDecoration(
                                      hintText: ' * Email',
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: hight/16,
                            decoration: new BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              shape: BoxShape.rectangle,
                              color: Colors.white,
                              border: new Border.all(
                                color: Colors.black,
                                width: .2,
                              ),
                            ),
                            margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                            padding: EdgeInsets.all(3),
                            child: Column(
                              children: <Widget>[
                                Expanded(
                                  child:  new TextField(
                                    controller: spassword,
                                    obscureText: true,
                                    textAlign: TextAlign.start,
                                    //textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: hight/45,
                                        //height: hight/50,
                                        color: Colors.black
                                    ),
                                    decoration: new InputDecoration(
                                      hintText: ' * Password',
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 10, 20,0),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child:Text(" "),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context){
                                      return ForgotPassword();
                                    }));
                                  },
                                  child: Text("Forgot Password",style: TextStyle(color: Colors.blue, fontSize: 13,fontFamily: 'design.graffiti.comicsansms'),),
                                ),
                              ],
                            ),
                          ),

                          Container(
                            margin: EdgeInsets.fromLTRB(20, 20, 20,5),
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2.0),
                              ),
                              onPressed:(){
                                login();
                              },
                              color: Colors.black,
                              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                              child:Center(
                                child: Text("Log in",style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'design.graffiti.comicsansms'),),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(20, 0, 0,0),
                            child: Row(
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                  },
                                  child: Text("Re-Send Email Varification",style: TextStyle(color: Colors.blue, fontSize: 13,fontFamily: 'design.graffiti.comicsansms'),),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(20, 30, 0,0),
                            child: Row(
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      signin=false;
                                    });
                                  },
                                  child: Text("Don't have an account?",style: TextStyle(color: Colors.grey, fontSize: 13,fontFamily: 'design.graffiti.comicsansms'),),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(20, 10, 0,20),
                            child: Row(
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      signin=false;
                                    });
                                  },
                                  child: Text("New User? Create account",style: TextStyle(color: Colors.blue, fontSize: 13,fontFamily: 'design.graffiti.comicsansms'),),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
