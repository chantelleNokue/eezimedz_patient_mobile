import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

import '../bloc/appointments_bloc.dart';
import '../components/viewcomponent.dart';
import '../../../models/appointmentsmodel.dart';
import '../../../services/appointments/manageAppointments.dart';
import '../models/appointments.dart';

class Approved extends StatefulWidget {
  final List<AppointmentsModel> appointmentModel;
  const Approved({Key? key, required this.appointmentModel}) : super(key: key);

  State<Approved> createState() => _ApprovedState();
}

class _ApprovedState extends State<Approved> {
  final PrescriptionBloc prescriptionBloc = PrescriptionBloc();

  List<AppointmentsModel> appointments = [];
  bool NewArrayEmpty = false;
  @override
  initState() {
    appointments = widget.appointmentModel
        .where((patient) => patient.status == 'Approved')
        .toList();

    if (appointments.isEmpty) {
      NewArrayEmpty = true;
    } else {
      NewArrayEmpty = false;
    }
    super.initState();
  }

  // Future<List<AppointmentsModel>?> getAppointments() async{
  //   final appointment = await AppointmentsProvider().getAppointments();
  //
  //   if(appointment != null){
  //     for(var item in appointment){
  //       if(item.status == "Approved"){
  //         appointments.add(item);
  //       }
  //     }
  //   }else{
  //     print("Appointments Empty");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        children: [
          Column(
            children: appointments
                .map(
                  (appointment) => Slidable(
                    endActionPane: ActionPane(
                      motion: ScrollMotion(),
                      children: [
                        SlidableAction(
                          icon: Icons.remove_red_eye_outlined,
                          borderRadius: BorderRadius.circular(10),
                          backgroundColor: Colors.blueAccent,
                          label: 'View',
                          onPressed: (context) =>
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => ViewComponent(
                                        firstname: appointment.firstName,
                                        lastname: appointment.lastName,
                                        department: appointment.department,
                                        date: appointment
                                            .preferredAppointmentDate
                                            .toString(),
                                        time: appointment
                                            .preferredAppointmentTime
                                            .toString(),
                                        doctor: appointment.preferredDoctor,
                                        procedure: appointment.procedure,
                                        service: appointment.appliedService
                                            .toString(),
                                        appointmentid:
                                            appointment.appointmentid,
                                      ))),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        SlidableAction(
                          borderRadius: BorderRadius.circular(10),
                          icon: Icons.cancel_sharp,
                          backgroundColor: Colors.redAccent,
                          label: 'Close',
                          onPressed: (context) => print('Close'),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(

                        height: 110,
                        width: 400,
                        // color: Colors.blue[300],
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.lightBlue[100],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${appointment.preferredDoctor} ',
                                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10,),

                                  Text(
                                    '${appointment.procedure} ',
                                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                  ),



                              SizedBox(height: 10,),
                              Row(
                                children: [
                                  Text(
                                    '${appointment.preferredAppointmentDate.toString()}',
                                        style: TextStyle(fontSize: 14, color: Colors.blue[600], fontWeight: FontWeight.bold),
                                  ),

                                  SizedBox(height: 10, width: 30,),
                                  Text(
                                      '${appointment.preferredAppointmentTime}',
                                      style: TextStyle(fontSize: 14, color: Colors.blue[600], fontWeight: FontWeight.bold)
                                  )
                                ],
                              ),

                              SizedBox(height: 10,),
                              Align(
                                alignment: Alignment.bottomRight,
                                child:
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: Colors.blue[900],
                                  ),
                                  child: Text(
                                    '${appointment.status} ',
                                    style: TextStyle(fontSize: 14, color: Colors.white),
                                  ),
                                ),

                              ),

                            ]
                          ),
                        ),
                      ),
                    ),
                    // child: ListTile(
                    //   title: Text(
                    //     '${appointment.procedure} on ${appointment.preferredAppointmentDate.toString()} at ${appointment.preferredAppointmentTime}',
                    //     style: TextStyle(fontSize: 14, color: Colors.grey),
                    //   ),
                    // ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
