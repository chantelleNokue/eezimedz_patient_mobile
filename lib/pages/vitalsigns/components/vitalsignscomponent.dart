import 'package:flutter/material.dart';

class VitalsCard extends StatefulWidget {
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
  final actionfunction;

  const VitalsCard({
    Key? key,
    this.bloodPressure,
    this.temperature,
    this.breathing,
    this.height,
    this.haemoglobinCount,
    this.bloodSugar,
    this.bm1,
    this.pulse,
    this.weight,
    this.actionfunction,
    this.date,
    this.time,
  }) : super(key: key);

  State<VitalsCard> createState() => _ClaimComponentState();
}

class _ClaimComponentState extends State<VitalsCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // borderRadius: BorderRadius.only(bottomRight: Radius.circular(30.0), topLeft: Radius.circular(30.0)),

      child: Column(
        children: [
          Container(alignment: Alignment.topLeft,child: Text("Vitals as at", style: TextStyle(fontWeight: FontWeight.w700, color: Colors.black45),)),

          Align(
            alignment: Alignment.bottomRight,
            child: FractionallySizedBox(
              widthFactor: 0.4, // Adjust this value to control the width
              child: Container(
                color: Colors.lightBlueAccent,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    "${widget.date} @${widget.time}",
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
            width: 800,
            padding: EdgeInsets.all(10),
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                  child: Row(
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Blood Pressure',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w600)),
                          SizedBox(
                            width: 50,
                          ),
                          Text("${widget.bloodPressure}/bpRBloodPressure",
                              style:
                                  TextStyle(fontSize: 11, color: Colors.grey)),
                        ],
                      ),
                      Spacer(),
                      Image.asset(
                        'icons/bloodPressure.png',
                        height: 40,
                        width: 30,
                      )
                      // Icon(Icons.date_range, size: 30,),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 800,
            padding: EdgeInsets.all(10),
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                  child: Row(
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Temperature',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w600)),
                          SizedBox(
                            width: 50,
                          ),
                          Text("${widget.temperature}/degreesTemperature",
                              style:
                                  TextStyle(fontSize: 11, color: Colors.grey)),
                        ],
                      ),
                      Spacer(),
                      Image.asset(
                        'icons/temperature.png',
                        height: 40,
                        width: 30,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 800,
            padding: EdgeInsets.all(10),
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                  child: Row(
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Breathing',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w600)),
                          SizedBox(
                            width: 50,
                          ),
                          Text("${widget.breathing}/Breathing",
                              style:
                                  TextStyle(fontSize: 11, color: Colors.grey)),
                        ],
                      ),
                      Spacer(),
                      Image.asset(
                        'icons/breathing.png',
                        height: 40,
                        width: 30,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 800,
            padding: EdgeInsets.all(10),
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                  child: Row(
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Height',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w600)),
                          SizedBox(
                            width: 50,
                          ),
                          Text("${widget.height} :cm",
                              style:
                                  TextStyle(fontSize: 11, color: Colors.grey)),
                        ],
                      ),
                      Spacer(),
                      Image.asset(
                        'icons/height.png',
                        height: 40,
                        width: 30,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 800,
            padding: EdgeInsets.all(10),
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                  child: Row(
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Haemoglobin Count',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w600)),
                          SizedBox(
                            width: 50,
                          ),
                          Text(":${widget.haemoglobinCount}/dL",
                              style:
                                  TextStyle(fontSize: 11, color: Colors.grey)),
                        ],
                      ),
                      Spacer(),
                      Image.asset(
                        'icons/bloodcells.png',
                        height: 40,
                        width: 30,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 800,
            padding: EdgeInsets.all(10),
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                  child: Row(
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Blood Sugar',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w600)),
                          SizedBox(
                            width: 50,
                          ),
                          Text("${widget.bloodSugar}/Cap Refill Size",
                              style:
                                  TextStyle(fontSize: 11, color: Colors.grey)),
                        ],
                      ),
                      Spacer(),
                      Image.asset(
                        'icons/bloodsugar.png',
                        height: 40,
                        width: 30,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 800,
            padding: EdgeInsets.all(10),
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                  child: Row(
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('BMI',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w600)),
                          SizedBox(
                            width: 50,
                          ),
                          Text("${widget.bm1} Heart Rate",
                              style:
                                  TextStyle(fontSize: 11, color: Colors.grey)),
                        ],
                      ),
                      Spacer(),
                      Image.asset(
                        'icons/heartrate.png',
                        height: 40,
                        width: 30,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 800,
            padding: EdgeInsets.all(10),
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                  child: Row(
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Pulse',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w600)),
                          SizedBox(
                            width: 50,
                          ),
                          Text("${widget.pulse}:Pulse",
                              style:
                                  TextStyle(fontSize: 11, color: Colors.grey)),
                        ],
                      ),
                      Spacer(),
                      Image.asset(
                        'icons/pulse.png',
                        height: 40,
                        width: 30,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 800,
            padding: EdgeInsets.all(10),
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                  child: Row(
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Weight',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w600)),
                          SizedBox(
                            width: 50,
                          ),
                          Text("${widget.weight} :kg",
                              style:
                                  TextStyle(fontSize: 11, color: Colors.grey)),
                        ],
                      ),
                      Spacer(),
                      Image.asset(
                        'icons/weight.png',
                        height: 40,
                        width: 30,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
