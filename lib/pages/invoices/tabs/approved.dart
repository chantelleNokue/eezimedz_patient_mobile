import 'package:Eezimedz_Patients/pages/invoices/components/resultcard.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';


import '../bloc/invoices_bloc.dart';
import '../components/viewComponent.dart';
import '../../../models/surgerymodel.dart';
import '../../../services/invoices/invoiceservice.dart';
import '../components/viewDataInvoices.dart';
import '../model/invoicesmodel.dart';


class ApprovedTab extends StatefulWidget{
  final List<InvoicesModel> appointmentModel;
  const ApprovedTab({Key ? key, required this.appointmentModel}): super(key : key);

  State<ApprovedTab> createState() => _ApprovedTabState();
}

class _ApprovedTabState extends State<ApprovedTab>{
  final searchController = TextEditingController();

  final PrescriptionBloc prescriptionBloc = PrescriptionBloc();

  List<InvoicesModel> appointments = [];
  bool NewArrayEmpty = false;
  @override
  initState() {
    appointments = widget.appointmentModel
        .where((patient) => patient.statuses.status == 'Paid')
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
          mainAxisSize: MainAxisSize.max,
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
                                          invoiceDate: invoiceDetails.invoiceDate != null ? DateFormat('yyyy-MM-dd').format(DateTime.parse(invoiceDetails.invoiceDate)) : '',                                          invoiceNumber: invoiceDetails.invoiceid ?? '',
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
            //   child: Provider<InvoiceProvider>(
            //     create: (_) => InvoiceProvider(),
            //     child: Consumer<InvoiceProvider>(
            //
            //       builder: (context, SurgeryProvider, _){
            //         List<InvoicesModel>? surgery = InvoiceProvider().approved;
            //
            //         if(surgery == null){
            //           return Center(child: CircularProgressIndicator(),);
            //         }else if(surgery.isEmpty){
            //           return Center(child: Text('Invoices not found'));
            //         }else{
            //           return  ListView.builder(
            //             physics: AlwaysScrollableScrollPhysics(),
            //             padding: EdgeInsets.all(8.0),
            //             shrinkWrap: true,
            //             itemCount: surgery.length,
            //             itemBuilder: (context, index){
            //               return Column(
            //                 mainAxisSize: MainAxisSize.min,
            //                 children: [
            //                   ResultCard(
            //                    invoiceType: surgery[index].invoiceDetails.invoiceType,
            //                     invoiceDate: surgery[index].invoiceDetails.dueDate,
            //                     productName: surgery[index].invoiceDetails.products.first.name,
            //                     viewFunction: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => SizedBox(
            //                       height: 20,
            //                       child: Text('data'),
            //                     )
            //                     )),
            //                   ),
            //
            //                   SizedBox(height: 10,),
            //                 ],
            //               );
            //
            //             },
            //
            //           );
            //         }
            //       },
            //     ),
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

