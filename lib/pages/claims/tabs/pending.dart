import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


import '../components/newclaimcomponent.dart';
import '../components/viewcomponent.dart';
import '../model/claimsModel.dart';
import '../bloc/claims_bloc.dart';



class Pending extends StatefulWidget{
  final List<ClaimsModel> appointmentModel;
  const Pending({Key ? key, required this.appointmentModel}): super(key : key);

  State<Pending> createState() => _PendingState();
}

class _PendingState extends State<Pending>{

  final PrescriptionBloc prescriptionBloc = PrescriptionBloc();

  List<ClaimsModel> appointments = [];
  bool NewArrayEmpty = false;
  @override
  initState() {
    appointments = widget.appointmentModel
        .where((patient) => patient.claimDetails.claimStatus== 'In Review')
        .toList();

    if (appointments.isEmpty) {
      NewArrayEmpty = true;
    } else {
      NewArrayEmpty = false;
    }
    super.initState();
  }

  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [

          SizedBox(
            height: 65,
            child: //search bar
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: searchController,
                  onChanged: (value){
                    //_filterData(value);
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
                    alignLabelWithHint: true,

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(width: 0.8),
                    ),
                    hintText: 'Search By Claimant Name',
                    suffixIcon: IconButton(icon: Icon(Icons.search, size: 28.0,), onPressed:(){} ,),
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
                    child: NewClaimComponent(
patientImage: appointment.claimantDetails.patientImage,
                      providerName: appointment.claimDetails.hospitalizationDetails.hospitalName,
                      admissiondate: DateFormat('yyyy-MM-dd').format(appointment.claimDetails.hospitalizationDetails.admissionDate),
                      policyid: appointment.claimantDetails.policyNumber,


                      status: appointment.claimDetails.claimStatus,
                      actionfunction: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => ViewComponent(
                        amount: '\$ ${appointment.claimDetails.claimedAmount}',
                        address: appointment.claimantDetails.streetAddress,
                        group: 'Blue Cross',
                        incident: appointment.claimDetails.hospitalizationDetails.hospitalizationReason,
                        network: 'First Health Check',
                        payername: appointment.claimantDetails.firstName,
                        phonenumber: appointment.claimantDetails.phoneNumber,
                        provider: appointment.claimDetails.hospitalizationDetails.hospitalName,
                        receiveddate: DateFormat('yyyy-MM-dd').format(appointment.claimDetails.hospitalizationDetails.admissionDate),

                        paymenttype: 'Credit',
                        holdername: 'Munashe Moffat',
                        accountnumber: '273832328',
                        branch: '4837',
                        branchcode: '3273',
                        currency: 'USD',
                      ))),
                    ),
                  ),

        )
            .toList(),

      ),

    ],
  ),
),
          // SizedBox(
          //   height: 500,
          //   child: ListView(
          //     padding: EdgeInsets.all(5),
          //     physics: ClampingScrollPhysics(),
          //     shrinkWrap: true,
          //     children: [
          //       ClaimComponent(
          //         claimid: '64DD1701',
          //         policyid: 'KV123423T',
          //         creationdate: '2023-08-16',
          //         status: 'In Review',
          //         actionfunction: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => ViewComponent(
          //           amount: '\$300',
          //           address: '15 Brentwood',
          //           group: 'Blue Cross',
          //           incident: 'Fell from a tree',
          //           network: 'First Health Check',
          //           payername: 'Munashe Moffat',
          //           phonenumber: '+263773368966',
          //           provider: 'George Medical',
          //           receiveddate: '2023-08-16',
          //           paymenttype: 'Credit',
          //           holdername: 'Munashe Moffat',
          //           accountnumber: '273832328',
          //           branch: '4837',
          //           branchcode: '3273',
          //           currency: 'USD',
          //         ))),
          //       ),
          //
          //       SizedBox(height: 10,),
          //
          //       ClaimComponent(
          //         claimid: '64DE0C7F',
          //         policyid: 'PDB145WE',
          //         creationdate: '2023-08-17',
          //         status: 'In Review',
          //         actionfunction: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => ViewComponent(
          //         amount: '\$300',
          //           address: '15 Brentwood',
          //           group: 'Blue Cross',
          //           incident: 'Fell from a tree',
          //           network: 'First Health Check',
          //           payername: 'Munashe Moffat',
          //           phonenumber: '+263773368966',
          //           provider: 'George Medical',
          //           receiveddate: '2023-08-16',
          //           paymenttype: 'Credit',
          //           holdername: 'Munashe Moffat',
          //           accountnumber: '273832328',
          //           branch: '4837',
          //           branchcode: '3273',
          //           currency: 'USD',
          //       ))),
          //       ),
          //
          //       SizedBox(height: 10,),
          //
          //       ClaimComponent(
          //         claimid: '64DE3C4C',
          //         policyid: 'PDB145WE',
          //         creationdate: '2023-08-17',
          //         status: 'In Review',
          //         actionfunction: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => ViewComponent(
          //           amount: '\$300',
          //           address: '15 Brentwood',
          //           group: 'Blue Cross',
          //           incident: 'Fell from a tree',
          //           network: 'First Health Check',
          //           payername: 'Munashe Moffat',
          //           phonenumber: '+263773368966',
          //           provider: 'George Medical',
          //           receiveddate: '2023-08-16',
          //           paymenttype: 'Credit',
          //           holdername: 'Munashe Moffat',
          //           accountnumber: '273832328',
          //           branch: '4837',
          //           branchcode: '3273',
          //           currency: 'USD',
          //         ))),
          //       ),
          //     ],
          //   ),
          // ),


        ],
      ),
    );
  }
}
