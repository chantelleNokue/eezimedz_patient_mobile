import 'package:flutter/material.dart';

class MedicalScheduleCard extends StatelessWidget {
  final String? startDate;
  final String? endDate;
  final String? drugName;
  final String? weeklySchedule;
  final String? dailyFrequence;
  final String? progress;
  final String? timing;
  final String? dosage;

  MedicalScheduleCard(
      {this.startDate,
      this.endDate,
      this.drugName,
      this.weeklySchedule,
      this.dailyFrequence,
      this.progress,
      this.timing,
      this.dosage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: FractionallySizedBox(
              widthFactor: 0.8, // Adjust this value to control the width
              child: Container(
                color: Colors.lightBlueAccent,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    "Start Date:${startDate!} -End Date:${endDate!}",
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
              padding: const EdgeInsets.all(5.0),
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
                            Text('Drug Name',
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w600)),
                            Text("$drugName ",
                                style:
                                    TextStyle(fontSize: 11, color: Colors.grey)),
                          ],
                        ),
                        Spacer(),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Timing',
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w600)),
                            Text("$timing ",
                                style:
                                    TextStyle(fontSize: 11, color: Colors.grey)),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 50.0),
                              child: Text('Dosage',
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w600)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 40.0),
                              child: Text("$dosage",
                                  style: TextStyle(
                                      fontSize: 11, color: Colors.grey)),
                            ),
                          ],
                        ),

                        Spacer(),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Daily Frequency',
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w600)),
                            Text("$dailyFrequence",
                                style:
                                    TextStyle(fontSize: 11, color: Colors.grey)),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 25.0),
                              child: Text('Progress',
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w600)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 25.0),
                              child: Text("$progress",
                                  style:
                                      TextStyle(fontSize: 11, color: Colors.grey)),
                            ),
                          ],
                        ),
                        Spacer(),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Weekly Schedule',
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w600)),
                            Text("$weeklySchedule",
                                style:
                                TextStyle(fontSize: 11, color: Colors.grey)),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.lightBlueAccent,
                                elevation: 0,
                                minimumSize: Size(80, 30),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )
                            ),
                            onPressed: () {},
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Skip',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.lightBlueAccent,
                                elevation: 0,
                                minimumSize: Size(80, 30),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )
                            ),
                            onPressed: () {},
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Done',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
