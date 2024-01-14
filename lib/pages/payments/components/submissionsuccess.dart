import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../homepage.dart';
import '../paymentsmenu.dart';

class SubmissionSuccess extends StatefulWidget{
  const SubmissionSuccess({Key ? key}): super(key : key);

  State<SubmissionSuccess> createState() => _SubmissionSuccessState();
}

class _SubmissionSuccessState extends State<SubmissionSuccess>{

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
                  'Submission Successful',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),

              SizedBox(height: 20,),

              Center(
                child: Container(
                  height: 200,
                  width: 200,
                  child: Lottie.asset('animations/checkbox.json'),
                ),
              ),

              SizedBox(height: 15,),

              ElevatedButton(
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => PaymentsMenu ()));
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