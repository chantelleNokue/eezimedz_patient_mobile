import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../components/drawercomponent.dart';
import '../components/bottomnavigationbar.dart';
import'../profile.dart';
import '../../models/patientmodel.dart';
import '../../services/patient/patientservice.dart';


class MyDetailsPage extends StatefulWidget{

  const MyDetailsPage({Key? key}): super(key : key);

  State<MyDetailsPage> createState() => _MyDetailsPageState();
}

class _MyDetailsPageState extends State<MyDetailsPage>  {

  //custom icon for expansion tile boolean
  bool customIcon = false;
  //TODO: Add patient vitals

  @override
  Widget build(BuildContext context){
    return Scaffold(
            appBar: AppBar(
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
            body:
            SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Consumer<PatientService>(
                    builder:(context, PatientService, _){
                      PatientModel? patients = PatientService.patient;

                      if (patients == null ) {
                        return Center(child: CircularProgressIndicator(),); // Show a loading indicator while fetching data
                      }else {
                            return SingleChildScrollView(
                              child: Column(
                                children: [
                                  Center(
                                    child: Text(
                                      'My Details',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 40,
                                      ),
                                    ),
                                  ),

                                  SizedBox(height: 20,),

                                  SingleChildScrollView(
                                    physics: ClampingScrollPhysics(),
                                    child: Column(
                                        children: <Widget>[

                                          //personal details tile
                                          ExpansionTile(
                                            title: Text('Personal Details'),
                                            childrenPadding: EdgeInsets.all(10),
                                            children: <Widget>[
                                              SingleChildScrollView(
                                                physics: ClampingScrollPhysics(),
                                                child: Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: <Widget>[
                                                    Container(
                                                      width: 350,
                                                      height: 60,
                                                      child: Card(
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius: BorderRadius
                                                                .circular(5),
                                                            side: BorderSide(
                                                                width: 2.0,
                                                                color: Colors.black54
                                                            )
                                                        ),
                                                        child: Padding(
                                                          padding: const EdgeInsets
                                                              .all(12.0),
                                                          child: Center(child: Text(
                                                            'Identification Type: ${patients.personalDetails
                                                                .identificationType}',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black),)),
                                                        ),
                                                      ),
                                                    ),


                                                    Container(
                                                      width: 350,
                                                      height: 60,
                                                      child: Card(
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius: BorderRadius
                                                                .circular(5),
                                                            side: BorderSide(
                                                                width: 2.0,
                                                                color: Colors.black54
                                                            )
                                                        ),
                                                        child: Padding(
                                                          padding: const EdgeInsets
                                                              .all(12.0),
                                                          child: Center(child: Text(
                                                            'Id Number: ${patients
                                                                .personalDetails
                                                                .nationalId}',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black),)),
                                                        ),
                                                      ),
                                                    ),


                                                    Container(
                                                      width: 350,
                                                      height: 60,
                                                      child: Card(
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius: BorderRadius
                                                                .circular(5),
                                                            side: BorderSide(
                                                                width: 2.0,
                                                                color: Colors.black54
                                                            )
                                                        ),
                                                        child: Padding(
                                                          padding: const EdgeInsets
                                                              .all(12.0),
                                                          child: Center(child: Text(
                                                            'Title: ${patients
                                                                .personalDetails
                                                                .title}',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black),)),
                                                        ),
                                                      ),
                                                    ),


                                                    Container(
                                                      width: 350,
                                                      height: 60,
                                                      child: Card(
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius: BorderRadius
                                                                .circular(5),
                                                            side: BorderSide(
                                                                width: 2.0,
                                                                color: Colors.black54
                                                            )
                                                        ),
                                                        child: Padding(
                                                          padding: const EdgeInsets
                                                              .all(12.0),
                                                          child: Center(child: Text(
                                                            'Registration Date: ${DateFormat('yyyy-MM-dd').format(patients.personalDetails.registrationDate)}',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black),)),
                                                        ),
                                                      ),
                                                    ),


                                                    Container(
                                                      width: 350,
                                                      height: 60,
                                                      child: Card(
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius: BorderRadius
                                                                .circular(5),
                                                            side: BorderSide(
                                                                width: 2.0,
                                                                color: Colors.black54
                                                            )
                                                        ),
                                                        child: Padding(
                                                          padding: const EdgeInsets
                                                              .all(12.0),
                                                          child: Center(child: Text(
                                                            'Gender: ${patients
                                                                .personalDetails
                                                                .gender}',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black),)),
                                                        ),
                                                      ),
                                                    ),


                                                    Container(
                                                      width: 350,
                                                      height: 60,
                                                      child: Card(
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius: BorderRadius
                                                                .circular(5),
                                                            side: BorderSide(
                                                                width: 2.0,
                                                                color: Colors.black54
                                                            )
                                                        ),
                                                        child: Padding(
                                                          padding: const EdgeInsets
                                                              .all(12.0),
                                                          child: Center(child: Text(
                                                           'Marital Status: ${ patients
                                                               .personalDetails
                                                               .maritalStatus}',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black),)),
                                                        ),
                                                      ),
                                                    ),


                                                    Container(
                                                      width: 350,
                                                      height: 60,
                                                      child: Card(
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius: BorderRadius
                                                                .circular(5),
                                                            side: BorderSide(
                                                                width: 2.0,
                                                                color: Colors.black54
                                                            )
                                                        ),
                                                        child: Padding(
                                                          padding: const EdgeInsets
                                                              .all(12.0),
                                                          child: Center(child: Text(
                                                            'DOB: ${DateFormat('yyyy-MM-dd').format(patients.personalDetails.dateOfBirth)}',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black),)),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),

                                          SizedBox(height: 20,),

                                          //next of kin tile
                                          ExpansionTile(
                                            title: Text('Next Of Kin Details'),
                                            childrenPadding: EdgeInsets.all(8.0),
                                            children: <Widget>[
                                              Container(
                                                width: 350,
                                                height: 60,
                                                child: Card(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius
                                                          .circular(5),
                                                      side: BorderSide(
                                                          width: 2.0,
                                                          color: Colors.black54
                                                      )
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(
                                                        12.0),
                                                    child: Center(child: Text(
                                                      'Name: ${patients.nextOfKinDetails
                                                          .personalDetails.firstName} ${patients.nextOfKinDetails
                                                          .personalDetails.lastName}',
                                                      style: TextStyle(
                                                          color: Colors.black),)),
                                                  ),
                                                ),
                                              ),

                                              SizedBox(height: 5,),

                                              Container(
                                                width: 350,
                                                height: 60,
                                                child: Card(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius
                                                          .circular(5),
                                                      side: BorderSide(
                                                          width: 2.0,
                                                          color: Colors.black54
                                                      )
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(
                                                        12.0),
                                                    child: Center(child: Text(
                                                      'Relationship: ${patients.nextOfKinDetails
                                                          .personalDetails
                                                          .relationship}',
                                                      style: TextStyle(
                                                          color: Colors.black),)),
                                                  ),
                                                ),
                                              ),

                                              SizedBox(height: 5,),

                                              Container(
                                                width: 350,
                                                height: 60,
                                                child: Card(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius
                                                          .circular(5),
                                                      side: BorderSide(
                                                          width: 2.0,
                                                          color: Colors.black54
                                                      )
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(
                                                        12.0),
                                                    child: Center(child: Text(
                                                      'Occupation: ${patients.nextOfKinDetails
                                                          .personalDetails.occupation}',
                                                      style: TextStyle(
                                                          color: Colors.black),)),
                                                  ),
                                                ),
                                              ),


                                            ],
                                          ),


                                          SizedBox(height: 20,),

                                          //identity details
                                          ExpansionTile(
                                            title: Text('Identity Details'),
                                            childrenPadding: EdgeInsets.all(8.0),
                                            children: <Widget>[

                                              Container(
                                                width: 350,
                                                height: 60,
                                                child: Card(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius
                                                          .circular(5),
                                                      side: BorderSide(
                                                          width: 2.0,
                                                          color: Colors.black54
                                                      )
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(
                                                        12.0),
                                                    child: Center(child: Text(
                                                      patients.identityDetails
                                                          .identificationType
                                                          .toString(),
                                                      style: TextStyle(
                                                          color: Colors.black),)),
                                                  ),
                                                ),
                                              ),

                                              SizedBox(height: 5,),

                                              //displaying id or passport based on identification type
                                              (patients.identityDetails
                                                  .identificationType ==
                                                  'Passport') ?
                                              Container(
                                                width: 350,
                                                height: 60,
                                                child: Card(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius
                                                          .circular(5),
                                                      side: BorderSide(
                                                          width: 2.0,
                                                          color: Colors.black54
                                                      )
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(
                                                        12.0),
                                                    child: Center(child: Text(
                                                      'Passport Number: ${patients.identityDetails.passportDetails
                                                          .passportNumber}',
                                                      style: TextStyle(
                                                          color: Colors.black),)),
                                                  ),
                                                ),
                                              ) :

                                              Container(
                                                width: 350,
                                                height: 60,
                                                child: Card(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius
                                                          .circular(5),
                                                      side: BorderSide(
                                                          width: 2.0,
                                                          color: Colors.black54
                                                      )
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(
                                                        12.0),
                                                    child: Center(child: Text(
                                                     'ID Number: ${patients.identityDetails.nationalIdDetails.nationalIdNumber}',
                                                      style: TextStyle(
                                                          color: Colors.black),)),
                                                  ),
                                                ),
                                              ),


                                              SizedBox(height: 5,),
                                              //id
                                              (patients.identityDetails.identificationType == 'National ID')?
                                                  Column(
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                      SizedBox(height: 5,),

                                                      Container(
                                                        width: 350,
                                                        height: 60,
                                                        child: Card(
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius
                                                                  .circular(5),
                                                              side: BorderSide(
                                                                  width: 2.0,
                                                                  color: Colors.black54
                                                              )
                                                          ),
                                                          child: Padding(
                                                            padding: const EdgeInsets.all(
                                                                12.0),
                                                            child: Center(child: Text(
                                                              'Country Issued: ${patients.identityDetails
                                                                  .nationalIdDetails.countryIdIssued}',
                                                              style: TextStyle(
                                                                  color: Colors.black),)),
                                                          ),
                                                        ),
                                                      ),

                                                      SizedBox(height: 5,),

                                                      Container(
                                                        width: 350,
                                                        height: 60,
                                                        child: Card(
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius
                                                                  .circular(5),
                                                              side: BorderSide(
                                                                  width: 2.0,
                                                                  color: Colors.black54
                                                              )
                                                          ),
                                                          child: Padding(
                                                            padding: const EdgeInsets.all(
                                                                12.0),
                                                            child: Center(child: Text(
                                                              'ID Issued: ${patients
                                                                  .identityDetails
                                                                  .nationalIdDetails.issuedDate}',
                                                              style: TextStyle(
                                                                  color: Colors.black),)),
                                                          ),
                                                        ),
                                                      ),

                                                    ],
                                                  ):
                                                  Container(
                                                    height: 0,
                                                  ),


