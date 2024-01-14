import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../models/appointmentsmodel.dart';
import '../../../services/appointments/manageAppointments.dart';
import '../bloc/vital_bloc.dart';
import '../components/vitalsignscomponent.dart';

class Vitalss extends StatefulWidget {
  const Vitalss({Key? key, required}) : super(key: key);

  State<Vitalss> createState() => _ApprovedState();
}

class _ApprovedState extends State<Vitalss> {
  final MyvisitsBloc prescriptionBloc = MyvisitsBloc();
  @override
  void initState() {
    prescriptionBloc.add(MyvisitsInitialFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return
        BlocConsumer<MyvisitsBloc, MyvisitsState>(
          bloc: prescriptionBloc,
          listenWhen: (previous, current) => current is MyvisitsActionState,
          buildWhen: (previous, current) => current is! MyvisitsActionState,
          listener: (context, state) {
//implementation
          },
          builder: (context, state) {
            switch (state.runtimeType) {
              case MyvisitsfetchingLoadingState:
                return const Center(
                  child: Text('loading'),
                );
              case MyvisitsFetchingSuccessfulState:
                final successState = state as MyvisitsFetchingSuccessfulState;

                return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 500,
                      child: ListView(
                          padding: EdgeInsets.all(5),
                          physics: ClampingScrollPhysics(),
                          shrinkWrap: true,
                          children:  [
                            VitalsCard(
                              height: successState.myvisits.updatedVitals.last.vitals.height.toString(),
                              bloodPressure: successState.myvisits.updatedVitals.last.vitals.bloodPressure.toString(),
                              bloodSugar: successState.myvisits.updatedVitals.last.vitals.bloodSugar.toString(),
                              bm1: successState.myvisits.updatedVitals.last.vitals.bmi.toString(),
                              breathing: successState.myvisits.updatedVitals.last.vitals.resp.toString(),
                              haemoglobinCount: 'g',
                              pulse: successState.myvisits.updatedVitals.last.vitals.pulse.toString(),
                              temperature: successState.myvisits.updatedVitals.last.vitals.temperature.toString(),
                              weight: successState.myvisits.updatedVitals.last.vitals.weight.toString(),
date: DateFormat('yyyy-MM-dd').format(successState.myvisits.updatedVitals.last.vitals.captureDate),

time: successState.myvisits.updatedVitals.last.vitals.captureTime.toString(),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ]),
                    ));

              default:
                return const SizedBox();
            }
          },
        );


  }
}
