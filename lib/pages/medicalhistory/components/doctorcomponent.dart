import 'package:flutter/material.dart';


class DoctorComponent extends StatelessWidget{

  final String? imagePath;
  final String? name;
  final String? email;
  final String? number;
  final String? medicalCenter;
  final contactFunction;

  DoctorComponent({
    this.imagePath,
    this.name,
    this.email,
    this.number,
    this.medicalCenter,
    this.contactFunction,
  });

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
      child: Material(
        elevation: 3,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: EdgeInsets.all(8.0),
          width: 800,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.blue.withOpacity(0.03)
          ),
          child: Row(
            children:[
            //Picture Of Doctor
            ClipRRect(              
              borderRadius: BorderRadius.circular(45),
              child: Image.asset(
                imagePath!,
                width: 90,
                height: 100,
                fit: BoxFit.contain,
              ),
            ),

            SizedBox(width: 10,),


             Column(
               mainAxisAlignment: MainAxisAlignment.center,
               mainAxisSize: MainAxisSize.min,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 //Doctor Name
                 Text(
                   name!,
                   style: TextStyle(
                     fontWeight: FontWeight.bold,
                     fontSize: 18,
                   ),
                 ),

                 SizedBox(height: 8,),

                 //Doctor Email Address
                 Row(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   mainAxisSize: MainAxisSize.min,
                   children: [
                     Icon(Icons.email, size: 17,),

                     SizedBox(width: 5,),

                     Text(email!, style: TextStyle(fontSize: 13),),
                   ],
                 ),

                 SizedBox(height: 8,),

                 //Doctor Phone Number
                 Row(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   mainAxisSize: MainAxisSize.min,
                   children: [
                     Icon(Icons.phone, size: 17,),

                     SizedBox(width: 5,),

                     Text(number!, style: TextStyle(fontSize: 13),),
                   ],
                 ),

                 SizedBox(height: 8,),

                 //Medical center
                 Row(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   mainAxisSize: MainAxisSize.min,
                   children: [
                     Icon(Icons.location_on, size: 17,),

                     SizedBox(width: 5,),

                     Text(medicalCenter!, style: TextStyle(fontSize: 13),),
                   ],
                 ),

                 SizedBox(height: 8,),

                 Row(
                   mainAxisSize: MainAxisSize.min,
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     SizedBox(width: 90,),

                     ElevatedButton.icon(
                       onPressed: contactFunction,
                       label: Text('Contact'),
                       icon: Icon(Icons.chat),
                       style: ElevatedButton.styleFrom(
                           elevation: 0,
                           minimumSize: Size(80,30),
                           shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(15),
                           )
                       ),
                     )
                   ],
                 )
               ],
             ),
        ]
          ),
        ),
      ),
    );
  }


}