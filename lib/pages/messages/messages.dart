import 'package:flutter/material.dart';

import '../components/bottomnavigationbar.dart';
import '../components/drawercomponent.dart';
import '../profile.dart';

class Messages extends StatefulWidget{
  const Messages({Key ? key}): super(key: key);

  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        centerTitle: true,
        title: Text('My Inbox'),
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
              'In App Messages',
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