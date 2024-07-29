import 'package:exsam3/auth/auth_screen.dart';

import 'package:exsam3/util/navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Manpage extends StatelessWidget {
  const Manpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot)  {
          if(snapshot.hasData){
            return const  Navigations_Screen();
          }
          else{
            return const AuthPage();
          }
        },
      ),
    );
  }
}