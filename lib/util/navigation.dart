import 'package:exsam3/auth/home.dart';
import 'package:exsam3/util/explor_screen.dart';
import 'package:exsam3/util/profile_screen.dart';
import 'package:exsam3/util/reels_screen.dart';
import 'package:flutter/material.dart';

class Navigations_Screen extends StatefulWidget {
  const Navigations_Screen({super.key});

  @override
  State<Navigations_Screen> createState() => __Navigations_ScreenState();
}
int _currentIndex = 0;
class __Navigations_ScreenState extends State<Navigations_Screen> {
  late PageController pageController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }
  onPageChanged(int page){
setState(() {
  _currentIndex = page;
});
  }
  navigationTapped(int page){
    pageController.jumpToPage(page);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: Container(
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          currentIndex: _currentIndex,
          onTap: navigationTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: ''
              ),
               BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: ''
              ),
               BottomNavigationBarItem(
              icon: Icon(Icons.camera),
              label: ''
              ),
               BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: ''
              )
          ],
          ),
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: onPageChanged,
        children: [
          HomeScreen(),
          ExplorScreen(),
          ReelsScreen(),
          ProfileScreen(),
        ],
      ),
    );
  }
}