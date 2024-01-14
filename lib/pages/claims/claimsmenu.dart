import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import '../profile.dart';
import '../components/bottomnavigationbar.dart';
import '../components/drawercomponent.dart';
import 'claims.dart';
import 'lodgeclaim.dart';


class ClaimsMenu extends StatefulWidget{
  const ClaimsMenu({Key ? key}): super(key : key);

  State<ClaimsMenu> createState() => _ClaimsMenuState();
}

class _ClaimsMenuState extends State<ClaimsMenu>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        centerTitle: true,
        title: Text('Claims'),
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

      body: Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
        ),
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  child: Center(
                    child: Text(
                      'Claims',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),

                Divider(
                  color: Colors.grey[80],
                  height: 3,
                  thickness: 2,
                ),

                //navigate to dental appointment
                ListTile(
                  leading: FaIcon(FontAwesomeIcons.add),
                  title:Text('Lodge Claim'),
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => LodgeClaim()));
                  },
                ),

                Divider(
                  color: Colors.grey[80],
                  height: 3,
                  thickness: 2,
                ),

                //navigate to book appointment
                ListTile(
                  leading: FaIcon(FontAwesomeIcons.eye),
                  title:Text('View Claims'),
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Claims()));
                  },
                ),

                Divider(
                  color: Colors.grey[80],
                  height: 3,
                  thickness: 2,
                ),





              ],
            ),
          ),
        ),
      ),

      bottomNavigationBar: NavBar(),
    );
  }
}