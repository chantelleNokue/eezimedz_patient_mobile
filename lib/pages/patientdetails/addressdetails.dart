import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../profile.dart';
import '../components/bottomnavigationbar.dart';
import '../components/drawercomponent.dart';
import '../../models/patientmodel.dart';
import '../../services/patient/patientservice.dart';

class AddressDetails extends StatefulWidget{
  const AddressDetails({Key ? key}): super(key : key);

  State<AddressDetails> createState() => _AddressDetailsState();
}

class _AddressDetailsState extends State<AddressDetails>{
  //TODO: Add edit my address details functionality i.e screen and api call
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        centerTitle: true,
        title: Text('My Details'),
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Consumer<PatientService>(
            builder:(context, PatientService, _){
              PatientModel? patients = PatientService.patient;

              if(patients == null){
                return Center(child: CircularProgressIndicator(),);
              }else{
                return Column(
                      children: [
                        Center(
                          child: Text(
                            'My Address Details',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 24,
                            ),
                          ),
                        ),

                        SizedBox(height: 25,),

                        Container(
                          width: 900,
                          height: 60,
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            color: Colors.blueGrey.withOpacity(0.4),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Street Address:', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),),

                                Text(patients.contactDetails.addressDetails.first.streetAddress, style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15),),
                              ],
                            ),
                          ),
                        ),

                        SizedBox(height: 13,),

                        Container(
                          width: 900,
                          height: 60,
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            color: Colors.blueGrey.withOpacity(0.4),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('City:', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),),

                                Text(patients.contactDetails.addressDetails.first.city, style: TextStyle(fontWeight: FontWeight.w200, fontSize: 15),),
                              ],
                            ),
                          ),
                        ),

                        SizedBox(height: 13,),


                        Container(
                          width: 900,
                          height: 60,
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            color: Colors.blueGrey.withOpacity(0.4),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Country:', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),),

                                Text(patients.contactDetails.addressDetails.first.country, style: TextStyle(fontWeight: FontWeight.w200, fontSize: 15),),
                              ],
                            ),
                          ),
                        ),

                        SizedBox(height: 13,),


                        Container(
                          width: 900,
                          height: 60,
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            color: Colors.blueGrey.withOpacity(0.4),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Region:', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),),

                                Text(patients.contactDetails.addressDetails.first.region, style: TextStyle(fontWeight: FontWeight.w200, fontSize: 15),),
                              ],
                            ),
                          ),
                        ),

                        SizedBox(height: 13,),


                        Container(
                          width: 900,
                          height: 60,
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            color: Colors.blueGrey.withOpacity(0.4),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Zip Code:', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),),

                                Text(patients.contactDetails.addressDetails.first.zip, style: TextStyle(fontWeight: FontWeight.w200, fontSize: 15),),
                              ],
                            ),
                          ),
                        ),

                        SizedBox(height: 13,),


                        Container(
                          width: 900,
                          height: 60,
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            color: Colors.blueGrey.withOpacity(0.4),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Start Date:', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),),

                                Text(DateFormat('yyyy-MM-dd').format(patients.contactDetails.addressDetails.first.startDate), style: TextStyle(fontWeight: FontWeight.w200, fontSize: 15),),
                              ],
                            ),
                          ),
                        ),

                        SizedBox(height: 13,),


                        Container(
                          width: 900,
                          height: 60,
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            color: Colors.blueGrey.withOpacity(0.4),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('End Date:', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),),

                                Text(DateFormat('yyyy-MM-dd').format(patients.contactDetails.addressDetails.first.startDate), style: TextStyle(fontWeight: FontWeight.w200, fontSize: 15),),
                              ],
                            ),
                          ),
                        ),


                      ],
                    );

              }
            },

          ),
        ),
      ),

      bottomNavigationBar: NavBar(),
    );
  }

}

