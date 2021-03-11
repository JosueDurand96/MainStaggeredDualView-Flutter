import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainStaggeredDualView(),
    );
  }
}

class MainStaggeredDualView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData.dark(),
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            elevation: 0,
            title: Text('Comidas', style: TextStyle(color: Colors.black,),),
          ),
          body: null,
        ),
    );
  }
}
