import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SuccessDialog extends StatefulWidget{

  final toClass;

  const SuccessDialog({Key ? key, this.toClass}): super(key : key);

  State<SuccessDialog> createState() => _SuccessDialogState();
}

class _SuccessDialogState extends State<SuccessDialog>{

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
                  height: 150,
                  width: 150,
                  child: Lottie.asset('animations/checkbox.json'),
                ),
              ),

              SizedBox(height: 15,),

              ElevatedButton(
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => widget.toClass));
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