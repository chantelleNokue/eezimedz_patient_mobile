import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../prescriptions/bloc/prescription_bloc.dart';
import '../components/medicationCard.dart';

class Medications extends StatefulWidget{
  const Medications({Key ? key}): super(key : key);


  State<Medications> createState() => _MedicationsState();
}


class _MedicationsState extends State<Medications>{
  final PrescriptionBloc prescriptionBloc = PrescriptionBloc();
  @override
  void initState() {
    prescriptionBloc.add(PrescriptionInitialFetchEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context){
    return Container(
      child: BlocConsumer<PrescriptionBloc, PrescriptionState>(
        bloc: prescriptionBloc,
        listenWhen: (previous, current) => current is PrescriptionActionState,
        buildWhen: (previous, current) => current is !PrescriptionActionState,
        listener: (context, state){
          //implementation
        },
        builder: (context, state){
          switch(state.runtimeType){
            case PrescriptionfetchingLoadingState:
              return const Center(child: Text('loading'),);
            case PrescriptionFetchingSuccessfulState:
              final successState = state as PrescriptionFetchingSuccessfulState;

              return  Container(
                  child: ListView.builder(
                    physics: AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.all(8.0),
                    shrinkWrap: true,
                    itemCount: successState.prescriptions.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                MedicationCard(
                                  prescriptionName: successState.prescriptions[index].prescriptionDetails.first.medication,

                                  // prescriptionID: successState.prescriptions[index].prescriptionDetails.first.indication,
                                  // date: '12-04-23',

                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );

            default:
              return const SizedBox();
          }

        },
      ),
    );
  }
}