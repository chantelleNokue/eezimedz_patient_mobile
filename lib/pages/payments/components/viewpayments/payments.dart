import 'package:Eezimedz_Patients/pages/payments/components/paymentCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/payments_bloc.dart';
import 'paymentinfo.dart';

class Payments extends StatefulWidget {
  const Payments({Key? key}) : super(key: key);

  State<Payments> createState() => _PaymentsState();
}

class _PaymentsState extends State<Payments> {
  //searchbar controller
  final searchController = TextEditingController();

  final PrescriptionBloc prescriptionBloc = PrescriptionBloc();
  @override
  void initState() {
    prescriptionBloc.add(PrescriptionInitialFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: <Widget>[
          //search bar
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(width: 0.8),
                    ),
                    hintText: 'search by invoice number',
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.search,
                        size: 28.0,
                      ),
                      onPressed: () {},
                    )),
              ),
            ),
          ),

          SizedBox(
            height: 15,
          ),
          BlocConsumer<PrescriptionBloc, PrescriptionState>(
            bloc: prescriptionBloc,
            listenWhen: (previous, current) =>
                current is PrescriptionActionState,
            buildWhen: (previous, current) =>
                current is! PrescriptionActionState,
            listener: (context, state) {
              //implementation
            },
            builder: (context, state) {
              switch (state.runtimeType) {
                case PrescriptionfetchingLoadingState:
                  return const Center(
                    child: Text('loading'),
                  );
                case PrescriptionFetchingSuccessfulState:
                  final successState =
                      state as PrescriptionFetchingSuccessfulState;

                  return Container(
                    height: 420,
                    child: ListView.builder(
                      // gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      //   // crossAxisCount: 2,
                      //   // Number of columns in the grid
                      //   maxCrossAxisExtent: 186,
                      //   childAspectRatio: 3/2,
                      //   crossAxisSpacing: 0.0, // Spacing between columns
                      //   mainAxisSpacing: 0.0, // Spacing between rows
                      // ),
                      itemCount: successState.prescriptions.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                title: Text('Payment Details'),
                                content: PaymentInfo(
                                  invoice: successState
                                      .prescriptions[index].invoiceNumber,
                                  reference: successState
                                      .prescriptions[index].paymentReference,
                                  department: successState
                                      .prescriptions[index].department,
                                  payment: successState
                                      .prescriptions[index].paymentType,
                                  amount:
                                      successState.prescriptions[index].amount,
                                  date: successState
                                      .prescriptions[index].dateOfPayment
                                      .toString(),
                                ),
                                actions: [
                                  TextButton(
                                    child: Text('Close'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: PaymentCard(
                        invoiceNumber: successState.prescriptions[index].invoiceNumber,
                        amount: successState.prescriptions[index].amount,
                        department: successState.prescriptions[index].department,

                            )

                            // Material(
                            //   elevation: 1,
                            //   borderRadius: BorderRadius.circular(12),
                            //   child: Container(
                            //     height: 50,
                            //     width: 900,
                            //     decoration: BoxDecoration(
                            //       borderRadius: BorderRadius.circular(12),
                            //       color: Colors.blueGrey,
                            //     ),
                            //     child: Padding(
                            //       padding: const EdgeInsets.all(8.0),
                            //       child:
                            //       Row(
                            //         mainAxisAlignment:
                            //             MainAxisAlignment.spaceEvenly,
                            //         children: <Widget>[
                            //           // Expanded(
                            //           //     child: Text(
                            //           //   '${successState.prescriptions[index].amount} Payment to the ${successState.prescriptions[index].department} Department',
                            //           //   style: TextStyle(color: Colors.black),
                            //           //       maxLines: 2,
                            //           // )),
                            //           PaymentCard(
                            //             invoiceNumber: successState.prescriptions[index].invoiceNumber,
                            //             amount: successState.prescriptions[index].amount,
                            //             department: successState.prescriptions[index].department,
                            //
                            //           ),
                            //           Icon(Icons.arrow_forward_ios,
                            //               color: Colors.black)
                            //         ],
                            //       ),
                            //     ),
                            //   ),
                            // ),
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

          // Column(
          //   mainAxisSize: MainAxisSize.min,
          //   children: <Widget>[
          //
          //     //TODO: Make department and amounts dynamic
          //     GestureDetector(
          //       onTap: () => showDialog(
          //         context: context,
          //         builder: (BuildContext context) {
          //           return AlertDialog(
          //             shape: RoundedRectangleBorder(
          //                 borderRadius: BorderRadius.circular(10)
          //             ),
          //             title: Text('Payment Details'),
          //             content:
          //             PaymentInfo(
          //               invoice: 'APP302218',
          //               reference: '2345678',
          //               department: 'Surgery',
          //               payment: 'Cash',
          //               amount: 'R20 000',
          //               date: '2023-01-23',
          //             ),
          //             actions: [
          //               TextButton(
          //                 child: Text('Close'),
          //                 onPressed: () {
          //                   Navigator.of(context).pop();
          //                 },
          //               ),
          //             ],
          //           );
          //         },
          //       ),
          //       child: Material(
          //         elevation: 1,
          //         borderRadius: BorderRadius.circular(12),
          //         child: Container(
          //           height: 50,
          //           width: 900,
          //           decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(12),
          //             color: Colors.blueGrey,
          //           ),
          //           child: Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //             children: <Widget>[
          //               Text('R20 000 Payment to the Surgery Department', style: TextStyle(color: Colors.black),),
          //
          //               Icon(Icons.arrow_forward_ios, color: Colors.black)
          //
          //             ],
          //           ),
          //         ),
          //       ),
          //     ),
          //
          //     SizedBox(height: 10,),
          //
          //     GestureDetector(
          //       onTap:() => showDialog(
          //         context: context,
          //         builder: (BuildContext context) {
          //           return AlertDialog(
          //             shape: RoundedRectangleBorder(
          //                 borderRadius: BorderRadius.circular(10)
          //             ),
          //             title: Text('Payment Details'),
          //             content:
          //             PaymentInfo(
          //               invoice: 'APP405117',
          //               reference: '567810',
          //               department: 'Cardiology',
          //               payment: 'Card',
          //               amount: 'R5000',
          //               date: '2023-07-01',
          //             ),
          //             actions: [
          //               TextButton(
          //                 child: Text('Close'),
          //                 onPressed: () {
          //                   Navigator.of(context).pop();
          //                 },
          //               ),
          //             ],
          //           );
          //         },
          //       ),
          //       child: Material(
          //         elevation: 1,
          //         borderRadius: BorderRadius.circular(12),
          //         child: Container(
          //           height: 50,
          //           width: 900,
          //           decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(12),
          //             color: Colors.blueGrey,
          //           ),
          //           child: Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //             children: <Widget>[
          //               Text('R5 000 Payment to the Cardiology Department', style: TextStyle(color: Colors.black),),
          //
          //               Icon(Icons.arrow_forward_ios, color: Colors.black,)
          //
          //             ],
          //           ),
          //
          //         ),
          //       ),
          //     ),
          //
          //
          //     SizedBox(height: 10,),
          //
          //     GestureDetector(
          //       onTap: () => showDialog(
          //         context: context,
          //         builder: (BuildContext context) {
          //           return AlertDialog(
          //             shape: RoundedRectangleBorder(
          //                 borderRadius: BorderRadius.circular(10)
          //             ),
          //             title: Text('Payment Details'),
          //             content:
          //             PaymentInfo(
          //               invoice: 'APP467891',
          //               reference: '985431',
          //               department: 'Radiology',
          //               payment: 'Transfer',
          //               amount: 'R6000',
          //               date: '2022-12-05',
          //             ),
          //             actions: [
          //               TextButton(
          //                 child: Text('Close'),
          //                 onPressed: () {
          //                   Navigator.of(context).pop();
          //                 },
          //               ),
          //             ],
          //           );
          //         },
          //       ),
          //       child: Material(
          //         elevation: 1,
          //         borderRadius: BorderRadius.circular(12),
          //         child: Container(
          //           height: 50,
          //           width: 900,
          //           decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(12),
          //             color: Colors.blueGrey,
          //           ),
          //           child:Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //             children: <Widget>[
          //               Text('R6 000 Payment to the Radiology Department', style: TextStyle(color: Colors.black),),
          //
          //               Icon(Icons.arrow_forward_ios, color: Colors.black)
          //
          //             ],
          //           ),
          //
          //         ),
          //       ),
          //     ),
          //
          //     SizedBox(height: 10,),
          //
          //     GestureDetector(
          //       onTap: () => showDialog(
          //         context: context,
          //         builder: (BuildContext context) {
          //           return AlertDialog(
          //             shape: RoundedRectangleBorder(
          //                 borderRadius: BorderRadius.circular(10)
          //             ),
          //             title: Text('Payment Details'),
          //             content:
          //             PaymentInfo(
          //               invoice: 'APP678942',
          //               reference: '5632041',
          //               department: 'Oncology',
          //               payment: 'Card',
          //               amount: 'R6000',
          //               date: '2022-12-05',
          //             ),
          //             actions: [
          //               TextButton(
          //                 child: Text('Close'),
          //                 onPressed: () {
          //                   Navigator.of(context).pop();
          //                 },
          //               ),
          //             ],
          //           );
          //         },
          //       ),
          //       child: Material(
          //         elevation: 1,
          //         borderRadius: BorderRadius.circular(12),
          //         child: Container(
          //           height: 50,
          //           width: 900,
          //           decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(12),
          //             color: Colors.blueGrey,
          //           ),
          //           child:  Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //             children: <Widget>[
          //               Text('R6 000 Payment to the Oncology Department', style: TextStyle(color: Colors.black),),
          //
          //               Icon(Icons.arrow_forward_ios, color: Colors.black)
          //
          //             ],
          //           ),
          //
          //         ),
          //       ),
          //     ),
          //
          //     SizedBox(height: 10,),
          //
          //
          //     GestureDetector(
          //       onTap: () => showDialog(
          //         context: context,
          //         builder: (BuildContext context) {
          //           return AlertDialog(
          //             shape: RoundedRectangleBorder(
          //                 borderRadius: BorderRadius.circular(10)
          //             ),
          //             title: Text('Payment Details'),
          //             content:
          //             PaymentInfo(
          //               invoice: 'APP678632',
          //               reference: '568965',
          //               department: 'Oncology',
          //               payment: 'Cash',
          //               amount: 'R3000',
          //               date: '2022-12-05',
          //             ),
          //             actions: [
          //               TextButton(
          //                 child: Text('Close'),
          //                 onPressed: () {
          //                   Navigator.of(context).pop();
          //                 },
          //               ),
          //             ],
          //           );
          //         },
          //       ),
          //       child: Material(
          //         elevation: 1,
          //         borderRadius: BorderRadius.circular(12),
          //         child: Container(
          //           height: 50,
          //           width: 900,
          //           decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(12),
          //             color: Colors.blueGrey,
          //           ),
          //           child: Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //             children: <Widget>[
          //               Text('R3 000 Payment to the Oncology Department', style: TextStyle(color: Colors.black),),
          //
          //               Icon(Icons.arrow_forward_ios, color: Colors.black,)
          //
          //             ],
          //           ),
          //         ),
          //       ),
          //     ),
          //
          //
          //     SizedBox(height: 10,),
          //
          //     GestureDetector(
          //       onTap: () => showDialog(
          //         context: context,
          //         builder: (BuildContext context) {
          //           return AlertDialog(
          //             shape: RoundedRectangleBorder(
          //                 borderRadius: BorderRadius.circular(10)
          //             ),
          //             title: Text('Payment Details'),
          //             content:
          //             PaymentInfo(
          //               invoice: 'APP320976',
          //               reference: '320965',
          //               department: 'Radiology',
          //               payment: 'Cash',
          //               amount: 'R20 00',
          //               date: '2023-05-05',
          //             ),
          //             actions: [
          //               TextButton(
          //                 child: Text('Close'),
          //                 onPressed: () {
          //                   Navigator.of(context).pop();
          //                 },
          //               ),
          //             ],
          //           );
          //         },
          //       ),
          //       child: Material(
          //         elevation: 1,
          //         borderRadius: BorderRadius.circular(12),
          //         child: Container(
          //           height: 50,
          //           width: 900,
          //           decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(12),
          //             color: Colors.blueGrey,
          //           ),
          //           child: Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //             children: <Widget>[
          //               Text('R20 000 Payment to the Radiology Department', style: TextStyle(color: Colors.black),),
          //
          //               Icon(Icons.arrow_forward_ios, color:Colors.black,)
          //
          //             ],
          //           ),
          //
          //         ),
          //       ),
          //     ),
          //
          //     SizedBox(height: 10,),
          //
          //     GestureDetector(
          //       onTap: () => showDialog(
          //         context: context,
          //         builder: (BuildContext context) {
          //           return AlertDialog(
          //             shape: RoundedRectangleBorder(
          //                 borderRadius: BorderRadius.circular(10)
          //             ),
          //             title: Text('Payment Details'),
          //             content:
          //             PaymentInfo(
          //               invoice: 'APP670932',
          //               reference: '905421',
          //               department: 'Surgery',
          //               payment: 'Card',
          //               amount: 'R100 000',
          //               date: '2023-06-24',
          //             ),
          //             actions: [
          //               TextButton(
          //                 child: Text('Close'),
          //                 onPressed: () {
          //                   Navigator.of(context).pop();
          //                 },
          //               ),
          //             ],
          //           );
          //         },
          //       ),
          //       child: Material(
          //         elevation: 1,
          //         borderRadius: BorderRadius.circular(12),
          //         child: Container(
          //           height: 50,
          //           width: 900,
          //           decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(12),
          //             color: Colors.blueGrey,
          //           ),
          //           child:Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //             children: <Widget>[
          //               Text('R100 000 Payment to the Surgery Department',style: TextStyle(color: Colors.black),),
          //
          //               Icon(Icons.arrow_forward_ios, color: Colors.black,)
          //
          //             ],
          //           ),
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
