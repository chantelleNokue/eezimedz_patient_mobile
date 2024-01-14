import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../viewappointments.dart';

class RescheduleDialog extends StatefulWidget{
  const RescheduleDialog({Key ? key}): super(key : key);

  State<RescheduleDialog> createState() => _RescheduleDialogState();
}

class _RescheduleDialogState extends State<RescheduleDialog>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
        ),
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Center(
                child: Text(
                  'Reschedule Complete',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),

              SizedBox(height: 20,),


              Center(
                child: Container(
                  height: 150,
                  width: 150,
                  child: Lottie.asset('animations/checkbox.json'),
                ),
              ),

              SizedBox(height: 15,),

              ElevatedButton(
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ViewAppointments()));
                },
                child: Text('OKAY'),
                style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    minimumSize: Size(90, 30)
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}