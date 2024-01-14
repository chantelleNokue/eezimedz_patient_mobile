import 'package:Eezimedz_Patients/pages/doctornotes/components/viewcomponent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../components/drawercomponent.dart';
import '../profile.dart';
import '../components/bottomnavigationbar.dart';
import 'bloc/prescription_bloc.dart';
import 'components/prescriptioncard.dart';
import 'components/prescriptiondata.dart';
import 'components/prescriptioninfo.dart';
import 'components/viewmoreDetails.dart';


class ViewPrescriptions extends StatefulWidget{
  const ViewPrescriptions({Key ? key}): super(key : key);
  static const route = '/viewprescriptions';

  State<ViewPrescriptions> createState() => _ViewPrescriptionsState();
}

class _ViewPrescriptionsState extends State<ViewPrescriptions>{
  final PrescriptionBloc prescriptionBloc = PrescriptionBloc();
  @override
  void initState() {
    prescriptionBloc.add(PrescriptionInitialFetchEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context){
    //can be used to display message data from notification
    final message = ModalRoute.of(context)!.settings.arguments;

    //search controller
    final searchController = TextEditingController();


    return Scaffold(
      appBar:  AppBar(
        toolbarHeight: 70,
        centerTitle: true,
        title: Text('Eezimedz'),
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
      ),

      drawer: DrawerClass(),

      body:  Padding(padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(children: [
          Material(
            elevation: 2,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: 900,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10)
              ),
              child:  Center(
                child: Text(
                  'My Prescriptions',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20,),

          //search bar
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
                    alignLabelWithHint: true,

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(width: 0.8),
                    ),
                    hintText: 'search by prescription id',
                    suffixIcon: IconButton(icon: Icon(Icons.search, size: 28.0,), onPressed:(){} ,)

                ),
              ),
            ),
          ),

          SizedBox(height: 10),
          BlocConsumer<PrescriptionBloc, PrescriptionState>(
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

                  return
                     Container(
              height: 500,
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          // crossAxisCount: 2,
                          // Number of columns in the grid
                          maxCrossAxisExtent: 186,
                          childAspectRatio: 3/2,
                          crossAxisSpacing: 0.0, // Spacing between columns
                          mainAxisSpacing: 0.0, // Spacing between rows
                        ),
                        itemCount: successState.prescriptions.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(0),
                            child: Column(

                              children: [
                                // SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    PrescriptionCard(
                                      prescriptionName: successState.prescriptions[index].prescriptionDetails.first.medication,

                                      prescriptionID: successState.prescriptions[index].caseNumber,
                                      date: DateFormat('yyyy-MM-dd').format(successState.prescriptions[index].prescriptionDate),
                                      viewFunction: () => showDialog(
                                          context: context,
                                        builder: (context) {
                                          final prescription = successState.prescriptions[index];

                                          return PrescriptionInfo(
                                            date: DateFormat('yyyy-MM-dd').format(prescription.prescriptionDate),
                                            medication: prescription.prescriptionDetails.first?.medication ?? 'N/A',
                                            dosage: prescription.prescriptionDetails.first?.dosage ?? 'N/A',
                                            frequency: prescription.prescriptionDetails.first?.frequency ?? 'N/A',
                                            dosageType: prescription.prescriptionDetails.first?.dosageType ?? 'N/A',
                                            precautions: prescription.nnotes ?? 'N/A',
                                            patientId: prescription.patientId,
                                            patientName: prescription.patientName,
                                            duration: '12 days',
                                          );
                                        },
                                      )),


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

        ],)
        ,
      ),


        bottomNavigationBar: NavBar(),
    );

  }
}

              