                                              //passport
                                              (patients.identityDetails
                                                  .identificationType == 'Passport') ?

                                              Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Container(
                                                    width: 350,
                                                    height: 60,
                                                    child: Card(
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius
                                                              .circular(5),
                                                          side: BorderSide(
                                                              width: 2.0,
                                                              color: Colors.black54
                                                          )
                                                      ),
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(
                                                            12.0),
                                                        child: Center(child: Text(
                                                          'Passport Issue Date: ${patients
                                                              .identityDetails
                                                              .passportDetails.issuedDate}',
                                                          style: TextStyle(
                                                              color: Colors.black),)),
                                                      ),
                                                    ),
                                                  ),

                                                  SizedBox(height: 5,),

                                                  Container(
                                                    width: 350,
                                                    height: 60,
                                                    child: Card(
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius
                                                              .circular(5),
                                                          side: BorderSide(
                                                              width: 2.0,
                                                              color: Colors.black54
                                                          )
                                                      ),
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(
                                                            12.0),
                                                        child: Center(child: Text(
                                                          'Passport Expiration Date: ${patients
                                                              .identityDetails
                                                              .passportDetails.expirationDate
                                                              .toString()}',
                                                          style: TextStyle(
                                                              color: Colors.black),)),
                                                      ),
                                                    ),
                                                  ),

                                                ],
                                              ) :

                                              Container(
                                                height: 0,
                                              ),

                                            ],
                                          ),
                                        ]
                                    ),
                                  ),
                                ],
                              ),
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
