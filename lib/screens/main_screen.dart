import 'package:flutter/material.dart';
import 'package:karaoke_dictionary/consts/constant.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:fancy_bottom_navigation/internal/tab_item.dart';
import 'home_screen.dart';

class MainScreen extends StatefulWidget{
  @override 
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>{
  PageController _pageController;

  @override
  void initState(){
    super.initState();
    _pageController = PageController();
  }
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          HomeScreen(),
        ],
      ),

      bottomNavigationBar: FancyBottomNavigation(
        circleColor: Colors.lightBlueAccent[100],
        inactiveIconColor: Colors.lightBlueAccent[100],
        tabs: [
          TabData(iconData: Icons.home, title: "Home"),
          TabData(iconData: Icons.edit_attributes, title: "edit"),
        ],
        onTabChangedListener: (position) {  
          setState(() {
            // _pageController.jumpToPage(position);

          });
        },
      ),
    );
  }
}