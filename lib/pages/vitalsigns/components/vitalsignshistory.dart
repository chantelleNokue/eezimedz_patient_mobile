import 'package:flutter/material.dart';

class VitalSignsCard extends StatelessWidget{
  final String? bloodPressure;
  final String? temperature;
  final String? breathing;
  final String? height;
  final String? haemoglobinCount;
  final String? bloodSugar;
  final String? bm1;
  final String? pulse;
  final String? weight;
  final String? date;
  final String? time;

  VitalSignsCard({

  this.bloodPressure, this.temperature, this.breathing, this.height, this.haemoglobinCount, this.bloodSugar, this.bm1, this.pulse, this.weight, this.date, this.time});


  @override
  Widget build(BuildContext context){
    return
       Column(
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: FractionallySizedBox(
              widthFactor: 0.4, // Adjust this value to control the width
              child: Container(
                color: Colors.lightBlueAccent,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    "${date!} @${time!}",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: 600,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30.0),
                  topLeft: Radius.circular(30.0)),
              border: Border.all(
                color: Colors.grey,
                width: 0.5,
              ),
              color: Colors.white.withOpacity(0.1),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [


                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Blood Pressure',  style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w600)),

                            Text("$bloodPressure/bpR ", style:
                            TextStyle(fontSize: 11, color: Colors.grey)),
                          ],
                        ),
                        Spacer(),

                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Temperature',  style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w600)),

                            Text("$temperature/Degrees Celsius ", style:
                            TextStyle(fontSize: 11, color: Colors.grey)),
                          ],
                        ),

                      ],
                    ),



                    SizedBox(height: 5,),
                    Row(
                      children: [


                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Weight:',  style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w600)),

                            Text("$weight :kg", style:
                            TextStyle(fontSize: 11, color: Colors.grey)),
                          ],
                        ),
                        Spacer(),


                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 56.0),
                              child: Text('BMI:',  style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w600)),
                            ),

                            Text("$bm1/ Heart Rate", style:
                            TextStyle(fontSize: 11, color: Colors.grey)),
                          ],
                        ),

                      ],
                    ),

                    SizedBox(height: 5,),
                    Row(
                      children: [


                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 25.0),
                              child: Text('Breathing',  style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w600)),
                            ),

                            Text("$breathing/BreathpSecond", style:
                            TextStyle(fontSize: 11, color: Colors.grey)),
                          ],
                        ),
                        Spacer(),


                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 50.0),
                              child: Text('Pulse',  style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w600)),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(right: 40.0),
                              child: Text("$pulse/Pulse", style:
                              TextStyle(fontSize: 11, color: Colors.grey)),
                            ),
                          ],
                        ),

                      ],
                    ),

                    SizedBox(height: 5,),
                    Row(
                      children: [


                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Weight',  style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w600)),

                            Text("$weight : kg", style:
                            TextStyle(fontSize: 11, color: Colors.grey)),
                          ],
                        ),
                        Spacer(),


                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Blood Sugar',  style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w600)),

                            Text("$bloodSugar/Cap Refill Size", style:
                            TextStyle(fontSize: 11, color: Colors.grey)),
                          ],
                        ),

                      ],
                    ),

                    SizedBox(height: 5,),
                    Row(
                      children: [


                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Height',  style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w600)),

                            Text("$height : cm", style:
                            TextStyle(fontSize: 11, color: Colors.grey)),
                          ],
                        ),
                        Spacer(),


                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Heamoglobin Count',  style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w600)),

                            Text(":$haemoglobinCount/dL", style:
                            TextStyle(fontSize: 11, color: Colors.grey)),
                          ],
                        ),

                      ],
                    ),



                  ],

                ),
              ),
            ),
          ),
        ],
      );

  }
}
