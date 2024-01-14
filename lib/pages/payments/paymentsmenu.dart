import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import '../components/bottomnavigationbar.dart';
import '../components/drawercomponent.dart';
import '../profile.dart';
import 'viewpayments.dart';
import 'refunds.dart';
import 'paymentshistory.dart';


class PaymentsMenu extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        centerTitle: true,
        title: Text('My Payments'),
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
          padding: EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  child: Center(
                    child: Text(
                      'My Payments',
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


                //navigate to view payments
                ListTile(
                  leading: Icon(Icons.payments) ,
                  title:Text('View Payments'),
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ViewPayments()));
                  },
                ),

                Divider(
                  color: Colors.grey[80],
                  height: 3,
                  thickness: 2,
                ),

                //navigate to refunds
                ListTile(
                  leading: Icon(Icons.replay_circle_filled_outlined) ,
                  title:Text('Refunds'),
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Refunds()));
                  },
                ),

                Divider(
                  color: Colors.grey[80],
                  height: 3,
                  thickness: 2,
                ),


                //navigate to payments history
                ListTile(
                  leading: Icon(Icons.manage_history_sharp) ,
                  title:Text('Payments History'),
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Refunds()));
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