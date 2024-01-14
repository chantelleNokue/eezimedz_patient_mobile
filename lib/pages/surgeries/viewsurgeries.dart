import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../profile.dart';
import '../components/drawercomponent.dart';
import '../components/bottomnavigationbar.dart';
import 'tabs/approved.dart';
import 'tabs/cancelled.dart';
import 'tabs/pending.dart';

class ViewSurgeries extends StatefulWidget{
  const ViewSurgeries({Key ? key}): super(key : key);

  State<ViewSurgeries> createState() => _ViewSurgeriesState();
}

class _ViewSurgeriesState extends State<ViewSurgeries> with SingleTickerProviderStateMixin{
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        centerTitle: true,
        title: Text('Surgeries'),
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
            labelPadding: EdgeInsets.symmetric(horizontal: 35),
            padding: EdgeInsets.all(8.0),
            tabs: [

              Tab(
                text: 'Pending',
                icon: FaIcon(FontAwesomeIcons.kitMedical, color: Colors.greenAccent, size: 14,),
              ),

              Tab(
                text: 'Approved',
                icon: FaIcon(FontAwesomeIcons.history, color: Colors.blueGrey, size: 14,),

              ),

              Tab(
                text: 'Cancelled',
                icon: FaIcon(FontAwesomeIcons.cancel, color: Colors.redAccent,size: 14,),
              ),
            ],
          ),
        ),
        drawer: DrawerClass(),

      body:  TabBarView(
        controller: _tabController,

        children: [
          PendingTab(),

          ApprovedTab(),

          CancelledTab(),

        ],
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}