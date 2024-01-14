import 'package:Eezimedz_Patients/pages/vitalsigns/components/vitalsignshistory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../bloc/vital_bloc.dart';

class VitalHistory extends StatefulWidget {
  const VitalHistory({Key? key, required}) : super(key: key);

  State<VitalHistory> createState() => _ApprovedState();
}

class _ApprovedState extends State<VitalHistory> {
  final MyvisitsBloc prescriptionBloc = MyvisitsBloc();
  @override
  void initState() {
    prescriptionBloc.add(MyvisitsInitialFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyvisitsBloc, MyvisitsState>(
      bloc: prescriptionBloc,
      listenWhen: (previous, current) => current is MyvisitsActionState,
      buildWhen: (previous, current) => current is! MyvisitsActionState,
      listener: (context, state) {
// Implementation
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
                child: ListView.builder(
                  padding: EdgeInsets.all(5),
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: successState.myvisits.updatedVitals.length,
                  itemBuilder: (context, index) {
                    final vitals =
                        successState.myvisits.updatedVitals[index].vitals;
                    final date =
                        DateFormat('yyyy-MM-dd').format(vitals.captureDate);
                    final time = vitals.captureTime.toString();

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: VitalSignsCard(
                        height: vitals.height.toString(),
                        bloodPressure: vitals.bloodPressure.toString(),
                        bloodSugar: vitals.bloodSugar.toString(),
                        bm1: vitals.bmi.toString(),
                        breathing: vitals.resp.toString(),
                        haemoglobinCount: 'g',
                        pulse: vitals.pulse.toString(),
                        temperature: vitals.temperature.toString(),
                        weight: vitals.weight.toString(),
                        date: date,
                        time: time,
                      ),
                    );
                  },
                ),
              ),
            );

          default:
            return const SizedBox();
        }
      },
    );
  }
}
