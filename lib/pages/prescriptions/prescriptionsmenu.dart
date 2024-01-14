import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import '../profile.dart';
import '../components/drawercomponent.dart';
import '../components/bottomnavigationbar.dart';
import 'viewprescriptions.dart';
import 'requestprescription.dart';

class PrescriptionsMenu extends StatefulWidget{
  const PrescriptionsMenu({Key ? key}): super(key : key);

  State<PrescriptionsMenu> createState() => _PrescriptionsMenuState();
}

class _PrescriptionsMenuState extends State<PrescriptionsMenu>{



  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:  AppBar(
        toolbarHeight: 70,
        centerTitle: true,
        title: Text('Eezimedz'),
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
                      'Prescriptions',
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

                //navigate to view prescriptions
                ListTile(
                  leading: FaIcon(FontAwesomeIcons.prescription) ,
                  title:Text('View Prescriptions'),
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ViewPrescriptions()));
                  },
                ),

                Divider(
                  color: Colors.grey[80],
                  height: 3,
                  thickness: 2,
                ),

                //navigate to request prescription
                ListTile(
                  leading: FaIcon(FontAwesomeIcons.prescription),
                  title:Text('View Medical Schedules'),
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => RequestPrescription()));
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