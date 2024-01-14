import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../profile.dart';
import '../components/bottomnavigationbar.dart';
import '../components/drawercomponent.dart';
import 'bloc/doctornotes_bloc.dart';
import 'model/doctornotessmodel.dart';
import 'tabs/private.dart';
import 'tabs/public.dart';


class Notes extends StatefulWidget{
  const Notes({Key ? key}): super(key : key);

  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> with SingleTickerProviderStateMixin{


  late TabController _tabController;
  final DoctorNotesBloc doctorNotesBloc = DoctorNotesBloc();
  // @override
  void initState() {
    doctorNotesBloc.add(DoctorNotesInitialFetchEvent());
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }



  // void initState() {
  //   super.initState();
  //   _tabController = TabController(length: 2, vsync: this);
  // }


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        centerTitle: true,
        title: Text('Doctor\'s Notes'),
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
              text: 'Public',
            ),

            Tab(
              text: 'Private',
            ),


          ],
        ),
      ),
      drawer: DrawerClass(),
      body: BlocConsumer<DoctorNotesBloc, DoctorNotesState>(
        bloc: doctorNotesBloc,
        listenWhen: (previous, current) =>
        current is DoctorNotesActionState,
        buildWhen: ((previous, current) =>
        current is! DoctorNotesActionState),
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case DoctorNotesfetchingLoadingState:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case DoctorNotesFetchingSuccessfulState:
              final successState =
              state as DoctorNotesFetchingSuccessfulState;

              final List<DoctorNotesModel> doctorsList =
                  successState.doctorNotes;

              return TabBarView(
          controller: _tabController,
          children: [
          PublicNotes(),

          PrivateNotes(),

          ],
          );

            default:
              return const SizedBox();
          }
        },
      ),
      // body: TabBarView(
      //   controller: _tabController,
      //   children: [
      //     PublicNotes(),
      //
      //     PrivateNotes(),
      //
      //   ],
      // ),

      bottomNavigationBar: NavBar(),
    );
  }
}


