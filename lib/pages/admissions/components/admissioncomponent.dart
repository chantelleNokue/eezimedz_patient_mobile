import 'package:flutter/material.dart';


class AdmissionComponent extends StatelessWidget{

  final String? ward;
  final String? admissiondate;
  final String? dischargedate;
  final viewFunction;

  AdmissionComponent({
    this.ward,
    this.admissiondate,
    this.dischargedate,
    this.viewFunction,
});



  @override
  Widget build(BuildContext context){
    return Material(
      elevation: 3,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        width: 800,
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: Colors.blue.withOpacity(0.04),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              'icons/admissions.png',
              height: 80,
            ),

            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment:  CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Ward: ', style: TextStyle(fontSize: 13),),

                    Text(ward!, style: TextStyle(fontSize: 13),)
                  ],
                ),

                SizedBox(height: 10,),

                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    Text('Admission Date:', style: TextStyle(fontSize: 13),),

                    Text(admissiondate!, style: TextStyle(fontSize: 13),)
                  ],
                ),

                SizedBox(height: 10,),

                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Discharge Date:', style: TextStyle(fontSize: 13),),

                    Text(dischargedate!, style: TextStyle(fontSize: 13),),
                  ],
                ),

                SizedBox(height: 15,),

                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(height: 1,),

                    SizedBox(width: 80,),

                    ElevatedButton.icon(
                      icon: Icon(Icons.remove_red_eye_sharp),
                      onPressed:viewFunction,
                      label: Text('view'),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          elevation: 0,
                          minimumSize: Size(80, 30),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          )
                      ),
                    ),
                  ],
                )



              ],
            ),
          ],
        ),
      ),
    );
  }
}