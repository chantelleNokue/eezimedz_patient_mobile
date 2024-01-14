import 'package:flutter/material.dart';


class ResultCard extends StatelessWidget{
  final String? invoiceType;
  final String? productName;
  final String? invoiceDate;
  final String? status;
  final String? total;
  final viewFunction;

  ResultCard({

    this.viewFunction,
    this.invoiceType,
    this.productName,
    this.invoiceDate, this.status, this.total,
});


  @override
  Widget build(BuildContext context){
    return Material(
      elevation: 3,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 650,
        height: 135,
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
                      Text('Invoice Type: $invoiceType', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14,),),
                      Spacer(),
                      Text('\$ $total', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.blue),),
                    ],
                  ),

                  SizedBox(height: 3,),

                  Text('Product Name: $productName', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14,),overflow: TextOverflow.ellipsis,),

                  SizedBox(height: 3,),

                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.date_range, size: 16,),

                      Text('Invoice Date: $invoiceDate', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14,),),
                    ],
                  ),

                  SizedBox(height: 3,),

                  Row(
                    children: [
                      ElevatedButton(
                        child: Text('View'),
                        onPressed: viewFunction,
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                          ),
                          backgroundColor: Colors.blue,
                        ),
                      ),
                      Spacer(),
                      Container(


                        child: Text(status!, style: TextStyle(fontSize: 14, color: Colors.blue, fontWeight: FontWeight.bold)),
                      )
                    ],
                  ),


                ],
              ),
            ),

          // ],
        // ),
      ),
    );
  }
}