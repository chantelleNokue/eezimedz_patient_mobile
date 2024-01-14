import 'package:flutter/material.dart';

import 'components/bottomnavigationbar.dart';
import 'components/drawercomponent.dart';

class Profile extends StatefulWidget{
  const Profile({Key ? key}): super(key: key);

  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        centerTitle: true,
        title: Text('My Profile'),
        automaticallyImplyLeading: false,
        leading: Builder(
            builder: (context) {
              return IconButton(
                  onPressed: (){
                    Scaffold.of(context).openDrawer();
                  },
                  icon: Icon(Icons.menu_sharp, color: Colors.white,)
              );
            }
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => Profile())),
            icon: Icon(Icons.person),
          ),
        ],
      ),
      drawer: DrawerClass(),
      body: Column(
        children: <Widget>[
          Center(
            child: Text(
              'Profile',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          )
        ],
      ),

    bottomNavigationBar: NavBar(),
    );
  }
}