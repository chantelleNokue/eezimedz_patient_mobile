import 'dart:convert';
import 'package:Eezimedz_Patients/models/appointmentsmodel.dart';
import 'package:Eezimedz_Patients/pages/vitalsigns/model/vitalmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '../profile.dart';
import '../components/bottomnavigationbar.dart';
import '../components/drawercomponent.dart';

import 'tabs/vitalHistory.dart';

import 'tabs/vitals.dart';
import 'bloc/vital_bloc.dart';

class ViewVitals extends StatefulWidget {
  const ViewVitals({Key? key}) : super(key: key);

  State<ViewVitals> createState() => _ViewAppointmentsState();
}

class _ViewAppointmentsState extends State<ViewVitals> {
  // final MyvisitsBloc prescriptionBloc = MyvisitsBloc();
  //
  // void initState() {
  //   prescriptionBloc.add(MyvisitsInitialFetchEvent());
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('My Vitals'),
            automaticallyImplyLeading: false,
            leading: Builder(builder: (context) {
              return IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: Icon(
                    Icons.menu_sharp,
                    color: Colors.white,
                  ));
            }),
            actions: [
              IconButton(
                onPressed: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Profile())),
                icon: Icon(Icons.person),
              ),
            ],
            bottom: TabBar(
              tabs: [
                //pending tab
                Tab(
                  icon: Icon(
                    Icons.remove_red_eye_rounded,
                    color: Colors.lightBlueAccent,
                  ),
                  text: 'Vital Signs',
                ),

                //approved tab
                Tab(
                  icon: Icon(
                    Icons.done,
                    color: Colors.lightGreenAccent,
                  ),
                  text: 'Vitals History',
                ),

                //cancelled tab
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              Vitalss(),
              VitalHistory(),
            ],
          ),
          // body: BlocConsumer<MyvisitsBloc, MyvisitsState>(
          //   bloc: prescriptionBloc,
          //   listenWhen: (previous, current) =>
          //       current is MyvisitsActionState,
          //   buildWhen: ((previous, current) =>
          //       current is! MyvisitsActionState),
          //   listener: (context, state) {
          //     // TODO: implement listener
          //   },
          //   builder: (context, state) {
          //     switch (state.runtimeType) {
          //       case MyvisitsfetchingLoadingState:
          //         return const Center(
          //           child: CircularProgressIndicator(),
          //         );
          //       case MyvisitsFetchingSuccessfulState:
          //         final successState =
          //             state as MyvisitsFetchingSuccessfulState;
          //
          //         final List<VitalsModel> patientsList =
          //             successState.myvisits;
          //
          //         return TabBarView(
          //           children: <Widget>[
          //             Vitalss(),
          //             VitalHistory(),
          //           ],
          //         );
          //
          //       default:
          //         return const SizedBox();
          //     }
          //   },
          // ),
          drawer: DrawerClass(),
          bottomNavigationBar: NavBar(),
        ),
      ),
    );
  }
}
