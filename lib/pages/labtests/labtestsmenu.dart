import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import '../profile.dart';
import '../components/bottomnavigationbar.dart';
import '../components/drawercomponent.dart';
import 'scheduletest.dart';
import 'testresults.dart';

class LabTestsMenu extends StatefulWidget{
  const LabTestsMenu({Key ? key}): super(key : key);

  State<LabTestsMenu> createState() => _LabTestsMenuState();
}

class _LabTestsMenuState extends State<LabTestsMenu>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        centerTitle: true,
        title: Text('Lab Tests'),
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
                      'Lab Tests',
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
                  leading: FaIcon(FontAwesomeIcons.listCheck) ,
                  title:Text('Test Results'),
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => TestResults()));
                  },
                ),

                Divider(
                  color: Colors.grey[80],
                  height: 3,
                  thickness: 2,
                ),

                //navigate to request prescription
                ListTile(
                  leading: FaIcon(FontAwesomeIcons.timeline),
                  title:Text('Schedule Test'),
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ScheduleTest()));
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