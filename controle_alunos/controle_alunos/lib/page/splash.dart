import 'package:flutter/material.dart';
import 'home.dart';

class SplashHome extends StatefulWidget{
  @override
  _SplashHomeState createState() => _SplashHomeState();

}

class _SplashHomeState extends State<SplashHome>{
  @override
  void initState(){
    Future.delayed(Duration(seconds: 10)).then(( _ ){
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => Home())
      );
    });
  } 
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Column(                   
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,        
        children: <Widget>[
          Container(            
            //decoration: BoxDecoration(
              //image: DecorationImage(
            child:    Image.asset("images/logo_splash.jpg")
              
            //),
          ),
          //Text("dds"),
        ],
      ),
    );
  }
}