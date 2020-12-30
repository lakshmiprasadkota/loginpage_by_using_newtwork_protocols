import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:networkloginpage/secondpage.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  String data = " ";
  String user = " ";String message = " "; bool status ;
  bool hidepassword = false;
  final personController  = TextEditingController();
   final passController = TextEditingController();
   String  username;
   String pass;


  void getHttp() async {
    try {

      Response response = await Dio(BaseOptions( validateStatus: (_)=>true,)).post(
          'https://networkintern.herokuapp.com/login',
          data: {"username": username, "password": pass});


      print(" ${response.data["message"]}");
      setState(() {
      user = response.data["user"];
        message = response.data["message"];
        status = response.data["status"];
        pass = passController.text;
       username = personController.text;
        data = jsonEncode(response.data);
      });
    } catch (e) {
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    var response;
    return Scaffold(

      body: Container(
        padding: EdgeInsets.symmetric(vertical: 40),
        child: Column(
          children: [
            SizedBox(height: 40,),
            Padding(

              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: personController,
                keyboardType: TextInputType.text,

                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                    labelText: 'UserName',
                   ),
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: passController,
                onSubmitted: (input)=> response.password= input,
                obscureText: hidepassword,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                        onPressed: (){
                          setState(() {
                            hidepassword= !hidepassword;
                          });
                        },
                        icon:Icon(hidepassword?Icons.visibility_off:Icons.visibility)
                    ),
                    labelText: 'password',
                   ),
              ),
            ),
            RaisedButton(
                child: Text("login"),
                onPressed:(){
                  setState(() {
                    getHttp();
                    if(status){
                      return Navigator.push(context, MaterialPageRoute(builder: (context)=> SecondPage(username: user,)));
                    }
                    return   Text(" ${message}" );

                  });
                }
            ),

          ],
        ),
      ),
    );
  }
}