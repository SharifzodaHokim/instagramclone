
import 'package:exsam3/sighup_screen.dart';
import 'package:exsam3/util/Login_screen.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool a = true;
  void go(){
    setState(() {
      a =!a;
    });
  }
  @override
  Widget build(BuildContext context) {
   if(a){
    return LoginScreen(go);
   }else{
    return SighupScreen(go);
   }
  }
}