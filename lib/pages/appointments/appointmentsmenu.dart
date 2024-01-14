import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../services/appointments/manageAppointments.dart';

import '../profile.dart';
import '../components/drawercomponent.dart';
import '../components/bottomnavigationbar.dart';
import 'appointmentsstepper.dart';
import 'viewappointments.dart';

class AppointmentsMenu extends StatefulWidget{
  const AppointmentsMenu({Key ? key}): super(key : key);

  State<AppointmentsMenu> createState() => _AppointmentsMenuState();
}

class _AppointmentsMenuState extends State<AppointmentsMenu>{

  void initState(){
    super.initState();
    AppointmentsProvider();
  }


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:  AppBar(
        toolbarHeight: 70,
        centerTitle: true,
        title: Text('Appointment'),
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
                      'Appointments',
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

                //navigate to patient details
                ListTile(
                  leading: FaIcon(FontAwesomeIcons.add) ,
                  title:Text('Book An Appointment'),
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => AppointmentsStepper()));
                  },
                ),

                Divider(
                  color: Colors.grey[80],
                  height: 3,
                  thickness: 2,
                ),

                //navigate to patient employment details
                ListTile(
                  leading: FaIcon(FontAwesomeIcons.eye) ,//Expanded(child: Image.asset('icons/vehicle.png')),
                  title:Text('View Appointments'),
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ViewAppointments()));
                  },
                ),

                Divider(
                  color: Colors.grey[80],
                  height: 3,
                  thickness: 2,
                ),

                //navigate to patient referrals details
                ListTile(
                  leading: FaIcon(FontAwesomeIcons.edit) ,//Expanded(child: Image.asset('icons/vehicle.png')),
                  title:Text('Manage Appointments'),
                  onTap: (){
                    //Navigator.of(context).push(MaterialPageRoute(builder: (context) => VehicleMenu()));
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