import 'package:flutter/material.dart';

import '../bloc/appointments_bloc.dart';
import '../components/viewquotationcard.dart';
import '../model/quotation.dart';

class PendingTab extends StatefulWidget {
  final List<QuotationModel> appointmentModel;
  const PendingTab({super.key, required this.appointmentModel});

  @override
  State<PendingTab> createState() => _PendingTabState();
}

class _PendingTabState extends State<PendingTab> {
  final QuotationBloc prescriptionBloc = QuotationBloc();

  List<QuotationModel> appointments = [];
  bool NewArrayEmpty = false;
  @override
  initState() {
    appointments = widget.appointmentModel
        .where((patient) => patient.quotationDetails.status == 'Pending')
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


