import 'package:flutter/material.dart';


class ViewCard extends StatefulWidget{
  final String? status;
  final String? date;
  final String? immediatePaymemt;
  final String? dueDate;
  final String? products;
  final String? patientName;
  final String? total;
  final String? currency;



  const ViewCard({
    Key? key,
    required this.status,
    required this.date,
    required this.immediatePaymemt,
    required this.dueDate,
    required this.products,
    required this.patientName,
    required this.total,
    required this.currency,
  }): super(key : key);

  State<ViewCard> createState() => _ViewCardState();
}

class _ViewCardState extends State<ViewCard>{
  Color getStatusColor(status){
    if(status == 'Pending'){
      return Colors.greenAccent;
    }else if(status == 'Approved'){
      return Colors.blueAccent;
    }else{
      return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context){
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(14),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          width: 800,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: Colors.blue.withOpacity(0.12),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Patient Name:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),

                  SizedBox(width: 5,),

                  Text(widget.patientName!, style: TextStyle(fontSize: 16),),
                ],
              ),

              SizedBox(height: 8,),

              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Invoice Date:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),

                  SizedBox(width: 5,),

                  Text(widget.date!, style: TextStyle(fontSize: 16),),
                ],
              ),

              SizedBox(height: 8,),

              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Immediate Payment:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),

                  SizedBox(width: 5,),

                  Text(widget.immediatePaymemt!, style: TextStyle(fontSize: 16),),
                ],
              ),

              SizedBox(height: 10,),

              (widget.immediatePaymemt! == 'Unpaid')?
             Column(
               children: [
                 Row(
                   mainAxisSize: MainAxisSize.min,
                   children: [
                     Text('Due Date:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),

                     SizedBox(width: 5,),

                     Text(widget.dueDate!, style: TextStyle(fontSize: 16),),
                   ],
                 ),

                 SizedBox(height: 10,),
               ],
             ):
                  Container(
                    height: 0,
                  ),

              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Products:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),

                  SizedBox(width: 5,),

                  Text(widget.products!, style: TextStyle(fontSize: 16),),
                ],
              ),

              SizedBox(height: 8,),


              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Currency:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),

                  SizedBox(width: 5,),

                  Text(widget.currency!, style: TextStyle(fontSize: 16),),
                ],
              ),

              SizedBox(height: 8,),

              //TODO: fix amount
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Amount:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),

                  SizedBox(width: 5,),

                  Text(widget.total!, style: TextStyle(fontSize: 16),),
                ],
              ),

              SizedBox(height: 10,),


              Row(
                mainAxisSize: MainAxisSize.min,
                children: [

                  SizedBox(width: 200),

                  Container(
                    height: 30,
                    width: 120,
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: getStatusColor(widget.status!),
                    ),
                    child: Center(
                      child: Text(
                        widget.status!,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color:Colors.white,
                          fontSize: 10,
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