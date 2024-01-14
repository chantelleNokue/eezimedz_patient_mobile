import 'package:flutter/material.dart';

class MyDoctors2 extends StatelessWidget {
  final String? imagePath;
  final String? name;
  final String? occupation;


  MyDoctors2({
    this.imagePath,
    this.name,
    this.occupation,

  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: 160,
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
                child: Column(children: [
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
                    height: 10,
                  ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Doctor Name
                      Text(
                        'Dr.$name',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
SizedBox(height: 4,),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          occupation!,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                          ),
                        ),
                      ),


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
