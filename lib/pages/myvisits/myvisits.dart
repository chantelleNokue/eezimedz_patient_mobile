import 'package:flutter/material.dart';

import '../profile.dart';
import '../components/drawercomponent.dart';
import '../components/bottomnavigationbar.dart';
import 'tabs/allergies.dart';
import 'tabs/diagnosis.dart';
import 'tabs/medications.dart';
import 'tabs/treatment.dart';
import 'tabs/vitalsigns.dart';


class MyVisits extends StatefulWidget{
  const MyVisits({Key ? key}): super(key : key);

  State<MyVisits> createState() => _MyVisitsState();
}

class _MyVisitsState extends State<MyVisits> with SingleTickerProviderStateMixin{

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        centerTitle: true,
        title: Text('My Visits'),
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
          controller: _tabController,
          physics: AlwaysScrollableScrollPhysics(),
          isScrollable: true,
          indicatorSize: TabBarIndicatorSize.tab,
          labelPadding: EdgeInsets.all(10),
          padding: EdgeInsets.all(8.0),
          tabs: [
            Tab(
              text: 'Treatment Details',
            ),

            Tab(
              text: 'Vital Signs',
            ),

            Tab(
              text: 'Allergies',
            ),

            Tab(
              text: 'Medication',
            ),

            Tab(
              text: 'Diagnosis',
            ),
          ],
        ),
      ),
        drawer: DrawerClass(),
        body: TabBarView(
          controller: _tabController,
          children: [
            TreatmentDetails(),

            VitalSigns(),

            Allergies(),

            Medications(),

            Diagnosis(),
          ],
        ),

      bottomNavigationBar: NavBar(),
    );
  }
}


