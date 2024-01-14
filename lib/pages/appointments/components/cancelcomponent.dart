import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../services/appointments/manageAppointments.dart';
import '../../../models/appointmentsmodel.dart';
import '../appointmentsmenu.dart';
import 'failuredialog.dart';
import 'canceldialog.dart';


class CancelComponent extends StatefulWidget{
  
  final String? appointmentid;
  
  const CancelComponent({Key ? key, required this.appointmentid }): super(key : key);


  State<CancelComponent> createState() => _CancelComponentState();
}


class _CancelComponentState extends State<CancelComponent>{
  //dialogs
  void _showSuccessDialog(context) => showDialog(
    context: context,
    builder: (context) => CancelDialog(),
  );

  void _showFailureDialog(context) => showDialog(
    context: context,
    builder: (context) => FailureDialog(),
  );

  //text controller
  final reasonController = TextEditingController();

  //cancel appointment
  Future<int?> cancelAppointment(appointmentid) async{
    try{
      var url = Uri.parse('http://20.164.214.226:3060/mongo/bookings/cancelBooking');

      final response = await http.put(
          url,
          body: jsonEncode(
              {
                "status": "Cancelled",
                "appointmentid": appointmentid
              }
          )
      );

      if(response.statusCode == 200){
        print('Cancelled Sucessfully');
        return response.statusCode;
      }else{
        print(response.statusCode);
      }
    }catch(e){
      print(e.toString());
    }
  }

  handleCancel() async{
    try{
      var cancelSuccess = false;
      final statusCode = await cancelAppointment(widget.appointmentid);

      if(statusCode == 200){
        setState(() {
          cancelSuccess = true;
        });
      }

      if(cancelSuccess == true){
        _showSuccessDialog(context);
      }else{
        _showFailureDialog(context);
      }

    }catch(e){
      print('Error message $e');
      _showFailureDialog(context);
    }
  }


  @override
  Widget build(BuildContext context){
    return AlertDialog(
      shape:  RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
      ),
      title: Text('Cancel Appointment'),
      scrollable: true,
      content: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
                'Please provide reason for cancelling.',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                )
            ),

            SizedBox(height: 5,),

            TextFormField(
              controller: reasonController,
              decoration: InputDecoration(
                labelText: 'Reason',
                hintText: 'reason',
                suffixIcon: reasonController.text.isEmpty
                    ? Container(width:0)
                    : IconButton(
                  icon:Icon(Icons.close),
                  onPressed: () => reasonController.clear(),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 10),
              ),
              validator: (value){
                if(value!.isEmpty){
                  return 'reason is required';
                }else{
                  return null;
                }
              },
            )
          ],
        ),
      ),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actions: [
        TextButton(
          child: Text('No', ),
          onPressed: () => Navigator.pop(context),
        ),

        TextButton(
          child: Text('Yes',),
          onPressed: () => handleCancel(),
        ),
      ],

    );
  }
}