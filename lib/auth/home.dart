
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => __HomeScreenState();
}

class __HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
appBar: AppBar(
  elevation: 0,
  title: SizedBox(
    width: 105.w,
    height: 28.h,
    child: Image.asset(
      "images/Instagram Logo.png"
      ),
  ),
  leading: Image.asset('images/Instagram Logo.png'),
  backgroundColor: Color(0xfffafafa),
),

    );
  }
}