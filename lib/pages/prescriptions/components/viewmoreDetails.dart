import 'package:flutter/material.dart';

class ViewComponentPrescriptions extends StatelessWidget {
  final String? date;
  final String? medication;
  final String? dosage;
  final String? frequency;
  // final String? duration;
  final String? dosageType;
  final String? precautions;
  final viewFunction;

  ViewComponentPrescriptions({
    this.date,
    this.medication,
    this.dosage,
    this.frequency,
    // this.duration,
    this.dosageType,
    this.precautions, this.viewFunction,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      titlePadding: EdgeInsets.all(10),
      contentPadding: EdgeInsets.all(10),
      scrollable: true,
      title: Text('Prescription Details'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Close'),
        )
      ],
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Date:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(date!),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Medication:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(medication!)
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Dosage:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(dosage!),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Frequency:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(frequency!)
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Dosage Type:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(dosageType!),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Precautions:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Text(
                    precautions!,
                    softWrap: true,
                    overflow: TextOverflow.clip,
                  )),
            ],
          ),

          ElevatedButton(
            child: Text('View'),
            onPressed: viewFunction,
            style: ElevatedButton.styleFrom(
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
              ),
              backgroundColor: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
