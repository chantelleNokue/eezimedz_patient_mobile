import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../bloc/invoices_bloc.dart';
import '../components/resultcard.dart';
import '../components/viewComponent.dart';
import '../../../models/surgerymodel.dart';
import '../../../services/surgeries/surgeryservice.dart';
import '../components/viewDataInvoices.dart';
import '../model/invoicesmodel.dart';


class CancelledTab extends StatefulWidget{
  final List<InvoicesModel> appointmentModel;
  const CancelledTab({Key ? key, required this.appointmentModel}): super(key : key);

  State<CancelledTab> createState() => _CancelledTabState();
}

class _CancelledTabState extends State<CancelledTab>{
  final searchController = TextEditingController();

  final PrescriptionBloc prescriptionBloc = PrescriptionBloc();

  List<InvoicesModel> appointments = [];
  bool NewArrayEmpty = false;
  @override
  initState() {
    appointments = widget.appointmentModel
        .where((patient) => patient.statuses.status == 'Declined')
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
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //search bar
            SizedBox(
              height: 80,
              child: //search bar
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: searchController,
                    onChanged: (value){

                    },
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
                        alignLabelWithHint: true,

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide(width: 0.8),
                        ),
                        hintText: 'Search By Doctor Name',
                        suffixIcon: IconButton(icon: Icon(Icons.search, size: 28.0,), onPressed:(){} ,)

                    ),
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 500,
              child: ListView(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                children: [
                  Column(
                    children: appointments
                        .map(
                          (appointment) =>
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ResultCard(
                              invoiceType: appointment.invoiceDetails.invoiceType ?? 'N/A',
                                invoiceDate: appointment.invoiceDetails.invoiceDate != null ? DateFormat('yyyy-MM-dd').format(DateTime.parse(appointment.invoiceDetails.invoiceDate)) : 'N/A',

                                productName: appointment.invoiceDetails.products.isNotEmpty
                                  ? appointment.invoiceDetails.products.first.name
                                  : 'N/A',
                                status: appointment.statuses.status,
                                total: appointment.invoiceDetails.total.toString(),
                                viewFunction: () {
                                  if (appointment != null && appointment.invoiceDetails != null) {
                                    final invoiceDetails = appointment.invoiceDetails;
                                    final products = invoiceDetails.products;

                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ViewDataInvoices(
                                      firstname: invoiceDetails.patientFirstName ?? '',
                                      lastName: invoiceDetails.patientlastName ?? '',
                                      nationalID: invoiceDetails.patientNationalId ?? '',
                                      patientID: invoiceDetails.patientId ?? '',
                                      invoiceDate: invoiceDetails.invoiceDate != null ? DateFormat('yyyy-MM-dd').format(DateTime.parse(invoiceDetails.invoiceDate)) : '',                                      invoiceNumber: invoiceDetails.invoiceid ?? '',
                                      paymentDue: invoiceDetails.total?.toString() ?? '',
                                      amountDue: invoiceDetails.subtotal?.toString() ?? '',
                                      producrName: products.isNotEmpty ? products.first.name ?? '' : '',
                                      price: products.isNotEmpty ? products.first.price?.toString() ?? '' : '',
                                      tax: products.isNotEmpty ? products.first.tax?.toString() ?? '' : '',
                                      discount: products.isNotEmpty ? products.first.discount?.toString() ?? '' : '',
                                      subTotals: invoiceDetails.subtotal?.toString() ?? '',
                                    )));
                                  }
                                }
                            ),
                          ),

                    )
                        .toList(),

                  ),

                ],
              ),
            ),

            // SizedBox(
            //   height: 600,
            //   child: Consumer<SurgeryProvider>(
            //     builder: (context, SurgeryProvider, _){
            //       List<SurgeryModel>? surgery = SurgeryProvider.cancelled;
            //
            //       if(surgery == null){
            //         return Center(child: CircularProgressIndicator(),);
            //       }else if(surgery.isEmpty){
            //         return Center(child: Text('Surgeries not found'));
            //       }else{
            //         return  ListView.builder(
            //           physics: AlwaysScrollableScrollPhysics(),
            //           padding: EdgeInsets.all(8.0),
            //           shrinkWrap: true,
            //           itemCount: surgery.length,
            //           itemBuilder: (context, index){
            //             return Column(
            //               mainAxisSize: MainAxisSize.min,
            //               children: [
            //                 ViewComponent(
            //                   doctorName: surgery[index].doctorName,
            //                   surgeryDate: surgery[index].surgeryDate.toString(),
            //                   surgeryType: surgery[index].surgeryType,
            //                   surgeryVenue: surgery[index].location,
            //                   description: surgery[index].surgeryDescription,
            //                 ),
            //
            //                 SizedBox(height: 10,),
            //               ],
            //             );
            //
            //           },
            //
            //         );
            //       }
            //     },
            //   ),
            //
            //
            // ),

          ],
        ),
      ),
    );
  }
}

