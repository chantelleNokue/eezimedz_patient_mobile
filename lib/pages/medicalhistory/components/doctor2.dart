import 'package:flutter/material.dart';

class DoctorComponent2 extends StatelessWidget {
  final String? imagePath;
  final String? name;
  final String? email;
  final String? number;
  final String? medicalCenter;
  final contactFunction;

  DoctorComponent2({
    this.imagePath,
    this.name,
    this.email,
    this.number,
    this.medicalCenter,
    this.contactFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
      child: Material(
        elevation: 3,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: 800,
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black.withOpacity(0.2),
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(12),
              color: Colors.white.withOpacity(0.03)),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(8.0),
                child: Row(children: [
                  //Picture Of Doctor
                  ClipRRect(
                    borderRadius: BorderRadius.circular(28),
                    child: Image.asset(
                      imagePath!,
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
                      Text(
                        name!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
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

                          SizedBox(
                            width: 5,
                          ),

                          Text(
                            email!,
                            style: TextStyle(fontSize: 13),
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
                              Icon(
                                Icons.calendar_today,
                                size: 12,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                number!,
                                style: TextStyle(fontSize: 13),
                              ),
                            ],
                          ),

                          SizedBox(
                            width: 12,
                          ),

                          //Medical center
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.star_border,
                                size: 17,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                medicalCenter!,
                                style: TextStyle(fontSize: 13),
                              ),
                            ],
                          ),
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
              Divider(
                color: Colors.grey[80],
                height: 3,
                thickness: 1,
              ),
              Container(
                // decoration: BoxDecoration(
                //
                //   border: Border(
                //     top: BorderSide(
                //       color: Colors.black.withOpacity(0.2),
                //       width: 0.5,
                //     ),
                //   ),
                // ),

                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Text('R99.90', style: TextStyle(
                      fontWeight: FontWeight.bold,
                      // fontSize: 18,
                    ),),
                    SizedBox(
                      width: 100,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(


                            color: Colors.black.withOpacity(0.2),
                            width: 0.5,

                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'icons/heart.png',
                          height: 20,
                          width: 20,
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    ElevatedButton.icon(
                      onPressed: contactFunction,
                      label: Text('Chat'),
                      icon: Icon(Icons.chat),
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          minimumSize: Size(80, 30),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          )),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
