import 'package:flutter/material.dart';

import '../../../components/listitemsclass.dart';
import '../../../components/successdialog.dart';
import 'package:flutter_dropdown_x/flutter_dropdown_x.dart';

import '../../paymentsmenu.dart';

class MakePayment extends StatefulWidget{
  const MakePayment({Key ? key}): super(key : key);

  State<MakePayment> createState() => _MakePaymentState();
}

class _MakePaymentState extends State<MakePayment>{
  //success dialog
  void _showSuccessDialog(context) => showDialog(
    context: context,
    builder: (context) => SuccessDialog(toClass: PaymentsMenu()),
  );
  //controllers
  final invoiceController = TextEditingController();
  final referenceController = TextEditingController();
  final amountController = TextEditingController();
  final reasonController = TextEditingController();

  //variables
  String? invoice;
  String? reference;
  String? paymenttype;
  String? amount;
  String? department;
  DateTime paymentdate = DateTime.now();
  String? reason;
  String? currency;


  @override
  Widget build(BuildContext context){
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: Column(
        children: <Widget>[
          Center(
            child: Text(
              'Payment Details',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 23,
              ),
            ),
          ),

          SizedBox(height: 20,),

          Text('Invoice'),
          SizedBox(
            width: 320,
            child: TextFormField(
              controller: invoiceController,
              decoration: InputDecoration(
                labelText: 'Invoice',
                hintText: 'Invoice',
                suffixIcon: invoiceController.text.isEmpty
                    ? Container(width:0)
                    : IconButton(
                  icon:Icon(Icons.close),
                  onPressed: () => invoiceController.clear(),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6)
                ),
                alignLabelWithHint: true,
              ),
              onSaved: (value) => setState(() => invoice = value),
              validator: (value){
                if(value!.isEmpty){
                  return 'invoice is required';
                }else{
                  return null;
                }
              },
            ),
          ),

          SizedBox(height: 10,),

          Text('Reference'),
          SizedBox(
            width: 320,
            child: TextFormField(
                controller: referenceController,
                decoration: InputDecoration(
                  labelText: 'Reference',
                  hintText: 'Reference',
                  suffixIcon: referenceController.text.isEmpty
                      ? Container(width:0)
                      : IconButton(
                    icon:Icon(Icons.close),
                    onPressed: () => referenceController.clear(),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6)
                  ),
                  alignLabelWithHint: true,
                ),
                onSaved: (value) => setState(() => reference = value),
                validator: (value){
                  if(value!.isEmpty){
                    return 'reference is required';
                  }else
                    return null;
                }
            ),
          ),

          SizedBox(height: 10,),

          Text('Payment Type'),
          SizedBox(
            width: 325,
            child: DropDownField(
              value: paymenttype,
              hintText: 'Payment Type',
              dataSource: ListItems().paymentItems,
              onChanged: (value){
                setState(() {
                  paymenttype = value;
                });
              },
              textField: 'label',
              valueField: 'value',
            ),
          ),

          SizedBox(height: 10,),

          Text('Amount'),
          SizedBox(
            width: 320,
            child: TextFormField(
                keyboardType: TextInputType.number,
                controller: amountController,
                decoration: InputDecoration(
                  labelText: 'Amount',
                  hintText: 'Amount',
                  suffixIcon: amountController.text.isEmpty
                      ? Container(width:0)
                      : IconButton(
                    icon:Icon(Icons.close),
                    onPressed: () => amountController.clear(),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6)
                  ),
                  alignLabelWithHint: true,
                ),
                onSaved: (value) => setState(() => amount = value),
                validator: (value){
                  if(value!.isEmpty){
                    return 'amount is required';
                  }else
                    return null;
                }
            ),
          ),

          SizedBox(height: 10,),

          Text('Department'),
          SizedBox(
            width: 325,
            child: DropDownField(
              value: department,
              hintText: 'Select Department',
              dataSource: ListItems().departmentOptions,
              onChanged: (value){
                setState(() {
                  department = value;
                });
              },
              textField: 'label',
              valueField: 'value',
            ),
          ),

          SizedBox(height: 10,),

          Text('Effective date of payment'),
          Column(
            children: <Widget>[
              Text(
                "${paymentdate.year} - ${paymentdate.month} - ${paymentdate.day}",
              ),
              MaterialButton(
                child: Text('Choose Date'),
                color: Colors.blueGrey,
                hoverColor: Colors.lightBlueAccent,
                elevation: 4,
                onPressed: () async{
                  final DateTime? dateTime = await showDatePicker(
                    context: context,
                    initialDate: paymentdate,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(3000),
                  );

                  if(dateTime != null){
                    setState(() {
                      paymentdate = dateTime;
                    });
                  }
                },
              ),
            ],
          ),

          SizedBox(height: 10,),

          Text('Reason'),
          SizedBox(
            width: 320,
            child: TextFormField(
                controller: reasonController,
                decoration: InputDecoration(
                  labelText: 'Reason',
                  hintText: 'Reason',
                  suffixIcon: reasonController.text.isEmpty
                      ? Container(width:0)
                      : IconButton(
                    icon:Icon(Icons.close),
                    onPressed: () => reasonController.clear(),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6)
                  ),
                  alignLabelWithHint: true,
                ),
                onSaved: (value) => setState(() => reason = value),
                validator: (value){
                  if(value!.isEmpty){
                    return 'reason is required';
                  }else
                    return null;
                }
            ),
          ),

          SizedBox(height: 10,),

          Text('Currency'),
          SizedBox(
            width: 325,
            child: DropDownField(
              value: currency,
              hintText: 'Select Currency',
              dataSource: ListItems().currencyItems,
              onChanged: (value){
                setState(() {
                  currency = value;
                });
              },
              textField: 'label',
              valueField: 'value',
            ),
          ),

          SizedBox(height: 10,),

          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ElevatedButton(
                child: Text('Save'),
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(300, 60),
                  elevation: 0,
                  backgroundColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  )
                ),
                onPressed: () => _showSuccessDialog(context),
              ),

              SizedBox(height: 3,),

              ElevatedButton(
                child: Text('Cancel'),
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(300, 60),
                  elevation: 0,
                  backgroundColor: Colors.redAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  )
                ),
                onPressed: (){},
              ),
            ],
          ),
        ],
      ),
    );
  }

}