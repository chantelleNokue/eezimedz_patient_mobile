import 'package:flutter/material.dart';

class AppointmentsScreen extends StatefulWidget {
  const AppointmentsScreen({super.key});

  @override
  State<AppointmentsScreen> createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<AppointmentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.white,
            title: Text('Review Appointment', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),),
      ),
      body: Container(child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
          child: Material(
            elevation: 0.5,
            borderRadius: BorderRadius.circular(12),
            child: Container(
              width: 800,

              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey.withOpacity(0.5),
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white.withOpacity(0.03)),
                    padding: EdgeInsets.all(8.0),
                    child: Row(children: [
                      //Picture Of Doctor
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset(
                          'icons/consultation.png',
                          width: 80,
                          height: 100,
                          fit: BoxFit.contain,
                        ),
                      ),

                      SizedBox(
                        width: 10,
                      ),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Doctor Name
                          Row(
                            children: [
                              Text(
                                'Service',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(width: 120,),

                              Text(
                                'Change',
                                style: TextStyle(

                                  fontSize: 14,
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline,

                                ),
                              ),

                            ],
                          ),

                          SizedBox(
                            height: 8,
                          ),

                          //Doctor Email Address
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // Icon(Icons.email, size: 17,),

                              // SizedBox(
                              //   width: 5,
                              // ),

                              Text(
                                'Consultation',
                                style: TextStyle(fontSize: 13, color: Colors.blue),
                              ),
                            ],
                          ),

                          SizedBox(
                            height: 8,
                          ),

                          // Doctor Phone Number
                          Row(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  // Icon(
                                  //   Icons.star_border,
                                  //   size: 17,
                                  // ),
                                  // SizedBox(
                                  //   width: 5,
                                  // ),
                                  Text(
                                    'Dermatology',
                                    style: TextStyle(fontSize: 13, color: Colors.grey),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 2,
                              ),

                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [

                                  // SizedBox(
                                  //   width: 5,
                                  // ),
                                  // Text(
                                  //   " ( 12 Review )",
                                  //   style: TextStyle(fontSize: 13, color: Colors.lightBlueAccent),
                                  // ),
                                ],
                              ),


                              //Medical center

                            ],
                          ),

                          SizedBox(
                            height: 8,
                          ),
                          // Divider(
                          //   color: Colors.black,
                          //   height: 3,
                          //   thickness: 2,
                          // ),
                        ],
                      ),
                    ]),
                  ),
                  SizedBox(height: 10,),
                  //date n time
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey.withOpacity(0.5),
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white.withOpacity(0.03)),
                    padding: EdgeInsets.all(8.0),
                    child: Row(children: [
                      //Picture Of Doctor
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset(
                          'icons/calendarr.png',
                          width: 80,
                          height: 100,
                          fit: BoxFit.contain,
                        ),
                      ),

                      SizedBox(
                        width: 10,
                      ),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Doctor Name
                          Row(
                            children: [
                              Text(
                                'Date & Time',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(width: 80,),

                              Text(
                                'Change',
                                style: TextStyle(

                                  fontSize: 14,
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline,

                                ),
                              ),

                            ],
                          ),

                          SizedBox(
                            height: 8,
                          ),

                          //Doctor Email Address
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // Icon(Icons.email, size: 17,),

                              // SizedBox(
                              //   width: 5,
                              // ),

                              Text(
                                'January 30,2024 , 9.00am',
                                style: TextStyle(fontSize: 13, color: Colors.blue),
                              ),
                            ],
                          ),

                          SizedBox(
                            height: 8,
                          ),

                          //Doctor Phone Number
                          // Row(
                          //   children: [
                          //     Row(
                          //       crossAxisAlignment: CrossAxisAlignment.start,
                          //       mainAxisSize: MainAxisSize.min,
                          //       children: [
                          //         // Icon(
                          //         //   Icons.star_border,
                          //         //   size: 17,
                          //         // ),
                          //         // SizedBox(
                          //         //   width: 5,
                          //         // ),
                          //         Text(
                          //           'Age: 22',
                          //           style: TextStyle(fontSize: 13, color: Colors.grey),
                          //         ),
                          //       ],
                          //     ),
                          //     SizedBox(
                          //       width: 2,
                          //     ),
                          //
                          //     Row(
                          //       crossAxisAlignment: CrossAxisAlignment.start,
                          //       mainAxisSize: MainAxisSize.min,
                          //       children: [
                          //
                          //         // SizedBox(
                          //         //   width: 5,
                          //         // ),
                          //         // Text(
                          //         //   " ( 12 Review )",
                          //         //   style: TextStyle(fontSize: 13, color: Colors.lightBlueAccent),
                          //         // ),
                          //       ],
                          //     ),
                          //
                          //
                          //     //Medical center
                          //
                          //   ],
                          // ),

                          SizedBox(
                            height: 8,
                          ),
                          // Divider(
                          //   color: Colors.black,
                          //   height: 3,
                          //   thickness: 2,
                          // ),
                        ],
                      ),
                    ]),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey.withOpacity(0.5),
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white.withOpacity(0.03)),
                    padding: EdgeInsets.all(8.0),
                    child: Row(children: [
                      //Picture Of Doctor
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset(
                          'icons/doctor2.jpg',
                          width: 90,
                          height: 100,
                          fit: BoxFit.contain,
                        ),
                      ),

                      SizedBox(
                        width: 10,
                      ),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Doctor Name
                          Row(
                            children: [
                              Text(
                                'Doctor',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(width: 130,),

                              Text(
                                'Change',
                                style: TextStyle(

                                  fontSize: 14,
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline,

                                ),
                              ),

                            ],
                          ),

                          SizedBox(
                            height: 8,
                          ),

                          //Doctor Email Address
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // Icon(Icons.email, size: 17,),

                              // SizedBox(
                              //   width: 5,
                              // ),

                              Text(
                                'Dr.Chantelle Mabvura',
                                style: TextStyle(fontSize: 13,color: Colors.blue),
                              ),
                            ],
                          ),

                          SizedBox(
                            height: 8,
                          ),

                          //Doctor Phone Number
                          Row(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  // Icon(
                                  //   Icons.star_border,
                                  //   size: 17,
                                  // ),
                                  // SizedBox(
                                  //   width: 5,
                                  // ),
                                  Text(
                                    'Dermatologist',
                                    style: TextStyle(fontSize: 13, color: Colors.grey),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 2,
                              ),

                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [

                                  // SizedBox(
                                  //   width: 5,
                                  // ),
                                  // Text(
                                  //   " ( 12 Review )",
                                  //   style: TextStyle(fontSize: 13, color: Colors.lightBlueAccent),
                                  // ),
                                ],
                              ),


                              //Medical center

                            ],
                          ),

                          SizedBox(
                            height: 8,
                          ),
                          // Divider(
                          //   color: Colors.black,
                          //   height: 3,
                          //   thickness: 2,
                          // ),
                        ],
                      ),
                    ]),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey.withOpacity(0.5),
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white.withOpacity(0.03)),
                    padding: EdgeInsets.all(8.0),
                    child: Row(children: [
                      //Picture Of Doctor
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.asset(
                          'icons/doctor1.jpg',
                          width: 80,
                          height: 100,
                          fit: BoxFit.contain,
                        ),
                      ),

                      SizedBox(
                        width: 10,
                      ),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Doctor Name
                          Row(
                            children: [
                              Text(
                                'Patient',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(width: 130,),

                              Text(
                                'Change',
                                style: TextStyle(

                                  fontSize: 14,
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline,

                                ),
                              ),

                            ],
                          ),

                          SizedBox(
                            height: 8,
                          ),

                          //Doctor Email Address
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // Icon(Icons.email, size: 17,),

                              // SizedBox(
                              //   width: 5,
                              // ),

                              Text(
                                'Mr.Nokutenda',
                                style: TextStyle(fontSize: 13,color: Colors.blue),
                              ),
                            ],
                          ),

                          SizedBox(
                            height: 8,
                          ),

                          //Doctor Phone Number
                          Row(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  // Icon(
                                  //   Icons.star_border,
                                  //   size: 17,
                                  // ),
                                  // SizedBox(
                                  //   width: 5,
                                  // ),
                                  Text(
                                    'Age: 22',
                                    style: TextStyle(fontSize: 13, color: Colors.grey),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 2,
                              ),

                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [

                                  // SizedBox(
                                  //   width: 5,
                                  // ),
                                  // Text(
                                  //   " ( 12 Review )",
                                  //   style: TextStyle(fontSize: 13, color: Colors.lightBlueAccent),
                                  // ),
                                ],
                              ),


                              //Medical center

                            ],
                          ),

                          SizedBox(
                            height: 8,
                          ),
                          // Divider(
                          //   color: Colors.black,
                          //   height: 3,
                          //   thickness: 2,
                          // ),
                        ],
                      ),
                    ]),
                  ),

                  SizedBox(height: 140,),

                  ElevatedButton(
                    onPressed: () {
                      // Add button press logic here
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue, // Change the button color
                      minimumSize: Size(300, 50), // Set the button width and height
                    ),
                    child: Text('Confirm and Pay'),
                  )

                ],
              ),
            ),
          ),
        )
      )),
    );
  }
}
