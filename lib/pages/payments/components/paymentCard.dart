import 'package:flutter/material.dart';


class PaymentCard extends StatelessWidget{
  final String? invoiceNumber;
  final String? amount;
  final String? department;

  final viewFunction;

  PaymentCard({

     this.invoiceNumber, this.amount, this.department, this.viewFunction,

  });


  @override
  Widget build(BuildContext context){
    return Material(
      elevation: 3,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 550,
        height: 145,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.blue.withOpacity(0.12),
        ),
        child:
        // Row(
        //   mainAxisSize: MainAxisSize.min,
        //   children: [
        //     Expanded(child: Image.asset('icons/resultcard.png')),
        //
        //     SizedBox(width: 40,),

        Padding(
          padding: EdgeInsets.only(left: 22.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text.rich(
                      TextSpan(

                          children: [
                            TextSpan(
                              text: 'Invoice Number: ',
                              style: TextStyle(fontWeight: FontWeight.bold,  fontSize: 14,),
                            ),
                            TextSpan(
                              text: invoiceNumber!,style: TextStyle(  fontSize: 14,
                            ),
                            )]

                      ),
                      maxLines: 2,
                    ),
                  ),
                  // Expanded(child: Text('Invoice Number: $invoiceNumber', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 14,),maxLines: 2,)),

                ],
              ),

              SizedBox(height: 3,),

              Text.rich(
                TextSpan(

                    children: [
                      TextSpan(
                        text: 'Payment to: ',
                        style: TextStyle(fontWeight: FontWeight.bold,  fontSize: 14,),
                      ),
                      TextSpan(
                        text: '$department Department',style: TextStyle(  fontSize: 14,
                      ),
                      )]

                ),
                maxLines: 2,
              ),

              // Text('Payment to: $department Department', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14,),overflow: TextOverflow.ellipsis,),

              SizedBox(height: 3,),
              Row(
                children: [
                  Icon(Icons.money, size: 16,),
                  Text.rich(
                    TextSpan(

                        children: [

                          TextSpan(
                            text: 'Amount:',
                            style: TextStyle(fontWeight: FontWeight.bold,  fontSize: 14,),
                          ),
                          TextSpan(
                            text: amount,style: TextStyle( fontSize: 14,
                          ),
                          )]

                    ),
                    maxLines: 2,
                  ),
                ],
              ),


              // Row(
              //   mainAxisSize: MainAxisSize.min,
              //   children: [
              //     Icon(Icons.money, size: 16,color: Colors.blue,),
              //
              //     Text('Amount: $amount', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.blue),),
              //   ],
              // ),

              SizedBox(height: 3,),

      // Expanded(
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.end,
      //     children: <Widget>[
      //       Icon(Icons.arrow_forward_ios, color: Colors.blue),
      //     ],
      //   ),),


              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton.icon(
                      icon: Icon(Icons.remove_red_eye_sharp),
                      onPressed:viewFunction,
                      label: Text('View'),
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.blue,
                          backgroundColor: Colors.blue,
                          elevation: 0,
                          minimumSize: Size(80, 30),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          )
                      ),
                    ),
                  ],
                ),
              ),

              // Row(
              //   children: [
              //     ElevatedButton(
              //       child: Text('View'),
              //       onPressed: viewFunction,
              //       style: ElevatedButton.styleFrom(
              //         elevation: 0,
              //         shape: RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(10)
              //         ),
              //         backgroundColor: Colors.blue,
              //       ),
              //     ),
              //     Spacer(),
              //     // Container(
              //     //
              //     //
              //     //   child: Text(status!, style: TextStyle(fontSize: 14, color: Colors.blue, fontWeight: FontWeight.bold)),
              //     // )
              //   ],
              // ),


            ],
          ),
        ),

        // ],
        // ),
      ),
    );
  }
}