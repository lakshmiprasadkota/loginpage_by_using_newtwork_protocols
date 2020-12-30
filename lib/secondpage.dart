import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';



class SecondPage extends StatefulWidget {
  SecondPage({this.username });
  final username ;
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10 ,vertical: 20),
        child: Column(
          children: [
            Text("${widget.username}")

          ],
        ),
      ),
    );
  }
}

















// class HomePage2 extends StatefulWidget {
//   @override
//   _HomePage2State createState() => _HomePage2State();
// }
// class _HomePage2State extends State<HomePage2> {
//   String data = "";
//   bool _fetching = true;
//
//   void getHttp() async {
//     setState(() {
//       _fetching = true;
//     });
//     try {
//       Response response = await Dio().post("https://networkintern.herokuapp.com/login",data: formdata);
//       setState(() {
//         data = response.data;
//         _fetching = false;
//       });
//     } catch (e) {
//       setState(() {
//         _fetching = false;
//       });
//       print(e);
//     }
//   }
//
//   @override
//
//
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Container(
//         child: Column(
//           children: [
//             RaisedButton(
//               onPressed: (){
//                 getHttp();
//               },
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
// FormData formdata= new FormData.fromMap({
//   "name":"jbdwjxh",
//   "password":2123
// });