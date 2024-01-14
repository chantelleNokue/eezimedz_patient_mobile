import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/myvisits_bloc.dart';
import '../components/vitalsigns.dart';

class VitalSigns extends StatefulWidget{
  const VitalSigns({Key ? key}): super(key : key);


  State<VitalSigns> createState() => _VitalSignsState();
}


class _VitalSignsState extends State<VitalSigns>{
  final MyvisitsBloc myvisitBloc = MyvisitsBloc();
  @override
  void initState() {
    myvisitBloc.add(MyvisitsInitialFetchEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context){
    return Container(
      child:   BlocConsumer<MyvisitsBloc, MyvisitsState>(
        bloc: myvisitBloc,
        listenWhen: (previous, current) => current is MyvisitsActionState,
    buildWhen: (previous, current) => current is !MyvisitsActionState,
    listener: (context, state){
    //implementation
    },
    builder: (context, state){
    switch(state.runtimeType){
    case MyvisitsfetchingLoadingState:
    return const Center(child: Text('loading'),);
    case MyvisitsFetchingSuccessfulState:
    final successState = state as MyvisitsFetchingSuccessfulState;


    return  Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 550,
        child: ListView.builder(
    physics: AlwaysScrollableScrollPhysics(),
    padding: EdgeInsets.all(8.0),
    shrinkWrap: true,

        itemCount: successState.myvisits.length,
        itemBuilder: (context, index) {
        return Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
        children: [
        SizedBox(height: 10),

          VitalSignsCard(
            systolicBP: successState.myvisits[index].systolicBp,

            diastolicBP: successState.myvisits[index].diastolicBp,
            temperature: successState.myvisits[index].temperature,
            weight: successState.myvisits[index].weight,
            bmi: successState.myvisits[index].bmi,
            respiratoryRate: successState.myvisits[index].respiratoryRate,
            heartRate: successState.myvisits[index].heartRate,
        // viewFunction: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => PrescriptionData(
        //   date: '12-04-23',
        //   medication: successState.myvisits[index].prescriptionDetails.first.medication,
        //   dosage: successState.myvisits[index].prescriptionDetails.first.dosage,
        //   frequency: successState.myvisits[index].prescriptionDetails.first.frequency,
        //   dosageType: successState.myvisits[index].prescriptionDetails.first.dosageType,
        //   precautions: 'eat before you take the pills',
        //
        // )
        // )),
        ),
        ],


        ),
        );
        },
        ),
        )
      ],
    );

    default:
    return const SizedBox();
    }

    },
      ),
    );
  }
}