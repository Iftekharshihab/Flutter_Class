import 'package:flutter/material.dart';
import 'package:flutter_class/screen/date_image.dart';
import 'package:flutter_class/screen/form.dart';
import 'package:flutter_class/screen/listview_demo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}
class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(height: 50,),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginForm()));
            }, child: Text("Login form")),

            SizedBox(height: 30,),
            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> ListViewDemo()));
            }, child: Text("List View Demo")),

            SizedBox(height: 30,),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> DateTimeImage()));
            }, child: Text("Date demo")),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> DateTimeImage()));
            }, child: Text("Git Button")),

            // New branch iftu

            // New branch lavlu vai


            // Something code from Iftu Branch

          ],
        ),
      ),
    );
  }
}

