import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget{
  final String? imagePath;
  final String? doctorName;
  final String? doctorLocation;
  final String? doctorNumber;
  final viewFunction;
  final bookFunction;

  DoctorCard({
    this.imagePath,
    this.doctorName,
    this.doctorLocation,
    this.doctorNumber,
    this.viewFunction,
    this.bookFunction
});


  @override
  Widget build(BuildContext context){
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 7.0, horizontal: 10.0),
          child: Material(
            elevation: 3,
            borderRadius: BorderRadius.circular(12),
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  //Picture Of Doctor
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      imagePath!,
                      width: 95,
                      height: 95,
                      fit: BoxFit.cover,
                    ),
                  ),

                  SizedBox(width: 20,),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Doctor Name
                      Text(
                        doctorName!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),

                      SizedBox(height: 12,),

                      //doctor's location
                     Row(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       mainAxisSize: MainAxisSize.min,
                       children: [
                         Icon(Icons.location_on, size: 19,),

                         SizedBox(width: 9,),

                         Text(doctorLocation!, style: TextStyle(fontSize: 15),),
                       ],
                     ),

                      SizedBox(height: 13,),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                       mainAxisSize: MainAxisSize.min,
                       children: [
                         Icon(Icons.phone, size: 19, ),

                         SizedBox(width: 9,),

                         Text(doctorNumber!, style: TextStyle(fontSize: 15)),
                       ],
                     ),

                      SizedBox(height: 10,),

                      Row(
                        children: [
                          ElevatedButton(
                            child: Text('View'),
                            onPressed: viewFunction,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(23)
                              )
                            ),
                          ),

                          SizedBox(width: 25,),

                          ElevatedButton(
                            child: Text('Book'),
                            onPressed: bookFunction,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(23)
                              )
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                ],

              ),
            ),
          ),
        ),
      )
    );
  }
}