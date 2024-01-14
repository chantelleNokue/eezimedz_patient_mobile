import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/drawercomponent.dart';
import '../components/bottomnavigationbar.dart';
import '../profile.dart';
import 'doctors.dart';
import 'hospitalizationhistory.dart';
import 'previousDoc.dart';
import 'previousmedications.dart';
import 'previousdoctors.dart';


class HistoryMenu extends StatefulWidget{
  const HistoryMenu({Key ? key}): super(key : key);

  State<HistoryMenu> createState() => _HistoryMenuState();
}

class _HistoryMenuState extends State<HistoryMenu>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        centerTitle: true,
        title: Text('Medical History'),
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
                      'Medical History',
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

                //navigate to hospitalization history
                ListTile(
                  leading: FaIcon(FontAwesomeIcons.hospital) ,
                  title:Text('Hospitalization History'),
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => HospitalizationHistory())),
                ),

                Divider(
                  color: Colors.grey[80],
                  height: 3,
                  thickness: 2,
                ),

                //navigate to previous medications
                ListTile(
                  leading: FaIcon(FontAwesomeIcons.prescriptionBottleMedical),
                  title:Text('Previous Medications'),
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => PreviousMedication())),
                ),

                Divider(
                  color: Colors.grey[80],
                  height: 3,
                  thickness: 2,
                ),


                //navigate to request previous doctors
                ListTile(
                  leading: FaIcon(FontAwesomeIcons.userDoctor),
                  title:Text('Previous Doctors'),
                  onTap: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (context) => PreviousDoctors())),
                ),

                Divider(
                  color: Colors.grey[80],
                  height: 3,
                  thickness: 2,
                ),

                ListTile(
                  leading: FaIcon(FontAwesomeIcons.userDoctor),
                  title:Text('Previous Doctors 2'),
                  onTap: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (context) => PreviousDoc())),
                ),

                Divider(
                  color: Colors.grey[80],
                  height: 3,
                  thickness: 2,
                ),

                ListTile(
                  leading: FaIcon(FontAwesomeIcons.userDoctor),
                  title:Text('Doctors'),
                  onTap: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (context) => Doctors())),
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