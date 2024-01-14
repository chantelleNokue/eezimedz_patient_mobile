import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../precriptionsmenu.dart';

class RequestSuccess extends StatefulWidget{
  const RequestSuccess({Key ? key}): super(key : key);

  State<RequestSuccess> createState() => _RequestSuccessState();
}

class _RequestSuccessState extends State<RequestSuccess>{

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
                  'Request Successful',
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
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => PrescriptionsMenu()));
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