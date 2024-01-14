import 'dart:convert';
import 'package:Eezimedz_Patients/models/appointmentsmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '../profile.dart';
import '../components/bottomnavigationbar.dart';
import '../components/drawercomponent.dart';
import 'bloc/appointments_bloc.dart';
import 'models/appointments.dart';
import 'tabs/cancelled.dart';
import 'tabs/pending.dart';
import 'tabs/approved.dart';

class ViewAppointments extends StatefulWidget {
  const ViewAppointments({Key? key}) : super(key: key);

  State<ViewAppointments> createState() => _ViewAppointmentsState();
}

class _ViewAppointmentsState extends State<ViewAppointments> {
  final PrescriptionBloc prescriptionBloc = PrescriptionBloc();

  void initState() {
    prescriptionBloc.add(PrescriptionInitialFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('My Appointments'),
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
                  text: 'Pending',
                ),

                //approved tab
                Tab(
                  icon: Icon(
                    Icons.done,
                    color: Colors.lightGreenAccent,
                  ),
                  text: 'Approved',
                ),

                //cancelled tab
                Tab(
                  icon: Icon(
                    Icons.cancel_outlined,
                    color: Colors.redAccent,
                  ),
                  text: 'Canceled',
                ),
              ],
            ),
          ),
          body: BlocConsumer<PrescriptionBloc, PrescriptionState>(
            bloc: prescriptionBloc,
            listenWhen: (previous, current) =>
                current is PrescriptionActionState,
            buildWhen: ((previous, current) =>
                current is! PrescriptionActionState),
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              switch (state.runtimeType) {
                case PrescriptionfetchingLoadingState:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case PrescriptionFetchingSuccessfulState:
                  final successState =
                      state as PrescriptionFetchingSuccessfulState;

                  final List<AppointmentsModel> patientsList =
                      successState.prescriptions;

                  return TabBarView(
                    children: <Widget>[
                      Pending(
                        appointmentModel: patientsList,
                      ),
                      Approved(appointmentModel: patientsList,),
                      Cancelled(appointmentModel: patientsList,),
                    ],
                  );

                default:
                  return const SizedBox();
              }
            },
          ),
          drawer: DrawerClass(),
          bottomNavigationBar: NavBar(),
        ),
      ),
    );
  }
}
