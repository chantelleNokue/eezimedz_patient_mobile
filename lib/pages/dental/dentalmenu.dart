import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import '../profile.dart';
import '../components/bottomnavigationbar.dart';
import '../components/drawercomponent.dart';
import 'dentalhistory.dart';
import 'bookdental.dart';
import 'dentalappointments.dart';


class DentalMenu extends StatefulWidget{
  const DentalMenu({Key ? key}): super(key : key);

  State<DentalMenu> createState() => _DentalMenuState();
}

class _DentalMenuState extends State<DentalMenu>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        centerTitle: true,
        title: Text('Dental'),
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
                      'Dental',
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
                  leading: FaIcon(FontAwesomeIcons.eye),
                  title:Text('Dental Appointments'),
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => DentalAppointments()));
                  },
                ),

                Divider(
                  color: Colors.grey[80],
                  height: 3,
                  thickness: 2,
                ),

                //navigate to book appointment
                ListTile(
                  leading: FaIcon(FontAwesomeIcons.tooth),
                  title:Text('Book Appointment'),
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => BookDental()));
                  },
                ),

                Divider(
                  color: Colors.grey[80],
                  height: 3,
                  thickness: 2,
                ),

                //navigate to view dental history
                ListTile(
                  leading: FaIcon(FontAwesomeIcons.history) ,
                  title:Text('View Dental History'),
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => DentalHistory()));
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