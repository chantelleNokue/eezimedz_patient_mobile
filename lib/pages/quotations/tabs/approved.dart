import 'package:flutter/material.dart';

import '../bloc/appointments_bloc.dart';
import '../components/viewquotationcard.dart';
import '../model/quotation.dart';

class ApprovedTab extends StatefulWidget {
  final List<QuotationModel> appointmentModel;
  const ApprovedTab({super.key, required this.appointmentModel});

  @override
  State<ApprovedTab> createState() => _ApprovedTabState();
}

class _ApprovedTabState extends State<ApprovedTab> {
  final QuotationBloc prescriptionBloc = QuotationBloc();

  List<QuotationModel> appointments = [];
  bool NewArrayEmpty = false;
  @override
  initState() {
    appointments = widget.appointmentModel
        .where((patient) => patient.quotationDetails.status == 'Approved')
        .toList();

    if (appointments.isEmpty) {
      NewArrayEmpty = true;
    } else {
      NewArrayEmpty = false;
    }
    super.initState();
  }
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
                  (appointment) =>
        ViewCard(
              status: appointment.quotationDetails.status,
              date: appointment.quotationDetails.invoiceDate.toString(),
              dueDate: appointment.quotationDetails.dueDate,
              immediatePaymemt: appointment.statuses?.status,
              products: appointment.quotationDetails.products.first.name,
              patientName: appointment.quotationDetails.patientName,
              total: appointment.quotationDetails.total.toString(),
              currency: appointment.quotationDetails.currency,
            ),

            )
                .toList(),

          ),

        ],
      ),
    );
  }
}


// class ApprovedTab extends StatelessWidget{
//   final QuotationBloc prescriptionBloc = QuotationBloc();
//
//   List<QuotationModel> appointments = [];
//   bool NewArrayEmpty = false;
//   @override
//   initState() {
//     appointments = widget.appointmentModel
//         .where((patient) => patient.quotationDetails.status == 'Approved')
//         .toList();
//
//     if (appointments.isEmpty) {
//       NewArrayEmpty = true;
//     } else {
//       NewArrayEmpty = false;
//     }
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(12.0),
//       child: SingleChildScrollView(
//         physics: AlwaysScrollableScrollPhysics(),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//
//             ViewCard(
//               status: 'Approved',
//               date: '2023-07-31',
//               dueDate: '2023-08-01',
//               immediatePaymemt: 'No',
//               products: 'Allergy Relief',
//               patientName: 'Nyasha Chaingei',
//               total: '235',
//               currency: 'USD',
//             ),
//
//             SizedBox(height: 10,),
//
//             ViewCard(
//               status: 'Approved',
//               date: '2023-07-31',
//               dueDate: '2023-08-01',
//               immediatePaymemt: 'Yes',
//               products: 'Allergy Relief',
//               patientName: 'Nyasha Chaingei',
//               total: '235',
//               currency: 'USD',
//             ),
//
//           ],
//         ),
//       ),
//     );
//   }
// }