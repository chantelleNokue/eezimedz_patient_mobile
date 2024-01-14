import 'package:Eezimedz_Patients/pages/prescriptions/components/medicalSchedule.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dropdown_x/flutter_dropdown_x.dart';
import 'package:intl/intl.dart';

import '../components/drawercomponent.dart';
import '../profile.dart';
import '../components/bottomnavigationbar.dart';
import '../components/listitemsclass.dart';
import '../components/successdialog.dart';
import 'prescriptionsmenu.dart';
import './bloc2/medicalSchedule_bloc.dart';


class RequestPrescription extends StatefulWidget{
  const RequestPrescription({Key ? key}): super(key : key);

  State<RequestPrescription> createState() => _RequestPrescriptionState();
}

class _RequestPrescriptionState extends State<RequestPrescription>{
  //success dialog
  void _showSuccessDialog(context) => showDialog(
    context: context,
    builder: (context) => SuccessDialog(toClass: PrescriptionsMenu()),
  );

  //controllers
  final doctornameController = TextEditingController();
  final emailController = TextEditingController();
  final prescriptionIdController = TextEditingController();
  final reasonController = TextEditingController();

  //variables
  DateTime collectionDate = DateTime.now();
  String? pharmacy;

  final PrescriptionBloc prescriptionBloc = PrescriptionBloc();
  @override
  void initState() {
    prescriptionBloc.add(PrescriptionInitialFetchEvent());
    super.initState();
  }




  @override
  Widget build(BuildContext context){
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

      body:  Container(
        height: 800,
        child: BlocConsumer<PrescriptionBloc, PrescriptionState>(
          bloc: prescriptionBloc,
          listenWhen: (previous, current) => current is PrescriptionActionState,
          buildWhen: (previous, current) => current is! PrescriptionActionState,
          listener: (context, state) {
            // Implementation
          },
          builder: (context, state) {
            switch (state.runtimeType) {
              case PrescriptionfetchingLoadingState:
                return const Center(
                  child: Text('loading'),
                );
              case PrescriptionFetchingSuccessfulState:
                final successState = state as PrescriptionFetchingSuccessfulState;

                if (successState.prescriptions.isEmpty) {
                  return const Center(
                    child: Text('No prescriptions available'),
                  );
                }

                return SizedBox(
                  height: 600,
                  child: ListView.builder(
                    itemCount: successState.prescriptions.length,
                    itemBuilder: (context, index) {
                      final prescription = successState.prescriptions[index];
                      final admissionStartDate = DateTime.parse(prescription.scheduleEndDate);
                      final formattedAdmissionStartDate = admissionStartDate != null
                          ? DateFormat('yyyy-MM-dd').format(admissionStartDate)
                          : 'N/A';

                      final admissionDate = DateTime.parse(prescription.scheduleEndDate);
                      final formattedAdmissionDate = admissionDate != null
                          ? DateFormat('yyyy-MM-dd').format(admissionDate)
                          : 'N/A';

                      return
                          MedicalScheduleCard(
                            dosage: prescription.dosage,
                            weeklySchedule: prescription.daysOfWeek.join(', '),
                            timing: prescription.timeOfAdministration,
                            progress: '0%',
                            endDate: formattedAdmissionDate,
                            drugName: prescription.medicineName,
                            dailyFrequence: prescription.administrationFrequency,
                            startDate: formattedAdmissionStartDate,
                            );




                    },
                  ),
                );
              default:
                return const SizedBox();
            }
          },
        ),
      ),

      bottomNavigationBar: NavBar(),
    );

  }
}