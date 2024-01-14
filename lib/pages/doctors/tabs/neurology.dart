import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/doctorcard.dart';
import '../components/bookdoctor.dart';
import '../components/viewdoctor.dart';
import '../../../services/doctors/doctorservice.dart';
import '../../../models/doctormodel.dart';

class NeurologyTab extends StatelessWidget{
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context){
    return ListView(
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      children: [
        //search bar
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
                  alignLabelWithHint: true,

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(width: 0.8),
                  ),
                  hintText: 'search for your doctor by name',
                  suffixIcon: IconButton(icon: Icon(Icons.search, size: 28.0,), onPressed:(){} ,)

              ),
            ),
          ),
        ),

        SizedBox(height: 10,),

        Consumer<DoctorProvider>(
          builder: (context, DoctorProvider, _){
            List<DoctorModel>? doctor = DoctorProvider.neurology;

            if(doctor == null){
              return Center(child: CircularProgressIndicator(),);
            }else if(doctor.isEmpty){
              return Center(child: Text('Neurologists Not Found'),);
            }else{
              return SizedBox(
                height: 600,
                child: ListView.builder(
                    physics: ClampingScrollPhysics(),
                    padding: EdgeInsets.all(8.0),
                    shrinkWrap: true,
                    itemCount: doctor.length,
                    itemBuilder: (context, index){
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          DoctorCard(
                            imagePath: 'icons/doctor1.jpg',
                            doctorName: doctor[index].personalDetails.firstName,
                            doctorLocation: doctor[index].employmentDetails!.medicalCentreName,
                            doctorNumber: doctor[index].contactDetails.phoneNumbers.first.phoneNumber,
                            viewFunction: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => ViewDoctor(callTime:'8 am - 5pm', doctorLocation:doctor[index].employmentDetails!.medicalCentreName, doctorName: doctor[index].personalDetails.firstName, imagePath: 'icons/doctor1.png' ))),
                            bookFunction: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => BookDoctor(doctorName: doctor[index].personalDetails.firstName))),
                          ),

                          SizedBox(height: 10,),
                        ],
                      );
                    }
                ),
              );
            }
          },
        ),

      ],
    );
  }
}