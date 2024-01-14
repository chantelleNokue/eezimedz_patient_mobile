import 'package:flutter/material.dart';

class TreatmentComponent extends StatelessWidget{
  final String? serviceProvider;
  final String? providerRef;
  final String? regDate;
  final String? date;
  final String? medicalCenter;
  final String? services;
  final String? amount;
  final contactfunction;

  TreatmentComponent({
    this.serviceProvider,
    this.providerRef,
    this.regDate,
    this.date,
    this.medicalCenter,
    this.amount,
    this.services,
    this.contactfunction,
});


  @override
  Widget build(BuildContext context){
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 800,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.blue.withOpacity(0.05),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Service Provider:'),

                  Text(serviceProvider!),
                ],
              ),

              SizedBox(height: 5,),


              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Provider Reference:'),

                  Text(providerRef!),
                ],
              ),

              SizedBox(height: 5,),

              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Registration Date:'),

                  Text(regDate!),
                ],
              ),

              SizedBox(height: 5,),

              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Date:'),

                  Text(date!),
                ],
              ),

              SizedBox(height: 5,),

              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Medical Center:'),

                  Text(medicalCenter!),
                ],
              ),

              SizedBox(height: 5,),

              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Services:'),

                  Text(services!),
                ],
              ),

              SizedBox(height: 5,),


              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Amount:'),

                  Text('\$${amount!}'),
                ],
              ),

              SizedBox(height: 5,),


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(height: 1,),


                  GestureDetector(
                    onTap: contactfunction,
                    child: Container(
                      height: 30,
                      width: 210,
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: Text(
                          'Contact Service Provider',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),




            ],

          ),
        ),
      ),
    );
  }
}
