import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Homepage(),
      debugShowCheckedModeBanner: false,
    );
  }
}


String? stringResponce;
Map? mapResponce;
Map? dataResponce;
 class Homepage extends StatefulWidget {
   const Homepage({ Key? key }) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  
Future apicall() async{
http.Response response;
response= await http.get(Uri.parse('https://reqres.in/api/users/2'));
if(response.statusCode==200){
  setState((){
  // stringResponce=response.body;
  mapResponce=json.decode(response.body);
  dataResponce=mapResponce!['data'];

  });
}
}
   @override
   void initState(){
     apicall();
     super.initState();
   }
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         centerTitle: true,
         title: Text('Demo app'),
       ),
      body: Center(
        child: Container(
          height: 200,
          width: 300,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(child: dataResponce==null?Container(): Text( dataResponce!['first_name'].toString())),
        ),
      ),
       
     );
   }
}