import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/myvisits_bloc.dart';
import '../components/visitsCard.dart';

class Allergies extends StatefulWidget{
  const Allergies({Key ? key}): super(key : key);


  State<Allergies> createState() => _AllergiesState();
}


class _AllergiesState extends State<Allergies>{
  final MyvisitsBloc myvisitBloc = MyvisitsBloc();
  @override
  void initState() {
    myvisitBloc.add(MyvisitsInitialFetchEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context){
    return Container(
      child: BlocConsumer<MyvisitsBloc, MyvisitsState>(
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

              return  Container(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Number of columns in the grid
                      crossAxisSpacing: 10.0, // Spacing between columns
                      mainAxisSpacing: 10.0, // Spacing between rows
                    ),
                    itemCount: successState.myvisits.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(0),
                        child: Column(
                          children: [
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                VisitCard(
                                  type: successState.myvisits[index].allergies.first.type,

                                  allergen: successState.myvisits[index].allergies.first.allergen,
                                  reaction: successState.myvisits[index].allergies.first.reaction,
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