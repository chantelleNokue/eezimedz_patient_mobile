import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../homepage.dart';
import '../profile.dart';
import '../settings.dart';
import '../messages/messages.dart';

class NavBar extends StatefulWidget{
  const NavBar({Key ? key}): super(key : key);

  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar>{

  int selectedIndex = 0;
//TODO: add in-apps on nav bar

  @override
  Widget build(BuildContext context){
    return BottomNavigationBar(
      selectedItemColor: Colors.grey,
      unselectedItemColor: Colors.grey,
      backgroundColor: Colors.white,

      currentIndex: selectedIndex,
      elevation: 1,
      type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Messages'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
     onTap: (int index) async{
        setState(() {
          selectedIndex = index;
        });

        switch(index){
          case 0:
            Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()),);
            break;
          case 1:
            Navigator.push(context, MaterialPageRoute(builder: (context) => Settings()),);
            break;
          case 2:
            Navigator.push(context, MaterialPageRoute(builder: (context) => Messages()),);
            break;
          case 3:
            Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()),);
            break;

        }

    },
    );
  }
}