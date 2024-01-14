import 'package:flutter/material.dart';

class MyDoctors extends StatelessWidget {
  final String? imagePath;
  final String? name;
  final String? email;
  final String? number;
  final String? medicalCenter;
  final contactFunction;

  MyDoctors({
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
        elevation: 0.5,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: 800,
          // decoration: BoxDecoration(
          //     border: Border.all(
          //       color: Colors.black.withOpacity(0.2),
          //       width: 0.5,
          //     ),
          //     borderRadius: BorderRadius.circular(12),
          //     color: Colors.white.withOpacity(0.03)),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(8.0),
                child: Row(children: [
                  //Picture Of Doctor
                  ClipRRect(
                    borderRadius: BorderRadius.circular(800),
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
                          SizedBox(
                            width: 2,
                          ),

                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [

                              SizedBox(
                                width: 5,
                              ),
                              Text(
                               " ( $number Review )",
                                style: TextStyle(fontSize: 13, color: Colors.lightBlueAccent),
                              ),
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

            ],
          ),
        ),
      ),
    );
  }
}
