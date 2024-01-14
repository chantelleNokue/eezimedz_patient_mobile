import 'package:flutter/material.dart';

class ViewComponent extends StatelessWidget{
  final String? reference;
  final String? ward;
  final String? reason;
  final String? admissiondate;
  final String? dischargedate;

  ViewComponent({
    this.reference,
    this.ward,
    this.reason,
    this.admissiondate,
    this.dischargedate,
});


  @override
  Widget build(BuildContext context){
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      titlePadding: EdgeInsets.all(10),
      contentPadding: EdgeInsets.all(10),
      scrollable: true,
      title: Text('Admission Details'),
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
            children: [
              Text('Ward:'),

              Text(ward!),
            ],
          ),

          SizedBox(height: 10,),

          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Admission Reference:'),

              Text(reference!),
            ],
          ),

          SizedBox(height: 10,),

          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Admission Date:'),

              Text(admissiondate!),
            ],
          ),

          SizedBox(height: 10,),


          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Discharge Date:'),

              Text(dischargedate!),
            ],
          ),

          SizedBox(height: 10,),


          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Reason:'),

              Text(reason!),
            ],
          ),

        ],
      ),
    );
  }
}