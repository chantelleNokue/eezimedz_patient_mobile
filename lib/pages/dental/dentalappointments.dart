import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../profile.dart';
import '../components/bottomnavigationbar.dart';
import '../components/drawercomponent.dart';
import 'components/viewdental.dart';



class DentalAppointments extends StatefulWidget{
  const DentalAppointments({Key ? key}): super(key : key);

  State<DentalAppointments> createState() => _DentalAppointmentsState();
}

class _DentalAppointmentsState extends State<DentalAppointments> with SingleTickerProviderStateMixin{
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  //view function
  void viewDentalInfo(context, String _number, String _date, String _time, String _center) => showDialog(
    context: context,
    builder: (context) => ViewDental(
      number: _number, center: _center, date: _date, time: _time,
    ),
  );


  Widget buildPending() => Padding(
    padding: EdgeInsets.all(8.0),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Slidable(
          endActionPane: ActionPane(
            motion: ScrollMotion(),
            children: [
              SlidableAction(
                icon: Icons.remove_red_eye_outlined,
                backgroundColor: Colors.blueAccent,
                label: 'View',
                onPressed: (context) => viewDentalInfo(context, '4, 5', '2023-09-12', '15:00', 'Port Mafia',),
              ),

              SlidableAction(
                icon: Icons.cancel_sharp,
                backgroundColor: Colors.redAccent,
                label: 'Close',
                onPressed: (context) => print('close'),
              ),
            ],
          ),
          child: ListTile(
            title: Text('Teeth Cleaning on 2023-09-12 at 15:00'),
          ),
        ),

        SizedBox(height: 2,),

        Divider(
          color: Colors.grey[80],
          height: 3,
          thickness: 2,
        ),

        SizedBox(height: 2,),
      ],
    ),
  );

  Widget buildCancelled() => Padding(
    padding: EdgeInsets.all(8.0),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Slidable(
          endActionPane: ActionPane(
            motion: ScrollMotion(),
            children: [
              SlidableAction(
                icon: Icons.remove_red_eye_outlined,
                backgroundColor: Colors.blueAccent,
                label: 'View',
                onPressed: (context) => viewDentalInfo(context, '7', '2023-04-07', '08:00', 'Port Mafia',),
              ),

              SlidableAction(
                icon: Icons.cancel_sharp,
                backgroundColor: Colors.redAccent,
                label: 'Close',
                onPressed: (context) => print('close'),
              ),
            ],
          ),
          child: ListTile(
            title: Text('Dental Fillings on 2023-04-07 at 08:00'),
          ),
        ),

        SizedBox(height: 2,),

        Divider(
          color: Colors.grey[80],
          height: 3,
          thickness: 2,
        ),

        SizedBox(height: 2,),
      ],
    ),
  );


 Widget buildCompleted() => Padding(
    padding: EdgeInsets.all(8.0),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Slidable(
          endActionPane: ActionPane(
            motion: ScrollMotion(),
            children: [
              SlidableAction(
                icon: Icons.remove_red_eye_outlined,
                backgroundColor: Colors.blueAccent,
                label: 'View',
                onPressed: (context) => viewDentalInfo(context, '20,21', '2023-01-06', '13:00', 'Port Mafia',),
              ),

              SlidableAction(
                icon: Icons.cancel_sharp,
                backgroundColor: Colors.redAccent,
                label: 'Close',
                onPressed: (context) => print('close'),
              ),
            ],
          ),
          child: ListTile(
            title: Text('Dental Trauma Management on 2023-01-06 at 13:00'),
          ),
        ),

        SizedBox(height: 2,),

        Divider(
          color: Colors.grey[80],
          height: 3,
          thickness: 2,
        ),

        SizedBox(height: 2,),

        Slidable(
          endActionPane: ActionPane(
            motion: ScrollMotion(),
            children: [
              SlidableAction(
                icon: Icons.remove_red_eye_outlined,
                backgroundColor: Colors.blueAccent,
                label: 'View',
                onPressed: (context) => viewDentalInfo(context, '15', '2023-04-08', '11:00', 'Port Mafia',),
              ),

              SlidableAction(
                icon: Icons.cancel_sharp,
                backgroundColor: Colors.redAccent,
                label: 'Close',
                onPressed: (context) => print('close'),
              ),
            ],
          ),
          child: ListTile(
            title: Text('Gum Grafting on 2023-04-08 at 11:00'),
          ),
        ),
      ],
    ),
  );



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
        bottom: TabBar(
          controller: tabController,
          physics: AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.all(8.0),
          tabs: [
            Tab(
              icon: Icon(Icons.done_outline, color: Colors.lightGreen,),
              text: 'Completed',
            ),

            Tab(
              icon: Icon(Icons.pending, color: Colors.lightBlue, ),
              text: 'Pending',
            ),

            Tab(
              icon: Icon(Icons.cancel_outlined, color: Colors.redAccent,),
              text: 'Cancelled',
            ),
          ],
        ),
      ),

      drawer: DrawerClass(),

      body: TabBarView(
        controller: tabController,
        children: [
          buildCompleted(),

          buildPending(),

          buildCancelled(),
        ],
      ),

      bottomNavigationBar: NavBar(),

    );
  }
}