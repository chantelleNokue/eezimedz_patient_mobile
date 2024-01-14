import 'package:flutter/material.dart';

import '../components/bottomnavigationbar.dart';
import '../components/drawercomponent.dart';
import '../profile.dart';
import 'tabs/pediatrics.dart';
import 'tabs/internal.dart';
import 'tabs/dermatology.dart';
import 'tabs/neurology.dart';
import 'tabs/radiology.dart';
import 'tabs/oncology.dart';
import 'tabs/cardiology.dart';
import 'tabs/gynaecology.dart';


class Doctors extends StatefulWidget{
  const Doctors({Key ? key}): super(key : key);

  State<Doctors> createState() => _DoctorsState();
}

class _DoctorsState extends State<Doctors>  with SingleTickerProviderStateMixin{

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 8, vsync: this);
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        centerTitle: true,
        title: Text('Doctors'),
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
          indicatorSize: TabBarIndicatorSize.label,
          tabs: [
            Tab(
              text: 'Pediatrics',
            ),

            Tab(
              text: 'Internal',
            ),

            Tab(
              text: 'Dermatology',
            ),

            Tab(
              text: 'Neurology',
            ),

            Tab(
              text: 'Radiology',
            ),

            Tab(
              text: 'Oncology',
            ),

            Tab(
              text: 'Cardiology',
            ),

            Tab(
              text: 'Gynaecology',
            ),

          ],
        ),
      ),

      drawer: DrawerClass(),

      body: TabBarView(
        controller: _tabController,
        children: [
          //pediatrics tab
          PediatricsTab(),

          //internal tab
          InternalTab(),

          //dermatology tab
          DermatologyTab(),

          //neurology tab
          NeurologyTab(),


          //radiology tab
          RadiologyTab(),


          //oncology tab
          OncologyTab(),


          //cardiology tab
          CardiologyTab(),

          //gynaecology tab
          GynaecologyTab()

        ],
      ),

      bottomNavigationBar: NavBar(),
    );
  }
}