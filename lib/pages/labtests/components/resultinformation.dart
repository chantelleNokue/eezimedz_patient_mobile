import 'package:flutter/material.dart';
import '../../components/bottomnavigationbar.dart';

class ResultInformation extends StatelessWidget{


  final String? doctorName;
  final String? labName;
  final String? testDate;
  final String? testName;
  final String? results;
  final String? comments;

  ResultInformation({
    this.doctorName,
    this.labName,
    this.testDate,
    this.testName,
    this.results,
    this.comments
});
  
  @override
  Widget build(BuildContext context){
    //TODO: add variables with data from the db

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Results'),
      ),
      body: Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //doctor and lab details
              Material(
                elevation: 2,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  padding: EdgeInsets.all(12),
                  width: 800,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(testName!, style: TextStyle(fontSize: 18),),

                      SizedBox(height: 5,),

                      Text(testDate!, style: TextStyle(fontSize: 15),),

                      SizedBox(height: 5,),

                      Row(
                        children: [
                          Icon(Icons.person, size: 16,),

                          SizedBox(width: 10,),

                          Text('Dr ${doctorName!}', style: TextStyle(fontSize: 15),),
                        ],
                      ),

                      SizedBox(height: 5,),

                     Row(
                       children: [
                         Icon(Icons.location_on, size: 16,),

                         SizedBox(width: 10,),

                         Text(labName!, style: TextStyle(fontSize: 15),),
                       ],
                     ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20,),

             Material(
               elevation: 2,
               borderRadius: BorderRadius.circular(12),
               child: Container(
                 padding: EdgeInsets.all(12),
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(12)
                 ),
                 child:  Column(
                   mainAxisSize: MainAxisSize.min,
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Container(
                       child: Center(
                         child: Text(
                           'Test Results',
                           style: TextStyle(
                             fontSize: 19,
                             fontWeight: FontWeight.bold,
                             color: Colors.blue,
                           ),
                         ),
                       )
                     ),

                     SizedBox(height: 5,),

                     Divider(
                       height: 1.0,
                       thickness: 2.0,
                       color: Colors.black38,
                     ),

                     SizedBox(height: 16,),

                     Column(
                       mainAxisSize: MainAxisSize.min,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text('Results', style: TextStyle(fontSize: 16,  fontWeight: FontWeight.w500 ),),

                         SizedBox(height: 10,),

                         Text(results!, maxLines: 3,),
                       ],
                     ),

                     SizedBox(height: 5,),

                     Divider(
                       height: 1.0,
                       thickness: 2.0,
                       color: Colors.black38,
                     ),

                     SizedBox(height: 10,),

                     Column(
                       mainAxisSize: MainAxisSize.min,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text('Requirements', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),

                         SizedBox(height: 10,),

                         Text(comments!, maxLines: 8,),
                       ],
                     ),

                     SizedBox(height: 5,),

                     Divider(
                       height: 1.0,
                       thickness: 2.0,
                       color: Colors.black38,
                     ),

                   ],
                 ),
               ),
             ),

              SizedBox(height: 20,),

              //TODO: add contact doctor functionality with doctor's email

              Center(
                child: ElevatedButton.icon(
                  icon:Icon(Icons.chat),
                  onPressed: (){},
                  label: Text('Contact Doctor'),
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.blue,
                    minimumSize: Size(300,50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                ),
                ),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: NavBar(),
    );
  }
}